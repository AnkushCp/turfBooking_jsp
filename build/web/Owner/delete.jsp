<%-- 
    Document   : delete
    Created on : 25 Jun, 2023, 3:50:49 PM
    Author     : AnkushCp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!
     
        String url = "jdbc:mysql://localhost:3306/turfs";   // Update with your Oracle connection details
        String dbUsername = "root";
        String dbPassword = "";
        Connection conn = null;
        PreparedStatement stmt = null;
        String alert_d="false";
%>
<%   
                     response.sendRedirect("Dash.jsp?alertd="+alert_d+"");
try{ 
         Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);
        String time=request.getParameter("time");
        String email=request.getParameter("email");
        String date=request.getParameter("date");
        String sql1 = "delete from book_turf where email=? and  time=? and date=? ";
                stmt = conn.prepareStatement(sql1);
                stmt.setString(1, email);
                stmt.setString(2, time);
                stmt.setString(3, date);
                int r=stmt.executeUpdate();
                if(r>0)
                {
                    alert_d="true";

                    response.sendRedirect("Dash.jsp?alertd="+alert_d+"");
                }
}
catch (Exception e) {
                out.println("An error occurred:ll " + e.getMessage());


            } finally {
                try {
                    if (stmt != null) {
                        stmt.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (Exception e) {
                    out.println("An error occurred: " + e.getMessage());
                }
            }
    %>
    </body>
</html>
