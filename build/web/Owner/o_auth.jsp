<%-- 
    Document   : o_auth
    Created on : 7 Jun, 2023, 6:00:45 AM
    Author     : AnkushCp
--%>

<%-- 
    Document   : auth_session
    Created on : 28 May, 2023, 6:11:01 PM
    Author     : AnkushCp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Turf Page</title>
</head>
<body>
 <%@ page import="javax.servlet.http.HttpSession" %>
<% 
   HttpSession sesion = request.getSession(false); // Get the existing session or null if not present
   String loggedInUser = (sesion != null) ? (String) sesion.getAttribute("OwnerLoggedIn") : null;
   
   if (loggedInUser == null) {
      response.sendRedirect("o_login.jsp"); // Redirect to the login page if not logged in
   }
%>
</body>
</html>