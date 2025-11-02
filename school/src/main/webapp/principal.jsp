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
<title>Hogwarts School - Principal Dashboard</title>

<style>
html, body {
  height: 100%;
  margin: 0;
  display: flex;
  flex-direction: column;
  color: black;
}

/* MAIN should take up the space between header and footer */
main {
  flex: 1;
}

/* ROYAL DARK BUTTON */
.btn-royal-dark {
  background: linear-gradient(135deg, #0B1A2A, #050A13, #111111);
  color: #E8E6D9;
  border: 1px solid #C8A95A;
  border-radius: 8px;
  font-weight: 600;
  transition: 0.3s;
}
.btn-royal-dark:hover {
  background: linear-gradient(135deg, #111111, #081422, #0B1A2A);
  box-shadow: 0 0 14px rgba(200, 169, 90, 0.7);
  color: #C8A95A;
}

/* GOLD BUTTON */
.btn-gold {
  background: linear-gradient(135deg, #E4C787, #C8A95A, #9E7B30);
  color: #111111;
  font-weight: 700;
  border-radius: 10px;
  transition: 0.3s;
}
.btn-gold:hover {
  background: linear-gradient(135deg, #F5DDA8, #D9B96E, #A67C2D);
  box-shadow: 0 0 15px rgba(255, 214, 130, 0.9);
  transform: scale(1.05);
}

/* FOOTER */
footer {
  background-color: #111111;
  color: #E8E6D9;
  text-align: center;
  padding: 20px 0;
}

.table th {
  background-color: #0B1A2A;
  color: #C8A95A;
}
</style>
</head>

<body>

<%
int c=(Integer)session.getAttribute("count");
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/School", "root", "");
    Statement s = con.createStatement();
    ResultSet r = s.executeQuery("SELECT * FROM request;");
   
%>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg" style="background-color:#0B1A2A;">
  <div class="container-fluid">
    <a class="navbar-brand" href="#" style="color:#C8A95A; font-weight:bold;">
      <img alt="logo" src="https://i.postimg.cc/vmKdb2gf/pngwing-com.png" height="40" width="40">
      Hogwarts School
    </a>
  </div>
</nav>

<main>

<!-- HERO SECTION -->
<section style="position:relative; height:80vh; overflow:hidden;">
  <img src="https://i.postimg.cc/0jnF469k/create-a-background-image-for-a-website-of-hogwards-school-with-magical-effects-and-magical-creatur.jpg"
       style="width:100%; height:100%; object-fit:cover;" alt="hogwarts background">

  <div class="text-center" style="position:absolute; top:50%; left:50%; transform:translate(-50%, -50%); color:#F2EDE3;">
    <h1 style="font-size:3rem; font-weight:bold;">Welcome, Principal</h1>
    <p style="font-style:italic;">Ram — Good to see you.</p>
    <button type="button" class="btn btn-warning">
      Notifications <span class="badge text-bg-danger"><%=c %></span>
    </button>
  </div>
</section>

<!-- SECOND SECTION -->
<section class="container-fluid py-5" 
         style="background: linear-gradient(135deg, #0B1A2A, #111111, #C8A95A); background-size: cover;">

  <!-- Review Requests -->
  <div class="text-center mb-4">
    <a class="btn btn-gold" data-bs-toggle="collapse" href="#reviewRequests" role="button" aria-expanded="false">
      Review Requests
    </a>
  </div>

  <div class="collapse" id="reviewRequests">
    <div class="card card-body mx-auto" style="max-width:90%; background:rgba(11,26,42,0.95); border:1px solid #C8A95A;">
      <table class="table table-dark table-hover text-center align-middle">
        <thead>
          <tr>
            <th>Id</th>
            <th>Teacher ID</th>
            <th>Name</th>
            <th>Action Type</th>
            <th>Time</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
        <%
         while(r.next()) {
        %>
          <tr>
            <td><%= r.getInt("id") %></td>
            <td><%= r.getInt("teachers_id") %></td>
            <td><%= r.getString("name") %></td>
            <td><%= r.getString("actiontype") %></td>
            <td><%= r.getString("time")%></td>
            <td><%= r.getString("status") %></td>
            <td>
              <a href="updaterequest.jsp?id=<%=r.getInt("id")%>&action=approve" class="btn btn-success btn-sm">Approve</a>
              <a href="updaterequest.jsp?id=<%=r.getInt("id")%>&action=reject" class="btn btn-danger btn-sm">Reject</a>
            </td>
          </tr>
        <%
          }
          r.close(); s.close(); con.close();
        %>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Buttons Row -->
  <div class="row justify-content-center mt-5 text-center">
    <div class="col-md-3 mb-3">
      <div class="dropdown">
        <button class="btn btn-royal-dark dropdown-toggle" type="button" data-bs-toggle="dropdown">Add</button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="Add.jsp?who=student">Add Student</a></li>
          <li><a class="dropdown-item" href="Add.jsp?who=teacher">Add Teacher</a></li>
        </ul>
      </div>
    </div>
    <div class="col-md-3 mb-3">
      <div class="dropdown">
        <button class="btn btn-gold dropdown-toggle" type="button" data-bs-toggle="dropdown">view</button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="VIEW.jsp?who=student&role=principal">View All Students</a></li>
          <li><a class="dropdown-item" href="VIEW.jsp?who=teacher&role=principal">View All Teachers</a></li>
        </ul>
      </div>
    </div>
    <div class="col-md-3 mb-3">
      <div class="dropdown">
        <button class="btn btn-royal-dark dropdown-toggle" type="button" data-bs-toggle="dropdown">Update</button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="#">Update Student</a></li>
          <li><a class="dropdown-item" href="#">Update Teacher</a></li>
        </ul>
      </div>
    </div>
    
  </div>
  
</section>

</main>

<!-- FOOTER -->
<footer>
  © 2025 Hogwarts School
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<%
} catch(Exception e) {
    e.printStackTrace();
    System.out.print(e.getMessage());
}
%>

</body>
</html>
