<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/png" href="https://i.postimg.cc/vmKdb2gf/pngwing-com.png" sizes="256x256">
<title>Hogwarts School - Student Dashboard</title>
<style>
.btn-enchanted {
  background: linear-gradient(135deg, #3A1C71, #D76D77, #FFAF7B);
  color: #FFF;
  border: none;
  font-weight: 600;
  padding: 10px 20px;
  border-radius: 10px;
  box-shadow: 0 4px 15px rgba(255,175,123,0.4);
  transition: all 0.3s ease;
}

.btn-enchanted:hover {
  transform: scale(1.05);
  box-shadow: 0 6px 20px rgba(255,175,123,0.6);
}
footer {
  background: #0B1A2A;
  color: #E4C787;
  text-align: center;
  padding: 20px;
  font-weight: 500;
  box-shadow: 0 -2px 15px rgba(200,169,90,0.3);
}

</style>
</head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<%
int id = (Integer) session.getAttribute("id");
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/School", "root", "");
    String re = "SELECT * FROM studentrequest WHERE studentid=?";
    PreparedStatement s = con.prepareStatement(re);
    s.setInt(1,id);
    ResultSet rs = s.executeQuery();
     %>
     <nav class="navbar navbar-expand-lg" style="background: linear-gradient(135deg, #0B1A2A, #1A2F4F, #C8A95A);
color: #F5E6C8;
">
  <div class="container-fluid">
    <a class="navbar-brand" href="#" style="color:#C8A95A; font-weight:bold;">
      <img alt="logo" src="https://i.postimg.cc/vmKdb2gf/pngwing-com.png" height="40" width="40">
      Hogwarts School
    </a>
  </div>
</nav>
<main>

<!-- HERO SECTION -->
<section style="position:relative; height:90vh; overflow:hidden;">
  <img src="https://i.postimg.cc/JzLDY2fc/hogwards-school-animation-video-welcoming-the-students-with-magical-effect-and-encouraging-them-to-l.jpg"
       style="width:100%; height:100%; object-fit:cover;" alt="hogwarts background">
        <div class="text-center" style="position:absolute; top:50%; left:50%; transform:translate(-50%, -50%); color:#F2EDE3;">
    <h1 style="font-size:3rem; font-weight:bold;color: #F5E6C8;
text-shadow: 0 0 6px rgba(11,26,42,0.7); ">Welcome, Future Champion of Magic</h1>
    <p style="font-style:italic;  font-weight:bold;">Learn bravely. Practice kindly. Cast wisely.</p>
    <a href="insertrequest.jsp?id=<%=id%>&s=Edit&role=student" class="btn btn-enchanted btn-sm">Request Edit</a>
  
  
  <div class="row justify-content-center mt-5">
  <div class="col-md-3 mb-3">
    <a class="btn btn-enchanted" data-bs-toggle="collapse" href="#viewRequests" role="button" aria-expanded="false" style="font-size:80%;">
      View Your Requests
    </a>
  </div>
  <div class="collapse" id="viewRequests">
    <div class="card card-body mx-auto" style="max-width:90%; background:rgba(11,26,42,0.95); border:1px solid #C8A95A;">
      <table class="table table-dark table-hover text-center align-middle">
        <thead>
          <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Action Type</th>
            <th>Time</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
        <%
         while(rs.next()) {
        %>
          <tr>
            <td><%= rs.getInt("studentid") %></td>
            <td><%= rs.getString("name") %></td>
            <td><%= rs.getString("actiontype") %></td>
            <td><%= rs.getString("time") %></td>
            <td><%= rs.getString("status") %></td>
          </tr>
        <%
          }
        
          rs.close();
          s.close();
          con.close();
        %>
        </tbody>
      </table>
    </div>
  </div>
  </div>
  <a href="studentview.jsp?id=<%=id%>&who=student&role=student" class="btn btn-enchanted btn-sm">view your details</a>
  </div>
 </section>
 </main>
    <footer>
  © 2025 Hogwarts School
</footer>
     
<%
con.close();

} 
catch(Exception e) {
    e.printStackTrace();
    System.out.print(e.getMessage());
}
%>
<body>
</body>
</html>