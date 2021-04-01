package checkuser;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class userlogin {
	public String validateClient(String username,String password){
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/hotelbooking","root","");
		con.setAutoCommit(true);

		int flag=0;
		Statement st=con.createStatement();
		int userId=0;
		
		String query="SELECT * FROM `login`";
		
		ResultSet resultOne=st.executeQuery(query);
        while(resultOne.next()){
        	if(resultOne.getString("username").equals(username) && resultOne.getString("password").equals(password)){
        		System.out.println(resultOne.getString("username"));
        		System.out.println(resultOne.getString("password"));
 
           	 flag=1;
           	 break;
           }
           else{
        	   System.out.println("YO!!!");
           	flag=0;
           }
     
        }
        con.close();
        
        if(flag==1){
        	return "Sucess";
        }
        else{
        	return "invalid";
        }
      
 }
		catch(Exception e){
			System.out.println(e.getMessage());
			return "Exception-------->"+e;
		}
		
	}
	
}

