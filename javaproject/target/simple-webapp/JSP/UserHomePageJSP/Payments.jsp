<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.iss.services.*,java.util.*,com.iss.models.*,java.text.*,java.sql.Date,com.razorpay.*,org.json.JSONObject" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/qrcodejs/qrcode.min.js"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<style>
    html, body {
        height: 100%;
        margin: 0;
        font-family: Arial, sans-serif;
        background: url('https://images.pexels.com/photos/733745/pexels-photo-733745.jpeg') no-repeat center center fixed;
        background-size: cover;
        color: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .card {
        width: 100%;
        max-width: 500px;
        margin: 20px;
        border-radius: 15px;
        background-color: transparent; /* Set background color to transparent */
        color: #000; /* Text color */
    }
    .custom-card-header {
        background-color: rgba(240, 98, 146, 0.7); /* Adjusted opacity for header */
        color: white;
        font-weight: bold;
        text-align: center;
        padding: 10px;
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
    }
    .card-body {
        padding: 20px;
    }
    .custom-input {
        border: 2px solid #f06292;
        border-radius: 20px;
        padding: 10px;
        width: 100%;
        margin-bottom: 10px;
        font-size: 16px;
    }
    .text-zinc-700 {
        color: #00bfa5;
        font-weight: bold;
        margin-bottom: 5px;
        display: block;
    }
    .custom-btn {
        border: 2px solid #f06292;
        padding: 12px 24px;
        border-radius: 20px;
        color: #f06292;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
        font-size: 16px;
        display: block;
        margin: 0 auto;
        animation: pulse 2s infinite;
    }
    .custom-btn:hover {
        background-color: #f06292;
        color: white;
    }
    @keyframes pulse {
        0% {
            transform: scale(1);
        }
        50% {
            transform: scale(1.1);
        }
        100% {
            transform: scale(1);
        }
    }
</style>
</head>
<body>
    <c:choose>
        <c:when test="${param.btn eq 'Google Checkout'}">
            <jsp:useBean id="rental" class="com.iss.models.Rentals" scope="request">
                <jsp:setProperty name="rental" property="status" value="progress" />
            </jsp:useBean>
            <% 
                try {
                    CustomerService cs = new CustomerService();
                    Customers customer = cs.find(Integer.parseInt("" + session.getAttribute("customerno")));
                    Vehicles v = new VehiclesService().find(Integer.parseInt("" + session.getAttribute("vehicleno")));
                    rental.setVehicle(v);
                    rental.setCustomer(customer);
                    rental.setVehicleRate((int) Double.parseDouble(request.getParameter("total")));
                    rental.setNoofDays((int) Double.parseDouble(request.getParameter("days")));
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date utilStartDate = formatter.parse(request.getParameter("startdate"));
                    java.sql.Date sqlStartDate = new java.sql.Date(utilStartDate.getTime());
                    java.util.Date utilEndDate = formatter.parse(request.getParameter("enddate"));
                    java.sql.Date sqlEndDate = new java.sql.Date(utilEndDate.getTime());
                    rental.setStartDate(sqlStartDate);
                    rental.setEndDate(sqlEndDate);
                    rental.setReservationDate(sqlStartDate);
                    Cities city1 = new CitiesService().find(Integer.parseInt(request.getParameter("selectcityfrom")));
                    Cities city2 = new CitiesService().find(Integer.parseInt(request.getParameter("selectcityto")));
                    rental.setSourceLocation(city1);
                    rental.setDestinationLocation(city2);
                    cs.add(rental);
                    session.setAttribute("rentalno", rental.getRenatalNo());
                    session.setAttribute("loginsuccess", "Welcome-" + request.getParameter("customername"));
                    session.setAttribute("name",customer.getName());
                    session.setAttribute("email",customer.getEmailAddress());
                    session.setAttribute("phoneno",customer.getPhoneNumber());
                    session.setAttribute("address",customer.getAddressLine1()+customer.getAddressLine2());
                    
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            %>
        </c:when>
    </c:choose>
    <%
        session.setAttribute("total", request.getParameter("total"));
    %>
    <div class="card">
        <div class="card-header custom-card-header">
            Transaction 
        </div>
        <div class="card-body">
            <%
                String orderId = createRazorpayOrder(Double.parseDouble("" + session.getAttribute("total")));
                request.setAttribute("orderId", orderId);
            %>
            <label class="block text-zinc-700">OrderId:</label>
            <input type="text"  class="custom-input" id="orderId" value="<%= orderId %>" readonly>
            <label class="block text-zinc-700">Amount:</label>
            <input type="text" class="custom-input" id="amount" value="<%= session.getAttribute("total") %>" readonly>
            <label class="block text-zinc-700">Name:</label>
            <input type="text" class="custom-input" id="name" value="<%= session.getAttribute("name") %>" readonly>
            <label class="block text-zinc-700">Email:</label>
            <input type="text" class="custom-input" id="email" value="<%= session.getAttribute("email") %>" readonly>
            <label class="block text-zinc-700">Phone Number:</label>
            <input type="text" class="custom-input" id="phoneno" value="<%= session.getAttribute("phoneno") %>" readonly>
            <label class="block text-zinc-700">Address:</label>
            <input type="text" class="custom-input" id="address" value="<%= session.getAttribute("address") %>" readonly>
            <input type="hidden" class="custom-input" id="rentalno" value="<%= session.getAttribute("rentalno") %>" >
            
            <button id="rzp-button1" class="custom-btn">Pay Now</button>
        </div>
    </div>
     <script>
     document.addEventListener("DOMContentLoaded", function() {
    	    var options = {
    	        "key": "rzp_test_IA5gXxxWfzsqFs",
    	        "amount": document.getElementById("amount").value * 100,
    	        "currency": "INR",
    	        "name": document.getElementById("name").value,
    	        "description": "Test Transaction",
    	        "order_id": document.getElementById("orderId").value,
    	        "handler": function(response) {
    	            var rentalno = document.getElementById("rentalno").value;
    	            window.location.href = "/simple-webapp/JSP/UserHomePageJSP/Reserved.jsp?rentalno=" + encodeURIComponent(rentalno);
    	        },
    	        "prefill": {
    	            "name": document.getElementById("name").value,
    	            "email": document.getElementById("email").value,
    	            "contact": document.getElementById("phoneno").value
    	        },
    	        "notes": {
    	            "address": document.getElementById("address").value
    	        },
    	        "theme": {
    	            "color": "#3399cc"
    	        },
    	        "modal": {
    	            "ondismiss": function() {
    	                window.location.href = "/simple-webapp/JSP/PaymentPage.jsp?status=failed";
    	            }
    	        }
    	    };
    	    var rzp1 = new Razorpay(options);

    	    document.getElementById('rzp-button1').onclick = function(e) {
    	        rzp1.open();
    	        e.preventDefault();
    	    }
    	});

    </script>
</body>
</html>

<%!
    public String createRazorpayOrder(Double amount) {
        try {
            RazorpayClient razorpay = new RazorpayClient("rzp_test_IA5gXxxWfzsqFs", "oEvEzceL4tl4ZjAxOnNYjEQJ");
            JSONObject orderRequest = new JSONObject();
            orderRequest.put("amount", amount * 100); 
            orderRequest.put("currency", "INR");
            orderRequest.put("receipt", "order_rcptid_11");
            orderRequest.put("payment_capture", true);

            Order order = razorpay.orders.create(orderRequest);
            return order.get("id");
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
%>
