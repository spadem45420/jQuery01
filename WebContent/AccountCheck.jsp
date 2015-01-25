<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*;" %>

<% 
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//SQL Server
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=Northwind";
		String query = "select count(*) from Employees where FirstName=?";
		String name = request.getParameter("name");
		try{
			//SQL Server
			DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
			conn = DriverManager.getConnection(url, "sa", "sa123456");
		
			stmt = conn.prepareStatement(query);
			stmt.setString(1,name);
			
			rs = stmt.executeQuery();
			String strMsg = "帳號不存在";
			
			 rs.next();
			 if(rs.getInt(1) >= 1){
				 strMsg =  "帳號已存在";
			 }
			 out.print(strMsg);
		}
		catch(SQLException e){
			out.println("Error:" + e.getMessage());
		}
		finally{
			if(rs != null){
			   rs.close();
			}
			if(stmt != null){
			 stmt.close();
			}
			if(conn != null){
			}
		}
		 
		//}
%>