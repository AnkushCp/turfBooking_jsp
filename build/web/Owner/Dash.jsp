<%-- 
    Document   : Dash
    Created on : 7 Jun, 2023, 5:49:35 AM
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
        <link rel="stylesheet" href="../css/tab.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Exo+2&family=Lexend&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Exo+2&display=swap" rel="stylesheet">
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
</style>
</head>
<body>
        <div class="header">
        <div class="left_header">
                <img src="../images/logo.png" alt="logo">
        </div>
        <div class="right_header">
                <div class="menu">
                    <li><a href="edit_profile.jsp">Edit profile</a></li>
                    <li><a href="ed_turf.jsp">Edit Turf</a></li>
                    <li><a href="Add_turf.jsp">Add_turf</a></li>
                    <li><a href="o_logout.jsp">Logout</a></li>
                </div>

        </div>
    </div>


        <%!

        String url = "jdbc:mysql://localhost:3306/turfs";   // Update with your Oracle connection details
        String dbUsername = "root";
        String dbPassword = "";
        String username="";
        String tname="";
        Connection conn = null;
        PreparedStatement stmt = null,stmt1=null;
        ResultSet rs=null,rs1=null;
   %> 
                <%
                        HttpSession sessio = request.getSession();
            String username= (sessio != null) ? (String) sessio.getAttribute("OwnerLoggedIn") : null;

            
  
            try {


                         String alertd="false";

                         
                           alertd=request.getParameter("alertd");
                    if(alertd.equals("true"))
                    {
                     out.println("<div class='alert info'>");
                     out.println("<span class='closebtn'>&times;</span>");  
                     out.println("<strong> Sucess!</strong> Record deleted Successfully");             
                     out.println("</div>");
                    }
                String  tname_arr[]=new String[10];
                int i=0,count=0;
                
                // Connect to the database
               Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);
                   
                String sql="select * from turfs where email=?";
                stmt=conn.prepareStatement(sql);
                stmt.setString(1,username);
                rs=stmt.executeQuery();
                while(rs.next())
                {
                        tname_arr[i]=rs.getString("tname");
                        i++;
                        count++;
                }
                // Prepare the SQL statement
             for( i=0;i<count;i++)
             {
                String sql2="select * from book_turf where tname= ?";
                stmt1=conn.prepareStatement(sql2);
                stmt1.setString(1, tname_arr[i]);

                rs1=stmt1.executeQuery();
                if(rs1.next())
                {
                    rs1.previous();
                %>
                    <div class="headin">
                           <h1><%= tname_arr[i] %></h1>
                    </div>
    <div class="table_contain">
        <table class="tab">
            <tr class="t_head">
                <th>Email</th>
                <th>Address</th>
                <th>Time</th>
                <th>Hour</th>
                <th>Price</th>                
                <th>Date</th>
                <th>Action</th>  
            </tr>
                <%
                    
                  while (rs1.next()) {

        %>    <tr>
            <td><%=rs1.getString("email") %></td>
                <td><%=rs1.getString("address")%></td>
                <td><%=rs1.getString("time") %></td>
                <td><%=rs1.getString("tp") %></td>
                <td><%=rs1.getString("price") %></td>
                <td><%=rs1.getString("date") %></td>
                <td><a onclick=" del_confirm('Are you Sure want to delete this record?','delete.jsp?time=<%=rs1.getString("time") %>&email=<%=rs1.getString("email") %>&date=<%=rs1.getString("date") %>')" href="#">Delete</a></td>               
            </tr>
      
  
                  <%}
                  
                  %>
                        </table>
    </div>
                  <%
                      }

                        
}
                  if(rs1==null)
                        {
                       %> 
                       <h1>No Booking found</h1>
                         <%
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
<!--    <div class="ground">
        <img src="images/ground1.png" alt="ground">
       </div>-->


<script>

    function del_confirm(msg,url)
        {
            if(confirm(msg))
            {
                window.location.href=url
            }
            else
            {
                false;
            }

        }
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
