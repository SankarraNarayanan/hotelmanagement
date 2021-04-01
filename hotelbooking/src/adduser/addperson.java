package adduser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class addperson {
	public String spdatas(String username,String password){
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotelbooking","root","");
		con.setAutoCommit(true);

		Statement st=con.createStatement();
		
		String query="insert into login values(?,?)";
		PreparedStatement ps = con.prepareStatement(query);
		
		ps.setString(1, username);
		ps.setString(2, password);
		
		ps.executeUpdate();
		
		con.close();
		System.out.println("Sucessfully done");
		return "Inserted Sucessfully";
		
		
		}
		catch(Exception e){
			System.out.println("Exception2"+e.getMessage());
			return "Exception-------->"+e;
		}
	
	}
	public String checkWheatherSameUser(String usname){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotelbooking","root","");
			con.setAutoCommit(true);

			Statement st=con.createStatement();
			int flag=0;
			String query="select * from login";
			ResultSet resultOne=st.executeQuery(query);
			
			while(resultOne.next()){
				if(resultOne.getString("username").equals(usname)){
					System.out.println(resultOne.getString("username"));
					System.out.println("Inside Flag0");
					flag=0;
					break;
				}
				else{
					flag=1;
				}
			}
			
			con.close();
			if(flag==1){
				System.out.println("Valid");
				return "Valid";
			}
			else{
				System.out.println("Invalid");
				return "Invalid";
			}
			
		}
			catch(Exception e){
				System.out.println("Exception2"+e.getMessage());
				return "Exception-------->"+e;
			}
	}
}
