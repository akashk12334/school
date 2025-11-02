<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
String who = (String)session.getAttribute("who");
int id = (Integer)session.getAttribute("id");
String role = (String)session.getAttribute("role");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/School", "root", "");


if ("POST".equalsIgnoreCase(request.getMethod())) {
    if (who.equals("student")) {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        int mark = Integer.parseInt(request.getParameter("mark"));

        PreparedStatement ps = con.prepareStatement(
            "UPDATE student SET name=?, address=?, mark=? WHERE studentid=?");
        ps.setString(1, name);
        ps.setString(2, address);
        ps.setInt(3, mark);
        ps.setInt(4, id);
        ps.executeUpdate();
    } else if (who.equals("teacher")) {
        String name = request.getParameter("name");
        String subject = request.getParameter("subject");
        int salary = Integer.parseInt(request.getParameter("salary"));

        PreparedStatement ps = con.prepareStatement(
            "UPDATE teachers SET name=?, subject=?, salary=? WHERE teachers_id=?");
        ps.setString(1, name);
        ps.setString(2, subject);
        ps.setInt(3, salary);
        ps.setInt(4, id);
        ps.executeUpdate();
    }
    
    if(role.equals("principal"))
    {
  
    response.sendRedirect("principal.jsp?update=success");
    return;
    }
    else if(role.equals("teacher"))
    {
    	response.sendRedirect("teachers.jsp?update=success");
    	return;
    }
    
    else
    {
    	response.sendRedirect("student.jsp?update=success");
    	return;
    }
    
}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="icon" type="image/png" href="https://i.postimg.cc/vmKdb2gf/pngwing-com.png" sizes="256x256">
</head>
<body style="height:100vh; background: linear-gradient(to bottom, #0a1f3d, #1c3a5f, #2e567f, #3f6f9f); font-family:'Georgia',serif;">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%
String selectQuery;
PreparedStatement ps;
ResultSet r;

if (who.equals("student")) {
    selectQuery = "SELECT * FROM student WHERE studentid=?";
    ps = con.prepareStatement(selectQuery);
    ps.setInt(1, id);
    r = ps.executeQuery();

    if (r.next()) {
%>
<form method="post" class="text-center" style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);
      background:linear-gradient(to bottom right,#f5f5f5,#dcdde1);
      padding:30px;border-radius:12px;box-shadow:0 0 25px rgba(160,196,157,0.3);
      max-width:400px;width:90%;font-weight:bold;">
  <img alt="logo" src="https://i.postimg.cc/vmKdb2gf/pngwing-com.png" height="80" width="80">
  <h2>Student Detail</h2>
  <input type="hidden" name="id" value="<%=id%>">

  <label class="form-label mt-3">Name</label>
  <input type="text" class="form-control" name="name" value="<%=r.getString("name")%>">

  <label class="form-label mt-3">Address</label>
  <input type="text" class="form-control" name="address" value="<%=r.getString("address")%>">

  <label class="form-label mt-3">Mark</label>
  <input type="text" class="form-control" name="mark" value="<%=r.getInt("mark")%>">

  <div class="form-check my-3">
    <input class="form-check-input" type="checkbox" required>
    <label class="form-check-label">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary w-100">Edit</button>
</form>
<%
    }
} else if (who.equals("teacher")) {
    selectQuery = "SELECT * FROM teachers WHERE teachers_id=?";
    ps = con.prepareStatement(selectQuery);
    ps.setInt(1, id);
    r = ps.executeQuery();

    if (r.next()) {
%>
<form method="post" class="text-center" style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);
      background:linear-gradient(to bottom right,#f5f5f5,#dcdde1);
      padding:30px;border-radius:12px;box-shadow:0 0 25px rgba(160,196,157,0.3);
      max-width:400px;width:90%;font-weight:bold;">
  <img alt="logo" src="https://i.postimg.cc/vmKdb2gf/pngwing-com.png" height="80" width="80">
  <h2>Teacher Detail</h2>
  <input type="hidden" name="id" value="<%=id%>">

  <label class="form-label mt-3">Name</label>
  <input type="text" class="form-control" name="name" value="<%=r.getString("name")%>">

  <label class="form-label mt-3">Subject</label>
  <input type="text" class="form-control" name="subject" value="<%=r.getString("subject")%>">

  <label class="form-label mt-3">Salary</label>
  <input type="text" class="form-control" name="salary" value="<%=r.getInt("salary")%>">

  <div class="form-check my-3">
    <input class="form-check-input" type="checkbox" required>
    <label class="form-check-label">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary w-100">Edit</button>
</form>
<%
    }
}
con.close();
%>

</body>
</html>
