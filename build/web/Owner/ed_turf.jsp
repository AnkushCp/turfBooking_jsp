<%@ page import="java.sql.*" %>
<%@ include file="o_auth.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<head>
<html lang="en">
    <link rel="stylesheet" href="../css/regi.css">
    <link rel="stylesheet" href="../css/et.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap" rel="stylesheet">
</head>
<body>
        <div class="header">
        <div class="left_header">
                <img src="../images/logo.png" alt="logo">
        </div>
        <div class="right_header">
                <div class="menu">
                    <li><a href="Dash.jsp?alertd=false">DashBoard</a></li>
                    <li><a href="edit_profile.jsp">Edit Profile</a></li>
                    <li><a href="o_logout.jsp">Log out</a></li>
                </div>    
            </div>
    </div>

    <h1 class="ed">Edit Turf</h1>
    <div class="first_c">
        <div class="t">
    
    <%!  String url = "jdbc:mysql://localhost:3306/turfs";   // Update with your Oracle connection details
        String dbUsername = "root";
        String dbPassword = "";
        String username="";
        Connection conn = null;
        PreparedStatement stmt = null,stmt1=null;
        ResultSet rs=null,rs1=null;
   %> 
                <%
                        HttpSession sessio = request.getSession();
             username= (sessio != null) ? (String) sessio.getAttribute("OwnerLoggedIn") : null;

            
  
            try {

                // Connect to the database
               Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);
                   
                String sql="select * from turfs where email=?";
                stmt=conn.prepareStatement(sql);
                stmt.setString(1,username);
                rs=stmt.executeQuery();
                while(rs.next())
                {
                     
                    %>
                    <a href="edit_turf.jsp?param1=<%= rs.getString("tname")%>">
                    <div class="turf">
                        <h1><%= rs.getString("tname")%></h1>
                    </div>
                      </a>
                     <%
                }
                

  }catch (Exception e) {    
        out.println("An error occurred++:" + e.getMessage());
    } finally {
        
                // Close database resources

                if (stmt1 != null) {
                    stmt1.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }

    %>
            </div>
    </div>


</body>
</html>