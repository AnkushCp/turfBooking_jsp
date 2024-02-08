<%-- 
    Document   : pay_turf
    Created on : 13 Jun, 2023, 9:03:33 PM
    Author     : AnkushCp
--%>

<%@ page import="java.sql.*" %>
<%--<%@ include file="auth_session.jsp" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/regi.css">
    <link rel="stylesheet" href="css/login.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pay Turf</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap" rel="stylesheet">
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

<%!
    String email="";
    String address="";
    String time="";
    String tp="";
    String username="";
    String location="";
    float price=0;

        String url = "jdbc:mysql://localhost:3306/turfs";  // Update with your Oracle connection details
        String dbUsername = "root";
        String dbPassword = "";
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs=null;
    %>
<%
     HttpSession sessio = request.getSession();

    try{
     email=request.getParameter("param1");
     address=request.getParameter("param2");
        price=Float.parseFloat(request.getParameter("param3"));
    }
    catch(Exception e)
    {
        System.out.println(e.getMessage());
    }
   %>
    <div class="heading">
        <h1>Set payment details</h1>
 </div>
    <div class="form_container">
        <form  method="post" action="pay_turf.jsp?p=<%= price%>"  >
            <input type="text" name="name" class="field" value="" placeholder="Enter the name"><br>            
            <input type="text" name="email" class="field" value="<%= email%>" ><br>
            <input type="text" name="add" class="field" value="<%= address%>" ><br>
            <input type="text" name="phone" class="field" placeholder="Enter Contact no">
            <input type="submit" class="register" value="submit" >
          
        </form>
   
    </div>
    </body>
</html>
