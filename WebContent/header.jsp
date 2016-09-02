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
<script type="text/javascript">
	function reload_posts() {
		//location.reload();
		//alert("J");
		loadPostDetails($('#postData').val());
		loadPostDetailsRide($('#postDataRide').val());
	}

	function isScrolledIntoView(elem) {
		var docViewTop = $(window).scrollTop();
		var docViewBottom = docViewTop + $(window).height();

		var elemTop = $(elem).offset().top;
		var elemBottom = elemTop + $(elem).height();

		return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
	}

	$(document).ready(function() {
		$('.content').each(function() {
			if (!isScrolledIntoView($(this))) {
				$(this).addClass('hidden');
			}
		});

		$(document).on('scroll', function() {
			$('.hidden').each(function() {
				if (isScrolledIntoView($(this))) {
					$(this).removeClass('hidden').css({
						'display' : 'none'
					}).fadeIn();
				}
			});
		});
	});
</script>
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

				<li id="alert_notificatoin_bar" class="dropdown"
					onclick="reload_posts()"><a
					href="${pageContext.request.contextPath}/Notification"><i
						class="icon-bell-l"></i> <span class="badge bg-important">
							<%
								if (request.getSession().getAttribute("notification") != null) {
									int notification = (Integer) request.getSession().getAttribute("notification");
									request.getSession().setAttribute("notification", 0);
							%> <%=notification%> <%
 	}
 %>
					</span> </a></li>
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
						<li class="eborder-top"><a href="UserEdit"><i
								class="icon_profile"></i>Edit Profile</a></li>
						<li><a href="#"><i class="icon_key_alt"></i> About Us</a></li>
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
						<a href="home.jsp">Home</a>
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
							class="label label-primary">Ottumwa</span> <span
							class="label label-success">Mt. Plesant</span> <span
							class="label label-info">Iowa City</span> <span
							class="label label-warning">Davinport</span> <span
							class="label label-danger">Chicago</span>
					</p>
				</div>
				<div class="well">
					<a href="weatherpage.jsp">Weather Information on Map</a> <a
						href="MapPath.jsp">Trace the Path</a>
				</div>
			</div>