<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="daobjects.DBProcess" %>
    <%@ page import="daobjects.DBConnect" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
     <%@ page import="java.sql.PreparedStatement" %>
     <%@ page import=" java.sql.ResultSet" %>
    
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
<%

response.setContentType("text/html");

ArrayList<String> al = new ArrayList<>();
ArrayList<Integer> al1 = new ArrayList<>();
String s = "";
int i = 0;


String city = request.getParameter("city");


System.out.println(city);

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotelbooking","root","");
	con.setAutoCommit(true);

	
     
     PreparedStatement pst=con.prepareStatement("select hotel,hotelid from city where location=?");
     pst.setString(1, city);

    

    ResultSet resultOne=pst.executeQuery();

	%>
<div style="width: 50%; margin-left: 25%; margin-top: 15%;" class="list-group">
  <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
    Available Hotels
  </a>
	<%
	
    while(resultOne.next()){
    	 s=resultOne.getString("hotel");
    	 i=resultOne.getInt("hotelid");
    	 al.add(s);
    	 al1.add(i);
    }
    %>
    
    <%
    System.out.println(al);
    System.out.println(al1);
    con.close();
   
    
}
	catch(Exception e){
		System.out.println(e.getMessage());
		
	}
	


%>

  <a href="hotel1.jsp" class="list-group-item list-group-item-action"><%
  
  
  ServletContext context=getServletContext();  
  String a = al.get(0);
  String b = String.valueOf(al1.get(0));
  context.setAttribute("Name",a);
  context.setAttribute("Name1",b);
  out.println(al.get(0));  %></a>

 

  

  <a href="hotel2.jsp" class="list-group-item list-group-item-action"><%
  
  
  ServletContext context1=getServletContext();  
  String a1 = al.get(1);
  String b1 = String.valueOf(al1.get(1));
  context1.setAttribute("Name2",a1);
  context1.setAttribute("Name3",b1);
  out.println(al.get(1));  %></a>

 
</div>
  


</body>
</html>