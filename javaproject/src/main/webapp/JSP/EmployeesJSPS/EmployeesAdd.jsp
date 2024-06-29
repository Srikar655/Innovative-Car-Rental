<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.iss.services.*,java.util.*,com.iss.models.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
    body {
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }
    .content {
        flex: 1;
    }
    .navbar-brand {
        font-size: 1.5rem;
        font-weight: bold;
        color: #007bff;
    }
    .navbar-brand:hover {
        color: #0056b3;
    }
    .form-container {
        margin-top: 50px;
    }
    .custom-input {
        border: 2px solid #007bff;
        border-radius: 20px;
        padding: 10px;
        width: 100%;
        box-sizing: border-box;
        transition: all 0.3s ease;
    }
    .custom-input:focus {
        border-color: #0056b3;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    }
    .custom-btn {
        border: 2px solid #007bff;
        padding: 10px 20px;
        border-radius: 20px;
        background-color: #007bff;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .custom-btn:hover {
        background-color: #0056b3;
    }
    .footer {
        background: linear-gradient(to right, #343a40, #495057);
        color: white;
        padding: 10px 0;
        text-align: center;
        font-family: 'Arial', sans-serif;
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
    .custom-card-header {
        background-color: #007bff;
        color: white;
        font-size: 1.5rem;
        font-weight: bold;
        text-align: center;
        padding: 10px;
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
    }
</style>
</head>
<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">EmployeeDetails</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="/simple-webapp/JSP/MenuPage.jsp">
                        <img src="https://thumbs.dreamstime.com/b/home-button-simple-vector-illustration-blue-round-white-background-131069041.jpg" alt="Logo" style="width:40px;" class="rounded-pill">
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="Employees.jsp">
                        <img src="https://th.bing.com/th/id/OIP.D5Npngc53EqWc9tZ6VFytAHaHa?rs=1&pid=ImgDetMain" alt="Logo" style="width:40px;" class="rounded-pill">
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#">
                        <img src="https://th.bing.com/th/id/OIP.xw9yUAyagcIGoD2GbqheqgHaHY?rs=1&pid=ImgDetMain" alt="Logo" style="width:40px;" class="rounded-pill">
                    </a>
                </li>
            </ul>
        </div>
    </nav>
    
    <div class="content">
        <form action="EmployeesAdd.jsp" method="post">
            <div class="container form-container">
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <input type="text" class="form-control custom-input" placeholder="Employee Name" aria-label="Employee Name" name="employeename" id="employeename">
                    </div>
                    <div class="col-md-4 mb-3">
                    	<select class="form-select custom-input" name="selectemptype" id="selectemptype">
                    				 <%
                                        List<EmployeeTypes> list = new EmployeeTypesService().getAll();
                                        request.setAttribute("etypes", list);
                                    %>
                                    <option>--Select Emoloyee Type--</option>
                                    <c:forEach items="${etypes}" var="temp">
                                        <option value="${temp.type}">${temp.type}</option>
                                    </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <input type="text" class="form-control custom-input" placeholder="Email Address" aria-label="Email Address" name="emailaddress" id="emailaddress">
                    </div>
                </div>
            </div>
            <div class="container mt-3">
                <div class="card">
                    <div class="card-header custom-card-header">
                        Address details
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <input type="text" class="form-control custom-input" placeholder="Address" aria-label="Address" name="address1" id="address">
                            </div>
                            <div class="col-md-12 mb-3">
                                <input type="text" class="form-control custom-input" placeholder="Address" aria-label="Address" name="address2" id="address">
                            </div>
                            <div class="col-md-6 mb-3">
                                <select class="form-select custom-input" name="selectcountry" id="selectcountry">
                                    <%
                                        List<Countries> countrieslist = new CountriesService().getAll();
                                        request.setAttribute("countries", countrieslist);
                                    %>
                                    <option>--Select Country--</option>
                                    <c:forEach items="${countries}" var="temp">
                                        <option value="${temp.countryNo}">${temp.country}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <select class="form-select custom-input" name="selectstate" id="selectstate">
                                    <%
                                        List<States> stateslist = new StatesService().getAll();
                                        request.setAttribute("states", stateslist);
                                    %>
                                    <option>--Select State--</option>
                                    <c:forEach items="${states}" var="temp">
                                        <option value="${temp.stateNo}">${temp.stateName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                        	 <div class="col-md-6 mb-3">
                                <select class="form-select custom-input" name="selectcity" id="selectcity">
                                    <%
                                        List<Cities> citieslist = new CitiesService().getAll();
                                        request.setAttribute("cities", citieslist);
                                    %>
                                    <option>--Select City--</option>
                                    <c:forEach items="${cities}" var="temp">
                                        <option value="${temp.cityNo}">${temp.cityName}</option>
                                    </c:forEach>
                                </select>
                               </div>
                              <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Pincode" aria-label="Pincode" name="Pincode" id="Pincode">
                               </div>
                        </div>
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-header custom-card-header">
                        Contact details
                    </div>
                    <div class="card-body">
                        <div class="container form-container">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Phone Number" aria-label="Phone Number" name="phonenumber" id="phonenumber">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Mobile Number" aria-label="Mobile Number" name="mobilenumber" id="mobilenumber">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="card mt-3">
                    <div class="card-header custom-card-header">
                        LoginDetails
                    </div>
                    <div class="card-body">
                        <div class="container form-container">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="User Name" aria-label="User Name" name="username" id="username">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Password" aria-label="Password" name="pass" id="pass">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header custom-card-header">
                        Bank Details
                    </div>
                    <div class="card-body">
                        <div class="container form-container">
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Bank" aria-label="Bank" name="bank" id="bank">
                                </div>
                                <div class="col-md-4 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Account Number" aria-label="Account Number" name="accountnumber" id="accountnumber">
                                </div>
                                <div class="col-md-4 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Pan Number" aria-label="Pan Number" name="pannumber" id="pannumber">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header custom-card-header">
                        Privileges
                    </div>
                    <div class="card-body">
                        <div class="container form-container">
                            <div class="row">
                                <div class="col-md-2 mb-3">
                                     <div class="form-check">
								      <input type="checkbox" class="form-check-input" id="radio1" name="cities" value="true" >
								      <label class="form-check-label" for="radio1">Cities</label>
								    </div>
                                </div>
                                <div class="col-md-2 mb-3">
									<div class="form-check">
								      <input type="checkbox" class="form-check-input" id="radio1" name="states" value="true" >
								      <label class="form-check-label" for="radio1">States</label>
								    </div>   
	                             </div>
                                <div class="col-md-2 mb-3">
									<div class="form-check">
								      <input type="checkbox" class="form-check-input" id="radio1" name="countrys" value="true" >
								      <label class="form-check-label" for="radio1">Countries</label>
								    </div>
                                </div>
                                <div class="col-md-2 mb-3">
									<div class="form-check">
								      <input type="checkbox" class="form-check-input" id="radio1" name="vehicles" value="true" >
								      <label class="form-check-label" for="radio1">Vehicles</label>
								    </div>
                                </div>
                                <div class="col-md-2 mb-3">
									<div class="form-check">
								      <input type="checkbox" class="form-check-input" id="radio1" name="make" value="true" >
								      <label class="form-check-label" for="radio1">Make</label>
								    </div>
                                </div>
                                 <div class="col-md-2 mb-3">
									<div class="form-check">
								      <input type="checkbox" class="form-check-input" id="radio1" name="models" value="true" >
								      <label class="form-check-label" for="radio1">Models</label>
								    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2 mb-3">
                                     <div class="form-check">
								      <input type="checkbox" class="form-check-input" id="radio1" name="employees" value="true" >
								      <label class="form-check-label" for="radio1">Employees</label>
								    </div>
                                </div>
                                <div class="col-md-2 mb-3">
									<div class="form-check">
								      <input type="checkbox" class="form-check-input" id="radio1" name="customers" value="true" >
								      <label class="form-check-label" for="radio1">Customers</label>
								    </div>   
	                             </div>
                                <div class="col-md-2 mb-3">
									<div class="form-check">
								      <input type="checkbox" class="form-check-input" id="radio1" name="owners" value="true" >
								      <label class="form-check-label" for="radio1">Owners</label>
								    </div>
                                </div>
                                <div class="col-md-2 mb-3">
									<div class="form-check">
								      <input type="checkbox" class="form-check-input" id="radio1" name="drivers" value="true" >
								      <label class="form-check-label" for="radio1">Drivers</label>
								    </div>
                                </div>
                                <div class="col-md-2 mb-3">
									<div class="form-check">
								      <input type="checkbox" class="form-check-input" id="radio1" name="reservations" value="true" >
								      <label class="form-check-label" for="radio1">Reservations/Rentals</label>
								    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-center mt-4">
                <button class="custom-btn" type="submit" name="btn" value="add">Add</button>
                <button class="custom-btn" type="submit" name="btn" value="clear">Clear</button>
            </div>
        </form>
    </div>
    
    <c:choose>
        <c:when test="${param.btn == 'add'}">
         <jsp:useBean id="employees" class="com.iss.models.Employees" scope="request">
                <jsp:setProperty name="employees" property="name" value="${param.employeename}" />
                <jsp:setProperty name="employees" property="employeeType" value="${param.selectemptype}" />
                <jsp:setProperty name="employees" property="addressLine1" value="${param.address1}" />
                <jsp:setProperty name="employees" property="addressLine2" value="${param.address2}" />
                <jsp:setProperty name="employees" property="pincode" value="${param.Pincode}" />
                <jsp:setProperty name="employees" property="phoneNumber" value="${param.phonenumber}" />
                <jsp:setProperty name="employees" property="mobileNumber" value="${param.mobilenumber}" />
                <jsp:setProperty name="employees" property="emailAddress" value="${param.emailaddress}" />
                <jsp:setProperty name="employees" property="bankName" value="${param.bank}" />
                <jsp:setProperty name="employees" property="bankAccount" value="${param.accountnumber}" />
                <jsp:setProperty name="employees" property="PAN" value="${param.pannumber}" />
                <jsp:setProperty name="employees" property="username" value="${param.username}" />
                <jsp:setProperty name="employees" property="password" value="${param.pass}" />
                <jsp:setProperty name="employees" property="cities" value="${param.cities}" />
                <jsp:setProperty name="employees" property="states" value="${param.states}" />
                <jsp:setProperty name="employees" property="countries" value="${param.countrys}" />
                <jsp:setProperty name="employees" property="vehicles" value="${param.vehicles}" />
                <jsp:setProperty name="employees" property="vehicleMakes" value="${param.make}" />
                <jsp:setProperty name="employees" property="vehicleModels" value="${param.models}" />
                <jsp:setProperty name="employees" property="employees" value="${param.employees}" />
                <jsp:setProperty name="employees" property="customers" value="${param.customers}" />
                <jsp:setProperty name="employees" property="owners" value="${param.owners}" />
                <jsp:setProperty name="employees" property="drivers" value="${param.drivers}" />
                <jsp:setProperty name="employees" property="rentals" value="${param.reservations}" />
            </jsp:useBean>
                <% 
                    try {
                    	Cities	city=new CitiesService().find(Integer.parseInt(request.getParameter("selectcity")));
                    	States state=new StatesService().find(Integer.parseInt(request.getParameter("selectstate")));
                    	Countries country=new CountriesService().find(Integer.parseInt(request.getParameter("selectcountry")));
                    	employees.setCity(city);
                    	employees.setCountry(country);
                    	employees.setState(state);
                        new EmployeesService().add(employees);
                    } catch(Exception ex) {
                        ex.printStackTrace();        
                    }
                %>
        </c:when>
         <c:when test="${param.btn=='clear'}">
        	<%
        		try{
        				response.sendRedirect("EmployeesAdd.jsp");
        		}catch(Exception ex) {
                    ex.printStackTrace();        
                }
        	%>
        </c:when>
    </c:choose>
    
    <footer class="footer">
        <div class="container">
            <p>&copy; 2024 InnovativeSoftwareSolutions. All rights reserved.</p>
            <p>Contact us at: <a href="mailto:info@InnovativeSoftwareSolutions.com">info@InnovativeSoftwareSolutions.com</a></p>
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
