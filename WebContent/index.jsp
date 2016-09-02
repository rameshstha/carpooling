<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="ct" uri="/WEB-INF/CustomTag/carpoolingCustomTag.tld"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!-- Bootstrap core CSS -->
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<title>Carpooling::Login</title>
</head>
<body>
	<div class="container-wrapper">
    <div style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-2">
        <div id="login-box" class="loginBox" >
            <h2>Login In</h2>
            <form name="loginForm" action="UserLogin" method="post">
            <% if(request.getSession().getAttribute("error")!=null) {
            String error=(String)request.getSession().getAttribute("error");
            %>
            <div><ct:Label textColor='red' text='<%= error%>'/>
              </div><%} %>
              
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" class="form-control" placeholder="Email" required/>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" required/>
                </div>
                <input type="submit" value="Submit" class="btn btn-success btnWidth120">
                <input type="reset" value="Reset" class="btn btn-danger btnWidth120">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
        </div>
        	<div>
				<p>forgot your password? <a href="#">click here</a></p>
				<p>new user? <a href="newProfile.jsp">create new profile</a></p>
			</div>
        </div></div>
</body>
</html>