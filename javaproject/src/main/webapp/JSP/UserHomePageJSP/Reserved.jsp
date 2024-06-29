<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.iss.services.*,java.util.*,com.iss.models.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
    html, body {
        height: 100%;
        margin: 0;
    }
    body {
        display: flex;
        flex-direction: column;
    }
    .content {
        flex: 1;
    }
    .navbar-brand {
        font-size: 1.5rem;
        font-weight: bold;
        color: #f06292;
    }
    .navbar-brand:hover {
        color: #ef9a9a;
    }
    .form-container {
      margin-top: 50px;
    }
    .custom-input-group {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }
    .custom-input {
      border: 2px solid #f06292;
      border-radius: 20px;
      padding: 10px;
      width: 300px;
      margin-bottom: 10px;
    }
    .custom-btn {
      border: 2px solid #f06292;
      padding: 10px 20px;
      border-radius: 20px;
      background-color: #f06292;
      color: white;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    .custom-btn:hover {
      background-color: #ef9a9a;
    }
	.custom-card-header {
	        background-color: #f06292;
	        color: white;
	        font-weight: bold;
	        text-align: center;
	    }
        .footer {
        background: linear-gradient(to right, #343a40, #495057);
        color: white;
        padding: 10px 0;
        text-align: center;
        font-family: 'Arial', sans-serif;
        position: sticky;
        bottom: 0;
        width: 100%;
        font-size: 0.875rem; /* Smaller font size */
    }
    .footer p {
        margin: 5px 0; /* Smaller margins */
    }
    .footer a {
        color: #f8f9fa;
        margin: 0 5px; /* Smaller margins */
        text-decoration: none;
        transition: color 0.3s;
    }
    .footer a:hover {
        color: #adb5bd;
    }
    .footer-icons a {
        margin: 0 5px; /* Smaller margins */
        font-size: 1.2rem; /* Smaller icons */
        color: #f8f9fa;
    }
    .footer-icons a:hover {
        color: #adb5bd;
    }
    @media (max-width: 768px) {
        .footer {
            text-align: center;
            padding: 10px;
        }
    }
    .scroll-pane {
	    max-height: 250px;
	    width:500px /* Adjust the height as needed */
	    overflow-y: auto;
	}
	.container {
            text-align: center;
        }
        .image-wrapper {
            display: inline-block;
        }
        .image-wrapper img {
            display: block;
            margin: 0 auto;
        }
        .image-wrapper a {
            display: block;
            text-align: center;
            margin-top: 10px;
        }
        .customer-signup {
        font-size: 2rem;
        font-weight: bold;
        color: #ffffff;
        background: linear-gradient(to right, #ff4081, #ff80ab);
        padding: 0px;
        border-radius: 5px;
        text-align: center;
        margin:  0;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
</style>
</head>
<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Innovative Drive Cars</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="UserHomePageService.jsp">
                        <i class="fas fa-home fa-2x"></i>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    <%
    	int i=Integer.parseInt(request.getParameter("rentalno"));
	    CustomerService	cs=new CustomerService();
		Rentals rental=cs.findRental(i);
    	if(rental != null)
    	{
    		rental.setStatus("Not Yet Shipped");
    		cs.edit(rental);
    		session.setAttribute("rental",rental);
    	}
    %>
    <div class="content">
	    <div class="row">
	        <div class="customer-signup">
	            --Transaction Details--
	        </div>
	    </div>
	</div>
	<div class="container mt-3 table-responsive d-flex justify-content-center align-items-center" style="height: 100vh;">
	    <div>
	        <div class="row mb-0">
	            <div class="col">
	                <div class="customer-signup text-center">
	                    --OrderDetails--
	                </div>
	            </div>
	        </div>
	        <div class="row mb-0">
	            <div class="col">
	                <div class="customer-signup text-center">
	                    --GoogleOrderDetails--
	                </div>
	            </div>
	        </div>
	        <table class="table table-striped table-bordered table-dark" style="max-height: 400px;">
	            <thead>
	                <tr>
	                    <th class="col-3">Shipping Status</th>
	                    <th class="col-1">QTY</th>
	                    <th class="col-6">Item</th>
	                    <th class="col-2">Price</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>${rental.status}</td>
	                    <td>1</td>
	                    <td>
	                        ${param.vehicle.capacity}-
	                        A ${rental.vehicle.color} color-
	                        ${rental.vehicle.vehiclemodels.name}-
	                        for the period of ${rental.noofDays}-
	                        from ${rental.startDate} to ${rental.endDate}
	                    </td>
	                    <td>${rental.vehicleRate}</td>
	                </tr>
	                <tr>
	                    <td colspan="3" class="text-end">Total:</td>
	                    <td>${rental.vehicleRate}</td>
	                </tr>
	            </tbody>
	        </table>
	    </div>
	</div>


    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 Your Company. All rights reserved.</p>
            <p>Contact us at: <a href="mailto:info@yourcompany.com">info@InnovativeSoftwareSolutions.com</a></p>
            <div class="footer-icons">
                <a href="https://www.facebook.com/InnovativeSoftwareSolutions.org/" target="_blank">
                    <img src="https://png.pngtree.com/png-clipart/20190515/original/pngtree-facebook-social-media-icon-png-image_3572498.jpg" alt="Logo" style="width:40px;" class="rounded-pill">
                </a>
                <a href="https://www.instagram.com/srikar_655/?igsh=MWpoZzljZGZyZmxpaw%3D%3D" target="_blank">
                    <img src="https://th.bing.com/th/id/OIP.1ZFzMQYnNghA_MZUU-hqIgHaF5?rs=1&pid=ImgDetMain" alt="Logo" style="width:40px;" class="rounded-pill">
                </a>
                <a href="https://x.com/i/flow/login?redirect_after_login=%2FInnovativeSoft3" target="_blank">
                    <img src="https://e7.pngegg.com/pngimages/930/355/png-clipart-angle-symbol-brand-logo-utilities-x11-angle-logo.png" alt="Logo" style="width:40px;" class="rounded-pill">
                </a>
            </div>
        </div>
    </footer>
</body>
</html>
