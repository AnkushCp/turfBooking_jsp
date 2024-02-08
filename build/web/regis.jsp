<%-- 
    Document   : regis
    Created on : 27 May, 2023, 6:12:09 PM
    Author     : AnkushCp
--%>
<html>
    <head>
         <style>
        *{
            padding: 0;
    height: 100%;
    width: 100%;
    margin: 0;
    box-sizing: border-box;
        }
        .overs{
            position: absolute;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: #0000003b;
    z-index: -16;
        }
        .alert{
            position: relative;
    top: 254px;
    background: aliceblue;
    margin: auto;
    border-radius: 13px;
      height: 91px;
    width: 313px;
    box-shadow: 0px 0 27px 9px #0000003b;
            animation-name: a;
            animation-duration: 0.4s;
            animation-iteration-count: 1;
            transition: 0.5s ease-out;
        }
        @keyframes a {
            0%{top: 240px;}
            50%{top: 260px;}
            100%{top: 254px}
            
        }
        strong{
            font-family: monospace;
    display: flex;
    margin: auto;
    color: #000000b8;
    height: 45px;
    align-items: center;
    justify-content: center;
    font-size: 18px;
        }
       a{
           text-decoration: none;
            border: none;
            font-size: 19px;
    font-family: system-ui;
    color: white;
    font-weight: bold;
    text-shadow: 0px 1px black;
    display: flex;
    margin: auto;
    align-items: center;

    justify-content: center;
    height: 43px;
    width: 72px;
    border-radius: 8px;
    background-color: #35a31f;
        transition: 0.3s ease-out;
        }
        a:hover{
            box-shadow: 0 0 4px 1px #00000091;

        }
        button{
            cursor: pointer;
            display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    margin: auto;
    border: none;
    border: nonr;
    background: orange;
    top: 81px;
    width: 97px;
    height: 45px;
    border-radius: 7px;
        }
    </style>
    </head>
    <body>
        <div class="oves" id="overlay">
    </body>
<html>
<%@page contentType="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Get form data
    String username = request.getParameter("name");
    String email = request.getParameter("email");
    String curr_city = request.getParameter("curr_city");
    String password = request.getParameter("pass");
    // Database connection details
    String url = "jdbc:mysql://localhost:3306/turfs";   // Update with your Oracle connection details
    String dbUsername = "root";
    String dbPassword = "";
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
        // Connect to the database
         Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        // Prepare the SQL statement
        String sql = "INSERT INTO register (name,email,curr_city,password) VALUES (?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, email);
        stmt.setString(3, curr_city);
        stmt.setString(4, password);

        // Execute the statement
        int rowsAffected = stmt.executeUpdate();
%><script>
 

        <%if (rowsAffected > 0){%> 
           
       function kable()
        {
            div=document.createElement('div');
            div.className="alert";
            div.innerHTML="<Strong> Registration Successfull !!</Strong> <a href='login.jsp' hidden>Login</a>";
            document.body.append(div);
            overlay.className="overs";
        }     
        kable();
        </script>
        <%} else {
            out.println("Registration failed. Please try again.");
        }
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
//        out.println("An error occurred: " + e.printStackTrace());
    } finally {
        // Close database resources
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    }
%>
