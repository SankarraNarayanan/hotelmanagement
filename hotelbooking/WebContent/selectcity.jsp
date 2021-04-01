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
<form style="margin-left: 30%; margin-top: 15%; " action="displayhotel.jsp">

<select style="height:40px; width: 40%; color: black; font-family: monospace;" id="city" name="city" >
    <option value="salem">salem</option>
    <option value="coimbatore">cbe</option>
</select>
<br><br>
<button style="margin-left: 15%;" type="submit" class="btn btn-primary">Check Hotels</button>
</form>

</body>
</html>