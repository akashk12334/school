<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="https://i.postimg.cc/vmKdb2gf/pngwing-com.png" sizes="256x256">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<%
String w=request.getParameter("who");
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/School", "root", "");
    if(w.equals("student"))
    {
   
    %>
<main>
<div style="height:100vh;background: linear-gradient(to bottom, #0a1f3d, #1c3a5f, #2e567f, #3f6f9f);
    font-family: 'Georgia', serif;
">
<form method="post" class="text-center" style="position:absolute; top:50%; left:50%; transform:translate(-50%, -50%);
        background: linear-gradient(to bottom right, #f5f5f5, #dcdde1);
 padding:30px; border-radius:12px;box-shadow: 0 0 25px rgba(160, 196, 157, 0.3);
 max-width:400px; width:90%; font-weight: bold;" method="post" >
 
 <center><img alt="logo" src="https://i.postimg.cc/vmKdb2gf/pngwing-com.png" height="20%" width="30%">
<h2>Hogwards<br>Student Detail</h2>

  <div class="col-md-8" style="padding:3%;">
    <label for="name" class="form-label">Name</label>
    <input type="text" class="form-control" name="name">
  </div>
  
   <div class="col-8"style="padding:3%;">
    <label for="address" class="form-label">Address </label>
    <input type="text" class="form-control" name="address" placeholder="Apartment, studio, or floor">
  </div>
  
  <div class="col-8"style="padding:3%;">
    <label for="mark" class="form-label">Mark</label>
    <input type="text" class="form-control" name="mark" placeholder="enter the mark">
  </div></center>
  
  <div class="col-12"style="padding:3%;">
    <div>
      <input  type="checkbox" id="gridCheck" required>
      <label  for="gridCheck">
        Check me out
      </label>
    </div>
  </div>
  <div class="col-12" style="padding:3%;">
    <button type="submit" class="btn btn-primary">ADD</button>
  </div>
</div>
</form>


</main>
    <%
    String name=request.getParameter("name");
    String ad=request.getParameter("address");
    int mark=Integer.parseInt(request.getParameter("mark"));
    String as="insert into student( name,address,mark)values(?,?,?)";
    PreparedStatement p=con.prepareStatement(as);
    p.setString(1, name);
    p.setString(2, ad);
    p.setInt(3, mark);
    p.executeUpdate();
    response.sendRedirect("principal.jsp");
    }
    if(w.equals("teacher"))
    {
 	%>
 	<main>
<div style="height:100vh;background: linear-gradient(to bottom, #0a1f3d, #1c3a5f, #2e567f, #3f6f9f);
    font-family: 'Georgia', serif;
">
<form method="post" class="text-center" style="position:absolute; top:50%; left:50%; transform:translate(-50%, -50%);
        background: linear-gradient(to bottom right, #f5f5f5, #dcdde1);
 padding:30px; border-radius:12px;box-shadow: 0 0 25px rgba(160, 196, 157, 0.3);
 max-width:400px; width:90%; font-weight: bold;" method="post" >
 
 <center><img alt="logo" src="https://i.postimg.cc/vmKdb2gf/pngwing-com.png" height="20%" width="30%">
<h2>Hogwards<br>Teachers Detail</h2>

  <div class="col-md-8" style="padding:3%;">
    <label for="name" class="form-label">Name</label>
    <input type="text" class="form-control" name="name">
  </div>
  
   <div class="col-8"style="padding:3%;">
    <label for="subject" class="form-label">Subject</label>
    <input type="text" class="form-control" name="subject" >
  </div>
  
  <div class="col-8"style="padding:3%;">
    <label for="salary" class="form-label">Salary</label>
    <input type="text" class="form-control" name="salary" >
  </div></center>
  
  <div class="col-12"style="padding:3%;">
    <div>
      <input  type="checkbox" id="gridCheck" required>
      <label  for="gridCheck">
        Check me out
      </label>
    </div>
  </div>
  <div class="col-12" style="padding:3%;">
    <button type="submit" class="btn btn-primary">ADD</button>
  </div>
</div>
</form>


</main>
 		
 	<%
 	 
     String name=request.getParameter("name");
     String subject=request.getParameter("subject");
     int salary=Integer.parseInt(request.getParameter("salary"));
     String as="insert into teachers( name,subject,salary)values(?,?,?)";
     PreparedStatement p=con.prepareStatement(as);
     p.setString(1, name);
     p.setString(2, subject);
     p.setInt(3, salary);
     p.executeUpdate();
     response.sendRedirect("principal.jsp");
     }
}
catch(Exception e)
{
	e.printStackTrace();
	System.out.print(e.getMessage());
}
    
    
%>

</body>
</html>