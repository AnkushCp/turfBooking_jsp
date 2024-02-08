<%-- 
    Document   : Turfs
    Created on : 28 May, 2023, 4:55:28 PM
    Author     : AnkushCp
--%>

<%@ page import="java.sql.*" %>
<%@ include file="auth_session.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/regi.css">
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="css/turf.css">
 
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&family=Roboto:wght@500&display=swap" rel="stylesheet">
        <title>JSP Page</title>
     
    </head>
    <body>
         <div class="header">
        <div class="left_header">
            <a href="index.html"><img src="images/logo.png" alt="logo"></a>
        </div>
        <div class="right_header">
                <div class="menu">

            <li><a href="Turfs.jsp">Turfs</a></li>
            <li><a href="about.html">About</a></li>
                    <li><a href="log_out.jsp">Log out</a></li>
                </div>
        </div>
    </div>
       <div class="gal_contain">
        <div class="gall_turfs">
         <%
        String getCity= (sesion != null) ? (String) sesion.getAttribute("citySession") : null;
        String DB_URL = "jdbc:mysql://localhost:3306/turfs"; 
        String DB_USERNAME = "root";
        String DB_PASSWORD = "";

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
                 Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);


            String query = "SELECT * FROM turfs where city = ?";

            stmt = conn.prepareStatement(query);
            stmt.setString(1, getCity);
            rs = stmt.executeQuery();
    
            while (rs.next()) {
                String name = rs.getString("tname");
                String address = rs.getString("address");
                String time = rs.getString("sh_time");
                String city = rs.getString("city");
                int price = rs.getInt("price");
                %>
           <div class="turf_contain">
                <h1 class="city"><%= name %></h1>
                <p class="add"><%= address %></p>
                <strong>Open Time : <%= time%></strong>
                  
                <div class="but_contain"><a href="book.jsp?para1=<%=name%>" class="but">Book Now</a></div> 
            </div>

   
                <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close database resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

        </div>
    </div>

</body>
</html>

