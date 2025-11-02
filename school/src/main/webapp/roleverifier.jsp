<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String who = request.getParameter("who");
String role = request.getParameter("role");
int id = Integer.parseInt(request.getParameter("id"));

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/School", "root", "");

    boolean approved = false;
    String statusMessage = "";

    if (role.equals("principal")) {
        approved = true; // Principal can edit directly
        statusMessage = "Principal auto-approved.";
    } 
    else if (role.equals("teacher")) {
        PreparedStatement pt = con.prepareStatement("SELECT status FROM request WHERE teachers_id = ?");
        pt.setInt(1, id);
        ResultSet rt = pt.executeQuery();

        if (rt.next()) {
            statusMessage = rt.getString("status");
            if (statusMessage.equalsIgnoreCase("approve")) {
                approved = true;
            }
        } else {
            statusMessage = "No record found.";
        }
        rt.close();
        pt.close();
    } 
    else if (role.equals("student")) {
        PreparedStatement ps = con.prepareStatement("SELECT status FROM studentrequest WHERE studentid = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            statusMessage = rs.getString("status");
            if (statusMessage.equalsIgnoreCase("approve")) {
                approved = true;
            }
        } else {
            statusMessage = "No record found.";
        }
        rs.close();
        ps.close();
    }

    if (approved) {
        session.setAttribute("who", who);
        session.setAttribute("id", id);
        session.setAttribute("role", role);
        response.sendRedirect("EDIT.jsp");
    } else {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Access Status</title>
</head>
<body class="text-center mt-5" style="background-color:black;color:white;">
    <h3><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-emoji-frown" viewBox="0 0 16 16" style="height:6%;width:6%;color:red;">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
  <path d="M4.285 12.433a.5.5 0 0 0 .683-.183A3.5 3.5 0 0 1 8 10.5c1.295 0 2.426.703 3.032 1.75a.5.5 0 0 0 .866-.5A4.5 4.5 0 0 0 8 9.5a4.5 4.5 0 0 0-3.898 2.25.5.5 0 0 0 .183.683M7 6.5C7 7.328 6.552 8 6 8s-1-.672-1-1.5S5.448 5 6 5s1 .672 1 1.5m4 0c0 .828-.448 1.5-1 1.5s-1-.672-1-1.5S9.448 5 10 5s1 .672 1 1.5"/>
</svg> Status: <%= statusMessage %></h3>
    <%
     
        
    if(role.equals("student"))
    {
   
    %>
    
    <a href="studentview.jsp?id=<%=id %>&role=<%=role %>&who=role=<%=who %>" class="btn btn-primary mt-3">Go Back</a>
    <%
    }
    else if(role.equals("teacher"))
    {
    %>
    
    <a href="teacherVIEW.jsp?id=<%=id %>&role=<%=role %>&who=<%=who %>" class="btn btn-primary mt-3">Go Back</a>
   <% }%>
</body>
</html>
<%
}

    con.close();
} catch (Exception e) {
    e.printStackTrace();
    out.println("Error: " + e.getMessage());
}
%>
