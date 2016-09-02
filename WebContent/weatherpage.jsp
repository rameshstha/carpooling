<%@include file="header.jsp" %>
			<div class="container">
				<div class="col-md-9">
					<div>
						<h2>Weather Activities</h2>

						<div class="col-lg-6">

							<div class="input-group">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" id="btnDestination">Go!</button>
								</span> <input type="text" id="searchDestination"  class="form-control"
									placeholder="Search palaces...">
							</div>
						</div>
					</div>
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#cw"
							aria-controls="cw" role="tab" data-toggle="tab">Current
								Weather</a></li>
						<li role="presentation"><a href="#days5"
							aria-controls="days5" role="tab" data-toggle="tab">5 Days
								forecast</a></li>
						<li role="presentation"><a href="#hours3"
							aria-controls="hours3" role="tab" data-toggle="tab">3 Hours
								forecast</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="cw">
							<h3>Current Weather</h3>

							<div id="map-canvas"
								style="border: 1px solid #000000; position: relative; left: 15px; top: 10px; width: 800px; height: 500px; padding-left: 15px; padding-right: 15px"></div>

						</div>
						<div role="tabpanel" class="tab-pane" id="days5">
							<h3>5 Days forecast</h3>

							<div id="forecast"></div>

						</div>
						<div role="tabpanel" class="tab-pane" id="hours3">
							<h3>3 Hours forecast</h3>

							<div id="forecast3hours"></div>

						</div>

					</div>
				</div>
			</div>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKiR7oVAlpNrxEPrqNNy_194Mqm_E8lhs&callback=initialize"
		type="text/javascript">
		
	</script>
	<script>
		var map;
		var geoJSON;
		var request;
		var google;
		var geocoder;
		//var city="chicago";
		var gettingData = false;
		var APPID = "57f7c30060d95819853114dcab89a2a5";
		var mode  = "json";
		var openWeatherMapKey = "57f7c30060d95819853114dcab89a2a5"
		function initialize(addr) {
			var infowindow = new google.maps.InfoWindow();
			var mapOptions = {
				zoom : 2
			};
			var address = addr || "kathmandu,np";
			var geocoder = new google.maps.Geocoder();
			geocoder.geocode({
				'address' : address
			}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					map.setCenter(results[0].geometry.location);
					map.fitBounds(results[0].geometry.viewport);
					map.setZoom(8);
				}
			});

			map = new google.maps.Map(document.getElementById('map-canvas'),
					mapOptions);
			// Add interaction listeners to make weather requests
			google.maps.event.addListener(map, 'idle', checkIfDataRequested);
			// Sets up and populates the info window with details
			map.data.addListener('click', function(event) {
				infowindow.setContent("<img src="
						+ event.feature.getProperty("icon") + ">"
						+ "<br /><strong>" + event.feature.getProperty("city")
						+ "</strong>" + "<br />"
						+ event.feature.getProperty("temperature") + "&deg;C"
						+ "<br />" + event.feature.getProperty("weather"));
				infowindow.setOptions({
					position : {
						lat : event.latLng.lat(),
						lng : event.latLng.lng()
					},
					pixelOffset : {
						width : 0,
						height : -15
					}
				});
				infowindow.open(map);
			});
		}
		var checkIfDataRequested = function() {
			// Stop extra requests being sent
			while (gettingData === true) {
				request.abort();
				gettingData = false;
			}
			getCoords();
		};
		// Get the coordinates from the Map bounds
		var getCoords = function() {
			var bounds = map.getBounds();
			var NE = bounds.getNorthEast();
			var SW = bounds.getSouthWest();
			getWeather(NE.lat(), NE.lng(), SW.lat(), SW.lng());
		};
		// Make the weather request
		var getWeather = function(northLat, eastLng, southLat, westLng) {
			gettingData = true;
			var requestString = "http://api.openweathermap.org/data/2.5/box/city?bbox="
					+ westLng
					+ ","
					+ northLat
					+ "," //left top
					+ eastLng
					+ ","
					+ southLat
					+ "," //right bottom
					+ map.getZoom()
					+ "&cluster=yes&format=json"
					+ "&APPID="
					+ openWeatherMapKey;
			request = new XMLHttpRequest();
			request.onload = proccessResults;
			request.open("get", requestString, true);
			request.send();
		};
		// Take the JSON results and proccess them
		var proccessResults = function() {
			var results = JSON.parse(this.responseText);
			if (results.list.length > 0) {
				resetData();
				for (var i = 0; i < results.list.length; i++) {
					geoJSON.features.push(jsonToGeoJson(results.list[i]));
				}
				drawIcons(geoJSON);
			}
		};
		/* var infowindow = new google.maps.InfoWindow(); */
		// For each result that comes back, convert the data to geoJSON
		var jsonToGeoJson = function(weatherItem) {
			var feature = {
				type : "Feature",
				properties : {
					city : weatherItem.name,
					weather : weatherItem.weather[0].main,
					temperature : weatherItem.main.temp,
					min : weatherItem.main.temp_min,
					max : weatherItem.main.temp_max,
					humidity : weatherItem.main.humidity,
					pressure : weatherItem.main.pressure,
					windSpeed : weatherItem.wind.speed,
					windDegrees : weatherItem.wind.deg,
					windGust : weatherItem.wind.gust,
					icon : "http://openweathermap.org/img/w/"
							+ weatherItem.weather[0].icon + ".png",
					coordinates : [ weatherItem.coord.lon,
							weatherItem.coord.lat ]
				},
				geometry : {
					type : "Point",
					coordinates : [ weatherItem.coord.lon,
							weatherItem.coord.lat ]
				}
			};
			// Set the custom marker icon
			map.data.setStyle(function(feature) {
				return {
					icon : {
						url : feature.getProperty('icon'),
						anchor : new google.maps.Point(25, 25)
					}
				};
			});
			// returns object
			return feature;
		};
		// Add the markers to the map
		var drawIcons = function(weather) {
			map.data.addGeoJson(geoJSON);
			// Set the flag to finished
			gettingData = false;
		};
		// Clear data layer and geoJSON
		var resetData = function() {
			geoJSON = {
				type : "FeatureCollection",
				features : []
			};
			map.data.forEach(function(feature) {
				map.data.remove(feature);
			});
		};
		//google.maps.event.addDomListener(window, 'load', initialize);

		$("#btnDestination").click(function() {
			var city = $("#searchDestination").val();
			initialize(city);
			
			//changed code start
		        $.ajax("http://api.openweathermap.org/data/2.5/forecast/daily",{
					 "type":"GET","data":{"q":city,"cnt":"5","mode":mode,"APPID":APPID}})
					 .success(function(response){
						 var date = new Date();
						 var table="<table class='table'>";
						 table+="<tr><td>Date/Time</td><td>Description</td><td>Max.Temperature</td><td>Humidity</td>";
						 table+="</tr>";
						 
			 			 var forecast5days = $("#forecast");
						 $.each(response.list,function(index,obj){
							 
							 table+="<tr>";
							 table+="<td>"+new Date(obj.dt * 1000)+"</td>";
							 table+="<td>"+obj.weather[0].description+"</td>";
							 table+="<td>"+obj.temp.max+"</td>";
							 table+="<td>"+obj.humidity+"</td>";
							 table+="</tr>";
					 	 
						 });
						 $("#forecast").html('').html(table);
						 
					 })
					 .error(function(){
						console.log("Error"); 
					 }); 
			
		        
		      /// 3hours forecast
				 $.ajax("http://api.openweathermap.org/data/2.5/forecast",{
					 "type":"GET","data":{"q":city,"mode":mode,"APPID":APPID}})
					 .success(function(response){
						 
						 var table="<table class='table'>";
						 table+="<tr><td>Date/Time</td><td>Description</td><td>Max.Temperature</td><td>Humidity</td>";
						 table+="</tr>";
						 
			 			 var forecast3hours = $("#forecast3hours");
						 $.each(response.list,function(index,obj){
							 
							 table+="<tr>";
							 table+="<td>"+obj.dt_txt+"</td>";
							 table+="<td>"+obj.weather[0].description+"</td>";
							 table+="<td>"+obj.main.temp_max+"</td>";
							 table+="<td>"+obj.main.humidity+"</td>";
							 table+="</tr>";
					 	 
						 });	
						 $("#forecast3hours").html('').html(table);
						 		 
					 })
					 .error(function(){
						console.log("error"); 
					 });
			//changed code end
			
		       
		});
	
	</script>
<%@include file="footer.jsp" %>

