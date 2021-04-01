package adduser;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)  
	        throws ServletException, IOException {  
	  addperson au = new addperson();
	    response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();  
	    String n=request.getParameter("username");  
	    String p=request.getParameter("password");  
	     System.out.print(n);
	     
	     String result1 = au.checkWheatherSameUser(n);
			if(result1.equals("Valid")){
				String result2 = au.spdatas(n,p);
				RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
				rd.forward(request,response);
			}
	}

}
