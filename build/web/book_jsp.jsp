
<%-- 
    Document   : book_jsp.jsp
    Created on : 2 Jun, 2023, 9:27:17 PM
    Author     : AnkushCp
--%>

<%@ page import="java.sql.*" %>
<%@ include file="auth_session.jsp" %>
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
    <title>Registration</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap" rel="stylesheet">
<body>
<%!
     
        String url = "jdbc:mysql://localhost:3306/turfs";   // Update with your Oracle connection details
        String dbUsername = "root";
        String dbPassword = "";
        Connection conn = null;
        PreparedStatement stmt = null;
                String tname="";
                String address= "";
                String email= "";
                String tp= "";                        
                String time = "";          
                float price=0;
                String date="";
                 String sql1=""; %>
<%
    
 
try{ 
         Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);
            if (request.getMethod().equalsIgnoreCase("post"))
     { 

       
               address= request.getParameter("add");
                 email= request.getParameter("email");
                 tp= request.getParameter("tp");                        
                 time = request.getParameter("time");          
                 price= Float.parseFloat(request.getParameter("price"));
                 tname=request.getParameter("tname");
                 date=request.getParameter("date");
            
                sql1 = "INSERT INTO book_turf VALUES(?, ?, ?, ?, ?,?,?)";
                stmt = conn.prepareStatement(sql1);
                
                stmt.setString(1,email);
                stmt.setString(2,address);
                stmt.setString(3,time);
                stmt.setString(4,tp);
                stmt.setFloat(5,price);
                stmt.setString(6,tname);
                stmt.setString(7,date);                     
                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0){
                     out.println("<div class='alert success'>");
                     out.println("<span class='closebtn'>&times;</span>");  
                     out.println("<strong> Congratulation ! </strong> You have SuccessFully Booked The turf!!");             
                     out.println("</div>");
//                     sessio.setAttribute("ADDR", add);
                     %>
                     <script type="text/javascript">          
                    setTimeout(function(){
                        window.location.href = "pay_details.jsp?param1=<%=email%>&param2=<%=address%>&param3=<%=price%>";
                                        }, 1000); // 1 second delay
                    </script>
                     <%
                         }else {

                out.println("Insertion failed. Please try again.");
                }}

} catch (Exception e) {
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