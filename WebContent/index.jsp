<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
    <div class="container">
        <div id="login-box" class="loginBox">
            <h2>Login In</h2>
            <form name="loginForm" action="UserLogin" method="post">
            <% if(request.getSession().getAttribute("error")!=null) {%>
            <div><%= request.getSession().getAttribute("error") %>
              </div><%} %>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" class="form-control" required/>
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