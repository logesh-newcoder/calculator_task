<%@ page import="java.sql.*"%>
<%
	Connection conn=null;

	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
	    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/task_db2", "root", "A45LOGESH");
	}catch(Exception e){
		out.println("The Error message is :"+e);
	}
%>
