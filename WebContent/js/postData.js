"use strict";
$(function() {
	$("#loader").hide().ajaxStart(function() {
		$(this).show();
	}).ajaxStop(function() {
		$(this).hide();
	});

		loadPostDetails($('#postData').val());
		loadPostDetailsRide($('#postDataRide').val());
});

function loadPostDetails(data) {
	$("#mainContainer").html("");
	if (data == "") {
		alert("Data needed");
	} else {

		$.ajax({
					"type" : "GET",
					"data" : JSON.parse(data)

				})
				.done(
						function() {
							var test_html ="";
							for (var i = 0; i < JSON.parse(data).length; i++) {
								
								test_html += "<div class='box' id='post_box"+JSON.parse(data)[i].postid+"'  style='width:100%; border:1px' ><p><em>" + JSON.parse(data)[i].source +"</em>&nbsp; to &nbsp; <em>"+JSON.parse(data)[i].destination 
								+ "</em></p>"+"<p>" + JSON.parse(data)[i].seat+"<em> Seat Required :: Non Smoker"
								+ "</em></p>"+"<p>On:" + JSON.parse(data)[i].dateandtime + "</em>,&nbsp;<em> By: " + JSON.parse(data)[i].fullname
								+ "</em></p>"+" <em><button id=\"likeClick\" class=\"btn btn-success\" data-postid=\""
								+ JSON.parse(data)[i].postid
								+ "\">Like</button>&nbsp;&nbsp;<button id=\"showComment\" class=\"btn btn-default\" data-postid=\""
								+ JSON.parse(data)[i].postid
								+ "\">Show Comment</button></em></p>"+"<div id='sho_comment_div"+JSON.parse(data)[i].postid+"' hidden><textarea rows='2' cols='25'  class='commentbox' data-postid=\""
												+ JSON.parse(data)[i].postid+"\"></textarea></div>"+"</div>";
								
							}
							$("#mainContainer").html(test_html);
						}).fail(
						function(xhr, statusText, errorText) {
							$("#mainContainer").html(
									"<div class='error'><h1>" + xhr.status
											+ "</h1>" + errorText + "</div>");
							
						});
		
		$(document).on("keypress",".commentbox",function(e){
			if(e.which==13){
				var comment=$(this).val();
				var postid = $(this).data("postid");
							
				$.ajax("/Carpooling/Comment",{
					"type":"post",
					"data":{"comment":comment,"postid":postid}
				}).success(function(response){
					if(response!=null){
						$(".alert-success").show("slow").html("Added Comment Sucessfully");
						location.href=location.href;
					}
				});
				
			}
		});
		
		$("#mainContainer").on("click", "#showComment", function() {
			
			
			var postid = $(this).data("postid");
			
			var my = $(this);
			var currenDivtId = "sho_comment_div"+postid;
			$("#"+currenDivtId).show();
		
			$.ajax({
				"url":"/Carpooling/Comment",
				"type" : "GET",
				"data":{"postid":postid}
			}).done(function(allcomment) {
				var allContent=" ";
				  allContent = "<div> "; 
				  for (var j = 0; j <JSON.parse(allcomment).length; j++) { 
					  allContent += "<p>"+JSON.parse(allcomment)[j].comment +"</p><br>"; 
				  		}
				  allContent += "</div>"; 
				  my.after($(allContent));
			})
			
		});
		
		
		$("#mainContainer").on("click", "#likeClick", function() {
			var postid = $(this).data("postid");
			var my = $(this);
			$.ajax({
				"url":"/Carpooling/Like",
				"type" : "POST",
				"data":{"postid":postid}
			}).done(function(response) {
				if(response!=null){
					$(".alert-success").show("slow").html("Like Sucessfully");
					location.href=location.href;
				}

			})

		});
	}
};

function loadPostDetailsRide(data) {

	$("#mainContainer").html("");
	if (data == "") {
		alert("Data needed");
	} else {

		$.ajax({
					"type" : "GET",
					"data" : JSON.parse(data)

				})
				.done(
						function() {
							for (var i = 0; i < JSON.parse(data).length; i++) {
								$("#mainContainerRide").append("<div class=\"box\">");
								$("#mainContainerRide").append(
										"<p><em>" + JSON.parse(data)[i].source +"</em>&nbsp; to &nbsp; <em>"+JSON.parse(data)[i].destination
												+ "</em></p>");
								$("#mainContainerRide").append(
										"<p>" + JSON.parse(data)[i].seat+"<em> Seat Required :: Non Smoker"
												+ "</em></p>");
								$("#mainContainerRide").append(
										"<p>On:" + JSON.parse(data)[i].dateandtime + "</em>,&nbsp;<em> For: " + JSON.parse(data)[i].fullname
												+ "</em></p>");
				
								$("#mainContainerRide")
										.append(
												" <em><button id=\"likeClickRide\" class=\"btn btn-success\" data-postidRide=\""
														+ JSON.parse(data)[i].postid
														+ "\">Like</button>&nbsp;&nbsp;<button id=\"showCommentRide\" class=\"btn btn-default\" data-postid=\""
														+ JSON.parse(data)[i].postid
														+ "\">Show Comment</button></em></p>");
								$("#mainContainerRide").append("</div>");
							}

						}).fail(
						function(xhr, statusText, errorText) {
							$("#mainContainerRide").html(
									"<div class='error'><h1>" + xhr.status
											+ "</h1>" + errorText + "</div>");
							// console.log(xhr.status+" -- "+statusText+" --
							// "+errorText);

						});
		
	}
};

