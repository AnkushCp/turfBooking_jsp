<%--
    Document   : reciept
    Created on : 31 May, 2023, 8:17:40 PM
    Author     : AnkushCp
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*" %>
<%@ include file="auth_session.jsp" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
        <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/regi.css">
     <link rel="stylesheet" href="css/reciept.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&family=Roboto:wght@500&display=swap" rel="stylesheet">
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
<!--    <style>
          
            /* Define styles specifically for printing */
       
        .reciept_contain{
    display: flex;
}
.reciept_contain .reciept{

     background: #dfdcd891;
    margin: auto;
    border-radius: 13px;
    margin-top: 48px;
    padding: 57px;
}
marquee{
           font-weight: bold;
    font-family: poppins;
    color: black;
    background: linear-gradient(142deg, #7ed078f2 34.68%, #43b4b3 64.89%);
}
.reciept_contain .reciept .fline{
    display: flex;
}
.reciept_contain .reciept .fline h1{
 color:#022137;
    padding: 10px;
    font-size: 15px;
    font-family: poppins;
    font-weight: bold;
}
p{
font-family: 'Raleway', sans-serif;
    padding: 10px;
    font-size: 14px;
    color: #2fb94e;
    font-weight: bold;
    align-self: center;
}
.butt{
    display: flex;
    margin: auto;
    justify-content: center
}
.butt button{
border: none;
    background: #59bc42;
    border-radius: 19px;
    font-family: 'Poppins';
    font-weight: bold;
    color: black;
    width: 95px;
    padding: 4px;
    margin-top: 12px;
}

    </style>-->
</head>
<body>

<div class="header">
    <div class="left_header">
        <img src="images/logo.png" alt="logo">
    </div>
    <div class="right_header">
        <div class="menu">
  
            <li><a href="Turfs.jsp">Turfs</a></li>
            <li><a href="about.html">About</a></li>
                    <li><a href="log_out.jsp">Log out</a></li>
        </div>
    </div>
</div>
<marquee id="marq">* Note :  show the receipt to turf it is valid till the book date </marquee>>
<%!
    
    String email="";
    String success="";
    String time="";
    String tp="";
    String username="";
    String location="";
    String address="";
    float price=0;
        String url = "jdbc:mysql://localhost:3306/turfs";  // Update with your Oracle connection details
        String dbUsername = "root";
        String dbPassword = "";
        Connection conn = null;
        PreparedStatement stmt = null,stmt1 = null;
        ResultSet rs=null,rs1=null;
        LocalDate date;
        String cdate="";
    %>
<%
     LocalDate currentDate = LocalDate.now();

    try{
     success=request.getParameter("succ");
     email=request.getParameter("param2");
        if(success.equals("success"))
        {
                     out.println("<div class='alert success'>");
                     out.println("<span class='closebtn'>&times;</span>");  
                     out.println("<strong> Attention ! </strong> Payment done Succefully !!");
                    out.println("</div>');");
        }
        
       
                // Connect to the database
                 Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);
   
                String sql="select * from book_turf where email=? ";
                stmt1=conn.prepareStatement(sql);
                 stmt1.setString(1, email);
                 rs1=stmt1.executeQuery();
                 while(rs1.next())
                 {
                 address=rs1.getString("address");
                 date=rs1.getDate("date").toLocalDate();
                 price=rs1.getFloat("price");
                 time=rs1.getString("time");
                 tp=rs1.getString("tp");
                 }

                String sql2="select username,curr_city from register where email = ?";
                stmt=conn.prepareStatement(sql2);
                stmt.setString(1, email);
//                  Date sqlDate = Date.valueOf(date);
//                 stmt.setDate(2,sqlDate);               
                rs=stmt.executeQuery();
                 while(rs.next()) {
                username=rs.getString("username");
                 location=rs.getString("curr_city");
                  }
                // Prepare the SQL statement 

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
// 
                    if(date.isEqual(currentDate) || date.isAfter(currentDate));
                {


    %>
<div class="reciept_contain">
    <div class="reciept">
        <div class="fline">
            <H1>Name : </H1>
            <p><%=username%></p>
        </div>
        <div class="fline">
            <h1>Email : </h1>
            <p><%=email%></p>
        </div>
        <div class="fline">
            <h1>Address : </h1>
            <p><%=address %></p>
        </div>
        <div class="fline">
            <h1>Price : </h1>
            <p><%=price%></p>
                    </div>
        <div class="fline">
            <h1>Location : </h1>
            <p><%=location%></p>
        </div>
        <div class="fline">
            <h1>Time : </h1>
            <p><%=time%></p>
        </div>
        <div class="fline">
            <h1>Time period : </h1>
            <p><%=tp%></p>
        </div>
    </div>
</div>
   <div class="butt">
       <button onclick="printPage()" id="printButton">Print</button>
    </div>
    <div class="bookc">
        <div class="boc">
            <img src="bookc.png" class="img1" alt="">
            <img src="icon.gif" class="img2" alt="">
        </div>
    </div>   
<%
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
            <script type="text/javascript">
        function printPage() {
              document.getElementById("printButton").style.display = "none";
                document.getElementById("marq").style.display = "none";
            window.print();
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
