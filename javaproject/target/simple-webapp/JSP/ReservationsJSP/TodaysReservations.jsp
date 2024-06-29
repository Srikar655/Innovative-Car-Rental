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
    .search-bar {
        max-width: 600px;
        margin: 20px auto;
    }
    .bg-orange {
        background-color: #d81b60; 
        color: white; 
    }
    .large-text {
        font-size: 1.25rem; 
        padding: 20px;
    }
    .table-delete-btn {
        border: none;
        background-color: transparent;
        color: #ef5350;
        cursor: pointer;
        font-size: 1.2rem;
        transition: color 0.3s;
    }
    .table-delete-btn:hover {
        color: #e57373;
    }
    .footer {
        background: linear-gradient(to right, #343a40, #495057);
        color: white;
        padding: 10px 0;
        text-align: center;
        font-family: 'Arial', sans-serif;
        position: relative;
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
</style>
</head>
<body>
<%
	RentalsService rs=new RentalsService();
	List<Rentals> list=rs.getTodays();
	session.setAttribute("list",list);
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Reservation Details</a>
        <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                <a class="nav-link active" href="/simple-webapp/JSP/MenuPage.jsp"><img src="https://thumbs.dreamstime.com/b/home-button-simple-vector-illustration-blue-round-white-background-131069041.jpg" alt="Logo" style="width:40px;" class="rounded-pill"></a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="#"><img src="https://icons4web.com/wp-content/uploads/2017/11/Add-internet-icon-190282.jpg" alt="Logo" style="width:40px;" class="rounded-pill"></a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="#"><img src="https://th.bing.com/th/id/OIP.xw9yUAyagcIGoD2GbqheqgHaHY?rs=1&pid=ImgDetMain" alt="Logo" style="width:40px;" class="rounded-pill"></a>
            </li>
        </ul>
    </div>
</nav>
<div class="content">
    <div class="row">
        <div class="col-sm-12 bg-primary text-white">
            <div class="search-bar">
                <form class="d-flex" action="Owners.jsp?action=search" method="post">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search" id="search">
                    <button class="btn btn-outline-light" type="submit" name="btn" id="btn" value="search"><img src="https://static.vecteezy.com/system/resources/previews/018/842/691/non_2x/search-icon-with-magnifying-glass-research-and-analysis-button-3d-rendering-free-png.png" alt="Logo" style="width:40px;" class="rounded-pill"></button>
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 bg-orange text-white large-text">
            --ExistingRecords--
        </div>
    </div>
    <c:choose>
        <c:when test="${param.val=='Cancelled'}">
            <%
	            try {
		            	if(request.getParameter("rentalno")!=null)
		                {
		                    CustomerService cs=new CustomerService();
		                    Rentals rental=cs.findRental(Integer.parseInt(request.getParameter("rentalno")));
		                    rental.setStatus("Cancelled");
		                    cs.edit(rental);
		                    response.sendRedirect("TodaysReservations.jsp");
		                }
	            } catch(Exception ex) {
	                ex.printStackTrace();		
	            }
            %>
        </c:when>
    </c:choose>
    <div class="container mt-3 table-responsive" style="height:320px">
        <div class="card">
                <div class="card-header custom-card-header">
                    Reservations 
                </div>
                <div class="card-body scrollpane">
                    <table class="table table-striped table-bordered table-dark">
                        <thead>
                            <tr>
                                <th>Reg.No</th>
                                <th>Reservations</th>
                                <th>From</th>
                                <th>To</th>
                                <th>Source</th>
                                <th>Destination</th>
                                <th>Amount</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="temp">
                                <tr>
                                    <td>${temp.renatalNo}</td>
                                    <td>${temp.reservationDate}</td>
                                    <td>${temp.startDate}</td>
                                    <td>${temp.endDate}</td>
                                    <td>${temp.sourceLocation.cityName}</td>
                                    <td>${temp.destinationLocation.cityName}</td>
                                    <td>${temp.vehicleRate}</td>
                                    <td><a href="TodaysReservations.jsp?val=Cancelled&rentalno=${temp.renatalNo}"><i>&times;</i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
    </div>
</div>
<footer class="footer">
    <div class="container">
        <p>&copy; 2024 Your Company. All rights reserved.</p>
        <p>Contact us at: <a href="mailto:info@yourcompany.com">info@InnovativeSoftwareSolutions.com</a></p>
        <div class="footer-icons">
            <a href="https://www.facebook.com/InnovativeSoftwareSolutions.org/" target="_blank"><img src="https://png.pngtree.com/png-clipart/20190515/original/pngtree-facebook-social-media-icon-png-image_3572498.jpg" alt="Logo" style="width:40px;" class="rounded-pill"><i class="bi bi-facebook"></i></a>
            <a href="https://www.instagram.com/srikar_655/?igsh=MWpoZzljZGZyZmxpaw%3D%3D" target="_blank"><img src="https://th.bing.com/th/id/OIP.1ZFzMQYnNghA_MZUU-hqIgHaF5?rs=1&pid=ImgDetMain" alt="Logo" style="width:40px;" class="rounded-pill"><i class="bi bi-twitter"></i></a>
            <a href="https://x.com/i/flow/login?redirect_after_login=%2FInnovativeSoft3" target="_blank"><img src="https://e7.pngegg.com/pngimages/930/355/png-clipart-angle-symbol-brand-logo-utilities-x11-angle-logo.png" alt="Logo" style="width:40px;" class="rounded-pill"><i class="bi bi-instagram"></i></a>
        </div>
    </div>
</footer>
</body>
</html>
