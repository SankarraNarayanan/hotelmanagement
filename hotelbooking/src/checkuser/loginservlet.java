package checkuser;

import java.io.IOException;
import java.io.PrintWriter;
import daobjects.DBProcess;
import daobjects.DBConnect;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.ServletContext;

import checkuser.userlogin;

/**
 * Servlet implementation class loginservlet
 */
@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		userlogin cl = new userlogin();
		
		String username = request.getParameter("username");
		String password =request.getParameter("password");
		int us = 0;
		String result=cl.validateClient(username, password);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotelbooking","root","");
			con.setAutoCommit(true);

			
		     
			PreparedStatement pst=con.prepareStatement("select uid from login where username=?");
		    pst.setString(1, username);

		   

		   ResultSet resultOne=pst.executeQuery();
		   
			   while(resultOne.next())
			    {
				   us=resultOne.getInt("uid");
			    }
			   con.close();
			   
			    
		   }
		   	catch(Exception e){
		   		System.out.println(e.getMessage());
		   		
		   	}
		   	
		javax.servlet.ServletContext context2=getServletContext(); 
		context2.setAttribute("userid",String.valueOf(us));
		if(result.equals("Sucess")){
			
			System.out.println("Done");
			RequestDispatcher rd = request.getRequestDispatcher("/selectcity.jsp");
			rd.forward(request,response);
		}
		else{
			System.out.println("No");
			RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
			rd.forward(request,response);
		}
	}
}
