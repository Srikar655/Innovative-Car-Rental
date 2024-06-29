
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
        min-height: 100vh;
    }
    .content {
        flex: 1;
        padding: 20px;
    }
    .navbar-brand {
        font-size: 1.5rem;
        font-weight: bold;
        color: #f06292;
    }
    .navbar-brand:hover {
        color: #ef9a9a;
    }
    .custom-card-header {
        background-color: #f06292;
        color: white;
        font-weight: bold;
        text-align: center;
    }
    .card {
        margin-bottom: 20px;
    }
    .table {
        margin-bottom: 0;
    }
    .scrollpane {
        max-height: 150px; /* Adjust height as needed */
        overflow-y: auto;
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
        font-size: 0.875rem;
    }
    .footer p {
        margin: 5px 0;
    }
    .footer a {
        color: #f8f9fa;
        margin: 0 5px;
        text-decoration: none;
        transition: color 0.3s;
    }
    .footer a:hover {
        color: #adb5bd;
    }
    .footer-icons a {
        margin: 0 5px;
        font-size: 1.2rem;
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
<c:choose>
    <c:when test="${param.val eq 'Cancelled' }">
        <%
            if(request.getParameter("rentalno")!=null)
            {
                CustomerService cs=new CustomerService();
                Rentals rental=cs.findRental(Integer.parseInt(request.getParameter("rentalno")));
                rental.setStatus("Cancelled");
                cs.edit(rental);
                response.sendRedirect("UserHomePageService.jsp?value=reservations");
            }
        %>
    </c:when>
</c:choose>
<%
    RentalsService rs=new RentalsService();
    List<Rentals> fornext2days=rs.getTwoDays();
    List<Rentals> list=rs.getAll();
    List<Rentals> cancelled=rs.getCancelled("Cancelled");
    session.setAttribute("fornext2days",fornext2days);
    session.setAttribute("list",list);
    session.setAttribute("cancelled",cancelled);
%>
<div class="content">
    <div class="row">
        <div class="col-md-9">
            <div class="card">
                <div class="card-header custom-card-header">
                    Reservations (In Next 2 Days)
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
                            <c:forEach items="${fornext2days}" var="temp">
                                <tr>
                                    <td>${temp.renatalNo}</td>
                                    <td>${temp.reservationDate}</td>
                                    <td>${temp.startDate}</td>
                                    <td>${temp.endDate}</td>
                                    <td>${temp.sourceLocation.cityName}</td>
                                    <td>${temp.destinationLocation.cityName}</td>
                                    <td>${temp.vehicleRate}</td>
                                    <td><a href="Reservations.jsp?val=Cancelled&rentalno=${temp.renatalNo}"><i>&times;</i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
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
                                    <td><a href="Reservations.jsp?val=Cancelled&rentalno=${temp.renatalNo}"><i>&times;</i></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="card">
                <div class="card-header custom-card-header">
                    Cancelled Reservations
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
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${cancelled}" var="temp">
                                <tr>
                                    <td>${temp.renatalNo}</td>
                                    <td>${temp.reservationDate}</td>
                                    <td>${temp.startDate}</td>
                                    <td>${temp.endDate}</td>
                                    <td>${temp.sourceLocation.cityName}</td>
                                    <td>${temp.destinationLocation.cityName}</td>
                                    <td>${temp.vehicleRate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>	
  
</body>
</html>
