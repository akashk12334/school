<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int id=Integer.parseInt(request.getParameter("id"));
    String s=request.getParameter("action");
    try
    {	
    	Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/School", "root", "");
        String u="update request set status=? where id=?" ;
        PreparedStatement p=con.prepareStatement(u);
        p.setString(1,s);
        p.setInt(2,id);
        p.executeUpdate();
        response.sendRedirect("principal.jsp");
        
        
    }
    catch(Exception e)
    {
  		System.out.print(e.getMessage());
  		
    }
    
    %>
