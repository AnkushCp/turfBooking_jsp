<%-- 
    Document   : o_login.jsp
    Created on : 6 Jun, 2023, 7:55:35 AM
    Author     : AnkushCp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
    <link rel="stylesheet" href="../css/regi.css">
    <link rel="stylesheet" href="../css/login.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Owner</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cinzel|Fauna+One" >
        <style>
    .form_container .login_form {
    margin-top: 50px;
    border-radius: 11px;
    width: 400px;
    height: 240px;
    padding: 40px;
    padding-inline: 10px;
    text-align: center;
    background: rgba(205, 241, 215, 0.49);
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
  position: absolute;
    top: 136px;
    right: 66px;
    /* left: 360px; */
    background: aliceblue;
    margin: auto;
    border-radius: 13px;
    height: 92px;
    width: 317px;
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
     
      </style>
    </head>
    <body>
            <div class="ground">
        <img src="../images/ground1.png" alt="ground">
       </div>
    <div class="header">
        <div class="left_header">
                <img src="../images/logo.png" alt="logo">
        </div>
        <div class="right_header">
                <div class="menu">

                    <li><a href="index.jsp">Register</a></li>
                    <li><a href="../about.html">About</a></li>
                    <li><a href="#Home">Contact us</a></li>
                </div>

        </div>
    </div>

  <div class="form_container">
    <form name="loginForm" method="post" class="login_form" action="<%=request.getContextPath()%>/Owner/o_login.jsp">
            <input type="text" name="email" class="field" placeholder="Enter Email" ><br>
            <input type="password" name="pass" id="passo" class="field" placeholder="Enter Password">
                   <i class="far fa-eye" id="togglePassword" style="position: relative;left: -18px; margin-left: -24px;cursor: pointer;"></i><br>
            <input type="submit" class="register" value="Register" >
               <h1>Want to register as Owner <a href="index.jsp"> Sign Up → </a></h1>
        </form>

    </div>
   <script>
    const togglePassword = document.querySelector('#togglePassword');
    const password = document.querySelector('#passo');
    togglePassword.addEventListener('click', function (e) {
    // toggle the type attribute
    const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
    password.setAttribute('type', type);
    // toggle the eye slash icon
    this.classList.toggle('fa-eye-slash');
    });
</script>
    <%!
        String url = "jdbc:mysql://localhost:3306/turfs";   // Update with your Oracle connection details
        String dbUsername = "root";
        String dbPassword = "";
        
        Connection conn = null;
        PreparedStatement stmt = null,stmt1=null;
        ResultSet rs = null,rs1=null;

    %>

    <% 
                           HttpSession sessio = request.getSession();
        if (request.getMethod().equalsIgnoreCase("post")) {
            String username = request.getParameter("email");
            String password = request.getParameter("pass");

            if(username==""&&password=="")
            {
                    out.println("<div class='alert info'>");
                    out.println("<span class='closebtn'>&times;</span>");  
                    out.println("<strong> Attention ! </strong> Please enter Credentials !!");
                    out.println("</div>');");
            }
        
            try {
                // Connect to the database
                 Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);
                   boolean aleert=false;
                // Prepare the SQL statement
                String sql = "SELECT * FROM o_register WHERE email = ? AND password = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, username);
                stmt.setString(2, password);
                
//                String sql2="select  from o_register where email= ?";
//                stmt1=conn.prepareStatement(sql2);
//                stmt1.setString(1, username);
//                rs1=stmt1.executeQuery();
//                  if (rs1.next()) {
//                city=rs1.getString("curr_city");
//                  }
                // Execute the query
                
                rs = stmt.executeQuery();

                if ( rs.next()) 
                {
                    // Authentication successful
                    out.println("<div class='alert info'>");
                    out.println("<span class='closebtn'>&times;</span>");  
                    out.println("<strong> Superb ! </strong> Lets check The Activity !!");
                    out.println("</div>');");
                     session.setAttribute("OwnerLoggedIn", username);

                                         %>
                     <script type="text/javascript">          
                    setTimeout(function(){
                        window.location.href = "Dash.jsp?alertd=false";
                                        }, 1000); // 1 second delay
                    </script>
                     <%
                } else{
                    
                        aleert=true;
                    // Authentication failed
                    //  out.println("Invalid username or password. Please try again.");
                    }
                if(aleert)
                {
                  out.println("<div class='alert warning'>");
                     out.println("<span class='closebtn'>&times;</span>");  
                     out.println("<strong> Attention ! </strong> You have Entered Wrong Crendentials !!");
                    out.println("</div>');");
                }
              
            } catch (Exception e) {
                out.println("An error occurred: " + e.getMessage());
            } finally {
                // Close database resources
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            }
        }
    %>
   <script>
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


    </body>
</html>
