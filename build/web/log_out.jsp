<%-- 
    Document   : log_out
    Created on : 3 Jun, 2023, 1:59:17 PM
    Author     : AnkushCp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>


<%
  // Get the current session
  HttpSession sessio = request.getSession(false); 
  
  // Check if a session exists
  if (sessio != null) {
    // Invalidate the session
    sessio.invalidate();
   response.sendRedirect("login.jsp");
  } else {
    out.println("No active session found.");
  }
%>
