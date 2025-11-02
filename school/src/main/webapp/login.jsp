<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" href="https://i.postimg.cc/vmKdb2gf/pngwing-com.png" >
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<title>login</title>
</head>
<style>
.center {
  margin: auto;
  width: 50%;
  border: 3px;
  padding: 10px;
}
</style>
<body>
<main>
<div style="height:100vh; overflow:hidden; position:relative;">
<img alt="background" src=" https://i.postimg.cc/9fH7kYVp/hogwards-school-animation-video-welcoming-the-students-with-magical-effect-and-encouraging-them-to-l.jpg" style="width:100%; height:100%; object-fit:cover;">
<!--...... input...... -->
 <form method="post" class="text-center" style="position:absolute; top:50%; left:50%; transform:translate(-50%, -50%);
        background-color:#fff; padding:30px; border-radius:12px; box-shadow:0 4px 15px rgba(0,0,0,0.3); max-width:400px; width:90%;">
    <h2 class="mb-4">Login</h2>
	<div class="mb-3 text-start">
      <label for="username" class="form-label"> Username</label>
      <input type="text" id="username" name="username" placeholder="enter username e.g. onesimeu123" class="form-control">
    </div>

 	<div class="mb-3 text-start">
      <label for="password" class="form-label">Password</label>
      <input type="password" id="password" name="password" required class="form-control">
    </div>
<button type="submit" class="btn btn-success w-100">Login</button>
<%
String usernam=request.getParameter("username");
String password=request.getParameter("password");
try
{
	 Class.forName("com.mysql.cj.jdbc.Driver");
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/School", "root", "");
	 String q="select * from login where username=? and password=?;";
	 PreparedStatement s=con.prepareStatement(q);
	 s.setString(1,usernam);
	 s.setString(2,password);
	 ResultSet r=s.executeQuery();
	 Statement count = con.createStatement();
	    ResultSet rs = count.executeQuery("SELECT * FROM request;");
	    int c=0;
	    while(rs.next())
	    {
	    	c++;
	    }
	    
	 while(r.next())
	 {
	
	 if (r.getString("role").equals("teacher"))
	 {
		 session.setAttribute("id",r.getInt("id"));
		 response.sendRedirect("teachers.jsp");
	 }
	 else if(r.getString("role").equals("principal"))
		 
	 {     
		 session.setAttribute("count",c);
		 response.sendRedirect("principal.jsp");
	 }
	 else if(r.getString("role").equals("student"))
	 {   session.setAttribute("id",r.getInt("id"));
		 session.setAttribute("role",r.getString("role"));
		 response.sendRedirect("student.jsp");
	 }
	 else
	 {
		 System.out.println("wrong pass");
	 }
	 
	 }
	 
}
catch(Exception e)
{
	e.printStackTrace();
	System.out.println(e.getMessage());
}
%>
</form>
</div>

</main>
</body>
</html>