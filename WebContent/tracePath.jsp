<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Route Using Google Maps API</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCKiR7oVAlpNrxEPrqNNy_194Mqm_E8lhs&sensor=true"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
      <script src="js/LatLong.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

    <style type="text/css">
      #map {
        width: 600px;
        height: 400px;
        margin-top: 10px;
        align:center;
      }
    </style>
  </head>
  <body>
    <h1>View the Route</h1>
    <form id="find-route" name="find-route" action="#" method="get">
      <label for="from">Source:</label>
      <input type="text" id="from" name="from" required="required" placeholder="Source" class="form-control input-md"/>
      <br />

      <label for="to">Destination:</label>
           <input type="text" id="to" name="to" required="required" placeholder="Destination" class="form-control input-md" required/>
      <br />

      <input type="submit" class="btn btn-success"/>
    </form>
    <div id="map"></div>
    <p id="error"></p>
  </body>
</html>