<%-- 
    Document   : reciept
    Created on : 29 May, 2023, 9:07:34 PM
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
<style>
         .overs{
            position: absolute;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: #0000003b;
    z-index: -16;
        }
        .alert   { 
            position: absolute;
    top: 123px;
    right: 91px;
    /* left: 360px; */
    background: aliceblue;
    margin: auto;
    border-radius: 13px;
    height: 92px;
    width: 315px;
    box-shadow: 0px 0 27px 9px #0000003b;
    animation-name: a;
    animation-duration: 0.4s;
    animation-iteration-count: 1;
    transition: 0.5s ease-out;
}
        @keyframes a {
            0%{top: 160px;}
            50%{top: 100px;}
            100%{top: 123px}
            
        }
        strong{
            font-family: monospace;
    display: flex;
    margin: auto;
    color: #000000b8;
    height: 45px;
    align-items: center;
    justify-content: center;
    font-size: 24px;
        }
       .alert_a{
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
    background-color: #3d78ef;
        transition: 0.3s ease-out;
        }
        .alert_a:hover{
            box-shadow: 0 0 4px 1px #00000091;

        }
        .form_container form {
    margin-top: 50px;
    border-radius: 11px;
    width: 400px;
    height: 468px;
    padding: 40px;
    padding-inline: 10px;
    text-align: center;
    background: rgba(205, 241, 215, 0.49);
}
</style>
</head>
<body>
        <%!
            
        String url = "jdbc:mysql://localhost:3306/turfs";  // Update with your Oracle connection details
        String dbUsername = "root";
        String dbPassword = "";
        float price=0;
        String address="";   
        String time="";
        String tp="";
        String username="";
        String tname="";
        Connection conn = null;
        PreparedStatement stmt = null,stmt1=null;
        ResultSet rs1=null;
    %>
    <%
         
            HttpSession sessio = request.getSession();
            String username= (sessio != null) ? (String) sessio.getAttribute("userLoggedIn") : null;
       

            try {
     
           tname=request.getParameter("para1");

                // Connect to the database
                    Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);
                   boolean aleert=false;
                // Prepare the SQL statement
    
                String sql2="select * from turfs where tname= ?";
                stmt1=conn.prepareStatement(sql2);
                stmt1.setString(1, tname);
                rs1=stmt1.executeQuery();
                  while (rs1.next()) {
                price=rs1.getFloat("Price");
                address=rs1.getString("address");
                  }
//               else{
//                        aleert=true;
//                    // Authentication failed
//                    //  out.println("Invalid username or password. Please try again.");
//                    }
//                if(aleert)
//                {
//                  out.println("<div class='alert warning'>");
//                     out.println("<span class='closebtn'>&times;</span>");  
//                     out.println("<strong> Attention ! </strong> Required Fields are Missing !!");
//                    out.println("</div>');");
//                }

 } catch (Exception e) {    
        out.println("An error occurred++:" + e.getMessage());
    } finally {
        try{
        // Close database resources
        if (stmt != null) {
            stmt.close();
        }
        if (conn != null) {
            conn.close();
        }
            } catch (Exception e) {
                out.println("An error occurred: " + e.getMessage());
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
    <div class="ground">
        <img src="images/ground1.png" alt="ground">
       </div>
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


    <div class="form_container">
        <form  method="post" action="book_jsp.jsp"  >
            <input type="text" name="tname" class="field" value="<%= tname%>" readonly><br>            
            <input type="text" name="email" class="field" value="<%=username%>" readonly><br>
            <input type="text" name="add" class="field" value="<%= address%>" readonly><br>
            <input type="time" name="time" class="field" required>
            <input type="date" name="date" class="field" required title="Please enter date">            
            <select class="field" name="tp" required>
                <option value="1 Hour">1 Hour</option>
                <option value="2 Hour">2 Hour</option>
                <option value="3 Hour">3 Hour</option>
                <option value="4 Hour">4 Hour</option>
                <option value="5 Hour">5 Hour</option>
            </select>
            <input type="text" class="field" name="price" value="<%=price%>" readonly>
            <input type="submit" class="register" value="Book" >
          
        </form>
   
    </div>
    <% 
      
//        try{ 
//                Class.forName("oracle.jdbc.driver.OracleDriver");
//                conn = DriverManager.getConnection(url, dbUsername, dbPassword);
//            
//                } else {
//                out.println("Insertion failed. Please try again.");
//                }
//                } catch (Exception e) {          out.println(add);
//        out.println("An error occurred:" + e.getMessage());
//    } finally {
//        // Close database resources
//        if (stmt != null) {
//            stmt.close();
//        }
//        if (conn != null) {
//            conn.close();
//        }
//    }
     }
    %>
         <script type="text/javascript">
    var close = document.getElementsByClassName("closebtn");
    var i;
    for (i = 0; i < close.length; i++) {
    close[i].onclick = function(){
    var div = this.parentElement;
    div.style.opacity = "0";
    setTimeout(function(){ div.style.display = "none"; }, 600);
    }
    }
    </script>
    <%@ include file="footer.html" %>
</body>
</html>