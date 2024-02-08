<%-- 
    Document   : pay_turf
    Created on : 13 Jun, 2023, 9:45:06 PM
    Author     : AnkushCp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="css/regi.css">
              <link rel="stylesheet" href="css/pay.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
  
        <title>JSP Page</title>
    </head>
    <body>
            <div class="header">
        <div class="left_header">
                <img src="images/logo.png" alt="logo">
        </div>

    </div>
         <div class="heading">
        <h1>Continue Payment</h1>
 </div>
        <%! 
        String apikey="rzp_test_fZXLWDa4k6IzGQ";
        String email="";
        String add="";
        String phone="";
        String name="";
        float price=0;
        int randomNumber=0;
        String rn="";
          %>
          <%
        price=Float.parseFloat(request.getParameter("p"));
        name=request.getParameter("name");
        email=request.getParameter("email");
        add=request.getParameter("add");
        phone=request.getParameter("phone");
        
        Random random = new Random();

        // Generate a random integer between 1 and 100
         randomNumber = random.nextInt(20001) + 80000;
         rn=Integer.toString(randomNumber);
          %>
          <form action="reciept.jsp?succ=success&param2=<%= email%>" method="POST" class="pay_form">
<script
    src="https://checkout.razorpay.com/v1/checkout.js"
    data-key="<%= apikey%>"
    data-amount="<%=price*100%>" 
    data-currency="INR"

    data-buttontext="Continue →"
    data-name="Turf Booking.in"
    data-description="Turf booking System"
    data-image="https://example.com/your_logo.jpg"
    data-prefill.name="<%= name%>"
    data-prefill.email="<%= email%>"
       data-prefill.contact="<%= phone%>"
    data-theme.color="#49c231"
>
</script>
<input type="hidden" custom="Hidden Element" name="hidden"/>
</form>
    </body>
</html>
