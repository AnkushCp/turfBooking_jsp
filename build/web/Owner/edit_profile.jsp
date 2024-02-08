<%-- 
    Document   : edit_turf
    Created on : 7 Jun, 2023, 10:04:22 PM
    Author     : AnkushCp
--%>

<%-- 
    Document   : register
    Created on : 5 Jun, 2023, 9:34:03 PM
    Author     : AnkushCp
--%>
<%@ page import="java.sql.*" %>
<%@ include file="o_auth.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="../css/regi.css">
              <link rel="stylesheet" href="../css/login.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
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
        <img src="../images/ground1.png" alt="ground">
       </div>
    <div class="header">
        <div class="left_header">
                <img src="../images/logo.png" alt="logo">
        </div>
        <div class="right_header">
                <div class="menu">
          
                    <li><a href="Dash.jsp?alertd=false">DashBoard</a></li>
                    <li><a href="ed_turf.jsp">Edit Turf</a></li>
                    <li><a href="o_logout.jsp">Log out</a></li>
                </div>

        </div>
    </div>


    <%  String url = "jdbc:mysql://localhost:3306/turfs";   
    String dbUsername = "root";
    String dbPassword = "";
    Connection conn = null;
                        HttpSession sessio = request.getSession();
            String username= (sessio != null) ? (String) sessio.getAttribute("OwnerLoggedIn") : null;
    PreparedStatement stmt = null,stmt1=null;
    try {
    
      Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);


        
        String sql = "select * from o_register where email=?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1,username);
        ResultSet rs=stmt.executeQuery();

        while(rs.next())
    {
%>
             <div class="form_container">
        <form  method="post" action="<%=request.getContextPath()%>/Owner/edit_profile.jsp">
            <input type="text" name="name" class="field" value="<%= rs.getString("username")%>" required><br>     
            <input type="email" name="email" class="field" value="<%= rs.getString("email")%>"  required><br>
            <input type="text" name="gstno" class="field"  value="<%= rs.getString("gstno")%>"  required><br>
            <input type="text" name="phone" class="field" value="<%= rs.getString("phone")%>" placeholder="Enter mobile number" required><br>
            <input type="password" name="pass" id="passo" class="field" value="<%= rs.getString("password")%>"  required>
            <i class="far fa-eye" id="togglePassword" style="position: relative;left: -18px; margin-left: -24px;cursor: pointer;"></i><br>
            <input type="submit" class="register" value="Update" >
       </form>
            </div>
            <%
                }
    // Get form data
     if (request.getMethod().equalsIgnoreCase("post"))
     {
    String username1 = request.getParameter("name");
    String email = request.getParameter("email");
    String gstno = request.getParameter("gstno");
    String password = request.getParameter("pass");
    String phone = request.getParameter("phone");
    // Database connection details
//        boolean alert_u=false,alert_e=false;
//           while(rs.next())
//           {
//               
//               String dbuser=rs.getString("username");
//               String dbemail=rs.getString("email");
//
//                      if(dbuser.equals(username1))
//                        {
//                            alert_u=true;
//                        }
//                      
//                      if(dbemail.equals(email))
//                         {
//                            alert_e=true;
//                         }
//                      
//  
//           }  
        // Prepare the SQL statement
//  
//               if(alert_u== false)
//               {
//                   if(alert_e==false)
//                   {

                String sql1 = "update o_register set username=?,email=?,gstno=?,password=?,phone=? where email=?";
                stmt1 = conn.prepareStatement(sql1);
                stmt1.setString(1, username1);
                stmt1.setString(2, email);
                stmt1.setString(3, gstno);
                stmt1.setString(4, password);
                stmt1.setString(5, phone);
               stmt1.setString(6, email);
                int rowsAffected = stmt1.executeUpdate();

                if (rowsAffected > 0){
                     out.println("<div class='alert success'>");
                     out.println("<span class='closebtn'>&times;</span>");  
                     out.println("<strong> Congratulation ! </strong> Updated SuccessFully !!");
                    out.println("</div>");
                    
                                         %>
                     <script type="text/javascript">          
                    setTimeout(function(){
                        window.location.href = "Dash.jsp?alertd=false";
                                        }, 1000); // 1 second delay
                    </script>
                     <%
                } else {
                out.println("Registration failed. Please try again.");
                }
      

        
        
//           for notification or validation this code is designed
//           if(alert_u)
//           {
//                      out.println("<div class='alert warning'>");
//                     out.println("<span class='closebtn'>&times;</span>");  
//                     out.println("<strong> Attention ! </strong> Username Already exist ! ");
//                     out.println("</div>'");
//                    if(alert_e)
//                    {
//                        out.println("<div class='alert warning'>");
//                        out.println("<span class='closebtn'>&times;</span>");  
//                        out.println("<strong> Attention ! </strong> Username and  Email match!!");
//                        out.println("</div>');");
//                    }
//
//
//           }

        // Execute the statement
            }
    } catch (Exception e) {
        out.println("An error occurred: " + e.getMessage());
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
