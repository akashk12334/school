<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int id=Integer.parseInt(request.getParameter("id"));
    String role=request.getParameter("role");
 String status=request.getParameter("s");
    try
    {	
    	Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/School", "root", "");
      
        if(role.equals("teacher"))
        {
        	String v="select * from teachers where teachers_id="+id;
            PreparedStatement p=con.prepareStatement(v);
            ResultSet r=p.executeQuery();
        if(r.next())
        {
        String u="insert into request (teachers_id,name,actiontype,status)values(?,?,?,'pending') ";
        PreparedStatement ps=con.prepareStatement(u);
        ps.setString(2,r.getString("name"));
        ps.setString(3,status);
        ps.setInt(1,r.getInt("teachers_id"));
        ps.executeUpdate();
        }
        response.sendRedirect("teachers.jsp");
        }

        else if(role.equals("student"))
        {
        	String v="select * from student where studentid="+id;
            PreparedStatement p=con.prepareStatement(v);
            ResultSet r=p.executeQuery();
        if(r.next())
        {
        String u="insert into studentrequest (studentid,name,actiontype,status)values(?,?,?,'pending') ";
        PreparedStatement ps=con.prepareStatement(u);
        ps.setString(2,r.getString("name"));
        ps.setString(3,status);
        ps.setInt(1,r.getInt("studentid"));
        ps.executeUpdate();
        }
        response.sendRedirect("student.jsp");
        }
        
        
    }
    catch(Exception e)
    {
  		System.out.print(e.getMessage());
  		
    }
    
    %>
