<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>View Details</title>
<style >
tr,td,th
{

border:2px solid yellow;
}
tr,td
{
background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
}
.b
{
 background-color: #2c3e50;
}



</style>
</head>
<body>
<main>
<%
String who=request.getParameter("who");
int id=Integer.parseInt(request.getParameter("id"));
String role=request.getParameter("role");
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/School", "root", "");
	
	
		
		String q="select*from student where studentid="+id;
		Statement p=con.createStatement();
		ResultSet r=p.executeQuery(q);
		%>
		<!-- Teachers -->
	    <div style=" heigth:100vp;overflow:hidden; position:relative;">
	    
	    <img src="https://i.postimg.cc/LsvFXRsx/create-a-image-that-has-magical-students-theme-in-both-side-leave-space-in-center-dark-colors-and-as.jpg" heigth=100%; width=100%>
		<div style="position:absolute; top:50%; left:50%; transform:translate(-50%, -50%);
      background: linear-gradient(to right, #3f6f9f, #0a0a0a, #ff9a9e);
 padding:30px; border-radius:12px; box-shadow:0 4px 15px rgba(0,0,0,0.3); max-width:800px; width:90%">
        <center><img alt="logo" src="https://i.postimg.cc/vmKdb2gf/pngwing-com.png" height="20%" width="30%">
		<h2 style=" font-weight: bold;font-family: 'Cinzel', serif; color:white;">Hogwards<br>Students DetailS</h2>
		<table class="table table-striped table-hover" Style="font-family: 'Cinzel', serif; ">
		<tr >
		<th Style="color:white;background-color: #2c3e50;">Student ID</th>
		<th Style="color:white;background-color: #2c3e50;">student Name</th>
		<th Style="color:white;background-color: #2c3e50;">Address</th>
		<th Style="color:white;background-color: #2c3e50;">Mark</th>
		<th Style="color:white;background-color: #2c3e50;">Action</th>
		</tr>
		
		<%
		if(r.next())
		{
			%>
			<tr >
			<td Style="color:white;"><p><%=r.getInt("studentid")%></p></td>
			<td Style="color:white;"><%=r.getString("name") %></td>
			<td Style="color:white;"><%=r.getString("address") %></td>
			<td Style="color:white;"><%=r.getInt("mark")%></td>
			<td > <a href="roleverifier.jsp?id=<%=r.getInt("studentid")%>&who=student&role=<%=role%>" class="btn btn-success btn-sm">EDIT</a>
			
			</tr>
			
			
			<% 
		}
		%></table>
		<% session.setAttribute("id",id); %>
		<a href="student.jsp" class="btn btn-primary mt-3"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
</svg>
</svg>Back</a>
		</div>
		</div>
		<%
		
	
	
	}
catch(Exception e)
{ e.printStackTrace();
	System.out.print(e.getMessage());
}
%>
</main>
</body>
</html>