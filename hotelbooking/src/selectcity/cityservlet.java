package selectcity;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class cityservlet
 */
@WebServlet("/cityservlet")
public class cityservlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		

		
		String city = request.getParameter("city");
		
		
		System.out.println(city);
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotelbooking","root","");
			con.setAutoCommit(true);

			int flag=0;
			Statement st=con.createStatement();
			int userId=0;
			
			
			String query="SELECT * FROM `city`";
			
			ResultSet resultOne=st.executeQuery(query);
	        while(resultOne.next()){
	        	
	        		System.out.println(resultOne.getString("hotel"));
	        		

	        }
	        con.close();
	        
	        
	 }
			catch(Exception e){
				System.out.println(e.getMessage());
				
			}
			
		}
	}


