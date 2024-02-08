<%-- 
    Document   : o_logout
    Created on : 7 Jun, 2023, 9:36:50 PM
    Author     : AnkushCp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
  // Get the current session
  HttpSession sessio = request.getSession(false); 
  
  // Check if a session exists
  if (sessio != null) {
    // Invalidate the session
    sessio.invalidate();
   response.sendRedirect("o_login.jsp");
  } else {
    out.println("No active session found.");
  }
%>
    </body>
</html>
