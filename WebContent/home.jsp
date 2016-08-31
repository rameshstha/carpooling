<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.carpooling.service.*"%>
<%@ taglib prefix="ct" uri="/WEB-INF/CustomTag/carpoolingCustomTag.tld"%>
<!DOCTYPE html>
<html>
<head>
<title>Main Page::CarPool</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ=="
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
<script src="js/postData.js" type="text/javascript"></script>
<link href="css/mypost.css" rel="stylesheet" />
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link href="css/style.css" rel="stylesheet">
</head>

<body>
	<header class="header dark-bg">
		<div class="toggle-nav">
			<div class="icon-reorder tooltips"
				data-original-title="Toggle Navigation" data-placement="bottom">
				<i class="icon_menu"></i>
			</div>
		</div>

		<!--logo start-->
		<a href="home.jsp" class="logo">Car<span class="lite">Pooling</span></a>
		<!--logo end-->

		<div class="nav search-row" id="top_menu">
			<!--  search form start -->
			<ul class="nav top-menu">
				<li>
					<form class="navbar-form">
						<input class="form-control" placeholder="Search" type="text">
					</form>
				</li>
			</ul>
			<!--  search form end -->
		</div>

		<div class="top-nav notification-row">
			<!-- notificatoin dropdown start-->
			<ul class="nav pull-right top-menu">

				<!-- inbox notificatoin end -->
				<!-- alert notification start-->
				<li id="alert_notificatoin_bar" class="dropdown"><a
					data-toggle="dropdown" class="dropdown-toggle" href="#"> <i
						class="icon-bell-l"></i> <span class="badge bg-important">7</span>
				</a></li>
				<!-- alert notification end-->
				<!-- user login dropdown start-->
				<li class="dropdown"><a data-toggle="dropdown"
					class="dropdown-toggle" href="#"> <span class="profile-ava">
							<img alt="" src="img/avatar1_small.jpg">
					</span> <span class="username"><%=request.getSession().getAttribute("username")%></span>
						<b class="caret"></b>
				</a>
					<ul class="dropdown-menu extended logout">
						<div class="log-arrow-up"></div>
						<li class="eborder-top"><a href="#"><i
								class="icon_profile"></i> My Profile</a></li>
						<li><a href="#"><i class="icon_mail_alt"></i> My Post</a></li>
						<li><a href="documentation.html"><i class="icon_key_alt"></i>
								Documentation</a></li>
						<li><a href="LogOut"><i class="icon_key_alt"></i> Log Out</a></li>
					</ul></li>
				<!-- user login drop down end -->
			</ul>
			<!-- notification drop down end-->
		</div>
	</header>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container text-center">
		<div class="row">

			<!--  left side bar -->
			<div class="col-sm-3 well">
				<div class="well">
					<p>
						<a href="#">My Profile</a>
					</p>
					<img src="img/avatar1_small.jpg" class="img-circle" height="65"
						width="65" alt="Avatar">
				</div>
				<div class="well">
					<p>
						<a href="#">Most Carpooled Location</a>
					</p>
					<p>
						<span class="label label-default">Fairfield</span> <span
							class="label label-primary">Ottumba</span> <span
							class="label label-success">Mt. Plesant</span> <span
							class="label label-info">Iowa City</span> <span
							class="label label-warning">Fairfield</span> <span
							class="label label-danger">Fairfield</span>
					</p>
				</div>
				<div class="well">
					<div id="map" style="width: 200px; height: 200px"></div>
				</div>
			</div>
			<div class="container">
				<div class="col-md-9">

					<ul class="nav nav-tabs" role="tablist">
						<li class="active"><a href="#posts" role="tab"
							data-toggle="tab">Posts Ride</a></li>
						<li><a href="##askforride" role="tab" data-toggle="tab">Ask
								For Ride</a></li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">
						<div class="tab-pane active" id="posts">
							<!-- first tab-->
							<div class="modal-content">
								<div class="modal-header">
									<strong>Ride Offer</strong>
								</div>
								<%
									if (request.getSession().getAttribute("errorPosting") != null) {
										String errorPosting = (String) request.getSession().getAttribute("errorPosting");
								%>

								<div>
									<ct:Label textColor='red' text='<%=errorPosting%>' />
								</div>
								<%
									}
								%>
								<form class="form center-block" action="PostInfo" method="post">
									<div class="modal-body">

										<div class="form-group">
											<textarea class="form-control input-md" autofocus
												placeholder="What do you want to share?" name="post"></textarea>
										</div>

									</div>
									<div class="modal-footer">
										<button class="btn btn-primary btn-md" data-dismiss="modal"
											aria-hidden="true">Post</button>
										<div class="col-xs-2">
											<input class="form-control" placeholder="From" id="from"
												name="from" type="text" required>
										</div>
										<div class="col-xs-2">
											<input class="form-control" placeholder="To" id="to"
												name="to" type="text" required>
										</div>
										<div class="col-xs-2">
											<input class="form-control" placeholder="Seats" id="seat"
												name="seat" type="text" required>
										</div>
										<div class="col-xs-3">
											<input class="form-control" placeholder="MM/DD/YYYY HH:MM"
												id="date" name="dateandTime" type="text" required>
										</div>
										<div class="col-xs-2">
											<div class="radio">
												<label><input type="radio" name="posttype" value="1"
													checked>Ride(Offer)</label>
											</div>
										</div>
									</div>
								</form>
							</div>

							<!-- existing post listing -->

							<div class="col-md-12">
								<ul class="list-inline social-links"></ul>
								<ul class="list-inline social-links"></ul>
								<%
									if (request.getSession().getAttribute("jsonArray") != null) {
										JSONArray jsonArray = (JSONArray) request.getSession().getAttribute("jsonArray");
								%>
								<input type="hidden" value='<%=jsonArray%>' id="postData">

								<%
									}
								%>
								<div class="well">
									<div id="mainContainer"></div>
									<div id="loader"></div>
								</div>
							</div>
							<!-- last first tab-->
						</div>
						<div class="tab-pane" id="askforride">
						<!-- second tab -->
						<div class="modal-content">
								<div class="modal-header">
									<strong>Ask For Ride</strong>
								</div>
								<%
									if (request.getSession().getAttribute("errorAskForRide") != null) {
										String errorAskForRide = (String) request.getSession().getAttribute("errorAskForRide");
								%>

								<div>
									<ct:Label textColor='red' text='<%=errorAskForRide%>' />
								</div>
								<%
									}
								%>
								<form class="form center-block" action="PostInfoRide" method="post">
									<div class="modal-body">

										<div class="form-group">
											<textarea class="form-control input-md" autofocus
												placeholder="What do you want to share?" name="postRide"></textarea>
										</div>

									</div>
									<div class="modal-footer">
										<button class="btn btn-primary btn-md" data-dismiss="modal"
											aria-hidden="true">Post</button>
										<div class="col-xs-2">
											<input class="form-control" placeholder="From" id="fromRide"
												name="fromRide" type="text" required>
										</div>
										<div class="col-xs-2">
											<input class="form-control" placeholder="To" id="toRide"
												name="toRide" type="text" required>
										</div>
										<div class="col-xs-2">
											<input class="form-control" placeholder="Seats" id="seatRide"
												name="seatRide" type="text" required>
										</div>
										<div class="col-xs-3">
											<input class="form-control" placeholder="MM/DD/YYYY HH:MM"
												id="date" name="dateandTimeRide" type="text" required>
										</div>
										<div class="col-xs-2">
											<div class="radio">
												<label><input type="radio" name="posttypeRide" value="0" checked>Ride(Asking)</label>
											</div>
										</div>
									</div>
								</form>
							</div>

							<!-- existing post listing -->

							<div class="col-md-12">
								<ul class="list-inline social-links"></ul>
								<ul class="list-inline social-links"></ul>
								<%
									if (request.getSession().getAttribute("jsonArrayRide") != null) {
										JSONArray jsonArrayRide = (JSONArray) request.getSession().getAttribute("jsonArrayRide");
								%>
								<input type="hidden" value='<%= jsonArrayRide%>' id="postDataRide">

								<%
									}
								%>
								<div class="well">
									<div id="mainContainerRide"></div>
								</div>
							</div>
						<!-- end second tab -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

