<%-- 
    Document   : Registration
    Created on : 27 May, 2023, 5:54:09 PM
    Author     : AnkushCp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
  <style>
      
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
    top: 132px;
    right: 157px;
    /* left: 360px; */
    background: aliceblue;
    margin: auto;
    border-radius: 13px;
    height: 92px;
    width: 281px;
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
        <img src="images/ground1.png" alt="ground">
       </div>
    <div class="header">
        <div class="left_header">
            <a href="index.html"><img src="images/logo.png" alt="logo"></a>
        </div>
        <div class="right_header">
                <div class="menu">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="Turfs.jsp">Turfs</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="login.jsp">Contact us</a></li>
                </div>

        </div>
    </div>
 <div class="heading">
        <h1>Sign Up</h1>
 </div>
   
    <%  String url = "jdbc:mysql://localhost:3306/turfs";  
    String dbUsername = "root";
    String dbPassword = "";
    Connection conn = null;

    PreparedStatement stmt = null,stmt1=null;
    try {
    
       Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);
    
        String sql2 = "select Distinct city from turfs";
        stmt = conn.prepareStatement(sql2);
        ResultSet rs2=stmt.executeQuery();
   %>
       <div class="form_container">

        <form  method="post" action="<%=request.getContextPath()%>/register.jsp">

            <input type="text" name="name" class="field" value="" placeholder="Enter Name" required><br>
          
            <input type="email" name="email" class="field" placeholder="Enter Email" oninvalid="InvalidMsg(this);" oninput="InvalidMsg(this);" required="required" required><br>
                     <select name="curr_city" class="curr_city" required> 
                <%
                    while(rs2.next())
                    {
 
                         String c=rs2.getString("city");
                %>

                <option value="<%= c %>"><%= c %></option>
<!--                <option value="Mumbai">Mumbai</option>
                <option value="Pune">Pune</option>
                <option value="Nagpur">Nagpur</option> -->
                    <%}%>
            </select><br>
            <input type="password" name="pass" id="passo" class="field" placeholder="Enter Password" required>
              <i class="far fa-eye" id="togglePassword" style="position: relative;left: -18px; margin-left: -24px;cursor: pointer;"></i><br>
            <input type="submit" class="register" value="Register" >
            <h1>Do you have Login Click here <a href="login.jsp">  Sign In →</a></h1>
       </form>
            </div>
   <%// Get form data
         String sql = "select username,email from register";
        stmt = conn.prepareStatement(sql);
        ResultSet rs=stmt.executeQuery();
        
     if (request.getMethod().equalsIgnoreCase("post"))
     {
    String username = request.getParameter("name");
    String email = request.getParameter("email");
    String curr_city = request.getParameter("curr_city");
    String password = request.getParameter("pass");
    // Database connection details
        boolean alert_u=false,alert_e=false;
           while(rs.next())
           {
               
               String dbuser=rs.getString("username");
               String dbemail=rs.getString("email");

                      if(dbuser.equals(username))
                        {
                            alert_u=true;
                        }
                      
                      if(dbemail.equals(email))
                         {
                            alert_e=true;
                         }
                      
  
           }  
        // Prepare the SQL statement
  
               if(alert_u== false)
               {
                   if(alert_e==false)
                   {

                String sql1 = "INSERT INTO register (username,email,curr_city,password) VALUES (?, ?, ?, ?)";
                stmt1 = conn.prepareStatement(sql1);
                stmt1.setString(1, username);
                stmt1.setString(2, email);
                stmt1.setString(3, curr_city);
                stmt1.setString(4, password);
                int rowsAffected = stmt1.executeUpdate();

                if (rowsAffected > 0){
                     out.println("<div class='alert success'>");
                     out.println("<span class='closebtn'>&times;</span>");  
                     out.println("<strong> Congratulation ! </strong> You have Successfully Registered !!");
                    out.println("</div>');");
                    
                                         %>
                     <script type="text/javascript">          
                    setTimeout(function(){
                        window.location.href = "login.jsp";
                                        }, 1000); // 1 second delay
                    </script>
                     <%
                } else {
                out.println("Registration failed. Please try again.");
                }
               }
               }

        
        
//           for notification or validation this code is designed
           if(alert_u)
           {
                      out.println("<div class='alert warning'>");
                     out.println("<span class='closebtn'>&times;</span>");  
                     out.println("<strong> Attention ! </strong> Username Already exist ! ");
                     out.println("</div>'");
                    if(alert_e)
                    {
                        out.println("<div class='alert info'>");
                        out.println("<span class='closebtn'>&times;</span>");  
                        out.println("<strong> Attention ! </strong> Username and Email Already exits !!");
                        out.println("</div>');");
                    }


           }

        // Execute the statement
            }
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
//           if( e.getMessage().equals(Communications link failure The last packet sent successfully to the server was 0 milliseconds ago. The driver has not received any packets from the server."))
//            {
//                        out.println("<div class='alert warning'>");
//                        out.println("<span class='closebtn'>&times;</span>");  
//                        out.println("<strong> </strong> Xamp chalu kar na be !");
//                        out.println("</div>');");            
//            }
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