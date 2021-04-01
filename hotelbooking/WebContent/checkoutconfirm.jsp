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
<meta charset="ISO-8859-1">
<script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
<title></title>
</head>
<body>
<script>
setTimeout(function () { 
	swal({
	  title: "Payment Success",
	  text: "payment Successful",
	  type: "success",
	  confirmButtonText: "OK"
	},
	function(isConfirm){
	  if (isConfirm) {
	    window.location.href = "selectcity.jsp";
	  }
	}); }, 200);
</script>
<%
ServletContext context5=getServletContext();  
String n=(String)context5.getAttribute("usid");  
int nt = Integer.parseInt(n);
int amt = Integer.parseInt(request.getParameter("price"));
System.out.println(amt);
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotelbooking","root","");
	con.setAutoCommit(true);
	ServletContext context4=getServletContext();  
	String walletamount=(String)context4.getAttribute("wallet");  
	  int walletamt = Integer.parseInt(walletamount);
	  System.out.println(walletamt);
	  int res = walletamt-amt;
	  if(res<walletamt)
	  {
		  PreparedStatement pst1=con.prepareStatement("update login SET wallet = ? where uid=?");
		   pst1.setInt(1, res);
		   pst1.setInt(2, nt);
		  
		  pst1.executeUpdate();
	  }
	  else
	  {
		  out.println("Not enough Money");
	  }

%>
<%
    System.out.println(walletamt+" "+nt);

    con.close();
   
    
}
	catch(Exception e){
		System.out.println(e.getMessage());
		
	}

%>
</body>
</html>