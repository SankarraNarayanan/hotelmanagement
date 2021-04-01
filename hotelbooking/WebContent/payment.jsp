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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int i =Integer.parseInt(request.getParameter("id"));
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotelbooking","root","");
	con.setAutoCommit(true);
	ServletContext context2=getServletContext();  
	String n=(String)context2.getAttribute("userid");  
  int nt = Integer.parseInt(n);
	int amount = 0;
	
	  ServletContext context5=getServletContext();  
		 
	  context5.setAttribute("usid",String.valueOf(nt));
	PreparedStatement pst=con.prepareStatement("select hotelname,roomtype,location,price from hotel where hid=?");
    pst.setInt(1, i);

    

   ResultSet resultOne=pst.executeQuery();
   PreparedStatement pst1=con.prepareStatement("select wallet from login where uid=?");
   pst1.setInt(1, nt);
  
  
   ResultSet rs=pst1.executeQuery();

   while(rs.next())
   {
       amount = rs.getInt("wallet");
   }
   ServletContext context4=getServletContext();  
	 
	  context4.setAttribute("wallet",String.valueOf(amount));
%>
<div align="right">
<h1>Wallet amount</h1>
<h2><%out.println(amount); %></h2>
</div>
<div align="center">
    <h1>Check Out</h1>
    <br/>
    <form action="checkoutconfirm.jsp" method="post">
    <table>
     <%
    while(resultOne.next())
    {
    	%>
    	<tr>
            <td>Hotel Name:</td>
            <td><input type="text" name="hotelname" value="<% out.println(resultOne.getString("hotelname"));%>" /></td>
        </tr>
        <tr>
            <td>Room type:</td>
            <td><input type="text" name="roomtype" value="<% out.println(resultOne.getString("roomtype"));%>" /></td>
        </tr>
        <tr>
            <td>Location:</td>
            <td><input type="text" name="location"  value="<% out.println(resultOne.getString("location"));%>"/></td>
        </tr>    
        <tr>
            <td>Price:</td>
            <td><input type="text" name="price" value="<% out.println(resultOne.getInt("price"));%>"/></td>
        </tr>    
        
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Checkout" />
            </td>
        </tr>
    	 <%
    	 break;
    }
    %>
        
    </table>
    </form>
    <%
    System.out.println(amount);

    con.close();
   
    
}
	catch(Exception e){
		System.out.println(e.getMessage());
		
	}

%>
</div>
</body>
</html>