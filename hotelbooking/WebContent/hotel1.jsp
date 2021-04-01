<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.*" %>
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
<%
ServletContext context1=getServletContext();  
String n=(String)context1.getAttribute("Name");  

String n1=(String)context1.getAttribute("Name1");  
int h = Integer.parseInt(n1);

%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotelbooking","root","");
	con.setAutoCommit(true);

	
     
	PreparedStatement pst=con.prepareStatement("select hid,hotelname,roomtype from hotel where hotelid=?");
    pst.setInt(1, h);

   

   ResultSet resultOne=pst.executeQuery();
	%>
	
   <table style="width: 50%; margin-left: 25%; margin-top: 10%;" class="table">
  <thead>
    <tr>
       
      <th scope="col">Hotel Name</th>
      <th scope="col">Room type</th>
      
    </tr>
  </thead>
  <tbody>
    <%
    while(resultOne.next())
    {
    	%>
    <tr>
      
      <td><%out.println(resultOne.getString("hotelname"));%></td>
      <td><%out.println(""+"<a href='payment.jsp?id="+resultOne.getInt("hid")+"'>"+resultOne.getString("roomtype")+"</a>"+"");%></td>
      
    </tr>
    	
     <%
    }
    %>
    </table>
 <%

    con.close();
   
    
}
	catch(Exception e){
		System.out.println(e.getMessage());
		
	}
	


%>

</body>
</html>