<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 String role=request.getParameter("who");
 int id=Integer.parseInt(request.getParameter("id"));
 try
 {
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/School", "root", "");
	 if(role.equals("student"))
	 {
		 String d="delete from student where studentid=?";
		 PreparedStatement ps=con.prepareStatement(d);
		 ps.setInt(1,id);
		 ps.execute();
		 response.sendRedirect("principal.jsp");
	 }
	 else if(role.equals("teacher"))
	 {
		 String d="delete from teachers where teachers_id=?";
		 PreparedStatement ps=con.prepareStatement(d);
		 ps.setInt(1,id);
		 ps.execute();
		 response.sendRedirect("principal.jsp");
	 }
 }
 catch(Exception e)
 {
	 System.out.println(e.getMessage());
 }
 %>
