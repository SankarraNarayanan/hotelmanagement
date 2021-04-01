<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="daobjects.DBProcess" %>
    <%@ page import="daobjects.DBConnect" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="javax.servlet.*" %>
     <%@ page import="javax.servlet.annotation.WebServlet" %>
      <%@ page import="javax.servlet.http.*" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" />
<link rel="stylesheet" href="inquiry.css" />
<script src=”https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js”></script>
<script src=”https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js”></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="font-family: cursive; margin-left: 40px;">Please signup to continue!</h1>
<form style="margin-top: 10%; margin-left: 30%; padding: 50px;" action="AddUser"  method="post">
<div " class="form-row">
    <div class="col">
<input  type="text" name="username"   required="required" placeholder="username"  ><br><br>
<input type="password" name="password"  required="required" placeholder="password"><br><br>
<button type="submit" class="btn btn-primary">Signup</button>
</div>
</div>
</form>
</body>
</html>