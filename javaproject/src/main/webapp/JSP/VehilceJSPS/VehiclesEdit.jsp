<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.iss.models.*, com.iss.services.*, java.io.*,com.oreilly.servlet.MultipartRequest" %>
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
    .input-group {
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 20px 0;
        }
        .input-group input[type="file"] {
            border: 2px solid #007bff;
            border-radius: 5px;
            padding: 10px;
        }
        .input-group input[type="file"]::file-selector-button {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
        }
        .input-group input[type="file"]::file-selector-button:hover {
            background-color: #0056b3;
        }
</style>
</head>
<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">VehicleDetails</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="/simple-webapp/JSP/MenuPage.jsp">
                        <img src="https://thumbs.dreamstime.com/b/home-button-simple-vector-illustration-blue-round-white-background-131069041.jpg" alt="Logo" style="width:40px;" class="rounded-pill">
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="Vehicles.jsp">
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
        <form action="VehiclesEdit.jsp?save=save&vehicleno=${param.vehicleno}" method="post" enctype="multipart/form-data">
            <div class="container form-container">
            	<div class="row">
            		<div class="col-md-12 mb-3">
			            <div class="input-group">
			                <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload" name="image">
			            </div>
			        </div>
            	</div>
                <div class="row">
                    <div class="col-md-4 mb-3">
                    	<select class="form-select custom-input" name="selectvehicletype" id="selectvehicletype" >
                    				 <%
                                        List<VehicleTypes> vlist = new VehicleTypesService().getAll();
                                        request.setAttribute("vtypes", vlist);
                                    %>
                                    <option>--Select Vehicle Type--</option>
                                    <c:forEach items="${vtypes}" var="temp">
                                        <option value="${temp.type}">${temp.type}</option>
                                    </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                    	<select class="form-select custom-input" name="selectvehiclemake" id="selectvehiclemake">
                    				 <%
                                        List<VehicleMakes> list = new VehicleMakesService().getAll();
                                        request.setAttribute("vmakes", list);
                                    %>
                                    <option>--Select Vehicle Make--</option>
                                    <c:forEach items="${vmakes}" var="temp">
                                        <option value="${temp.makeNo}">${temp.name}</option>
                                    </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4 mb-3">
                        <select class="form-select custom-input" name="selectvehiclemodel" id="selectvehiclemodel">
                    				 <%
                                        List<VehicleModels> modellist = new VehicleModelService().getAll();
                                        request.setAttribute("vmodel", modellist);
                                    %>
                                    <option>--Select Vehicle Model--</option>
                                    <c:forEach items="${vmodel}" var="temp">
                                        <option value="${temp.modelNo}">${temp.name}</option>
                                    </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="container mt-3">
                <div class="card">
                    <div class="card-header custom-card-header">
                        Registration details
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <select class="form-select custom-input" name="selectowner" id="selectowner">
                    				 <%
                                        List<Owners> ownerslist = new OwnersService().getAll();
                                        request.setAttribute("owners", ownerslist);
                                    %>
                                    <option>--Select Owner--</option>
                                    <c:forEach items="${owners}" var="temp">
                                        <option value="${temp.ownerNo}">${temp.name}</option>
                                    </c:forEach>
                        		</select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <input type="text" class="form-control custom-input" placeholder="Registration Number" aria-label="Registration Number" name="registrationnumber" id="registrationnumber">
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
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-header custom-card-header">
                        Specifications
                    </div>
                    <div class="card-body">
                        <div class="container form-container">
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Chasis Number" aria-label="Chasis Number" name="chasisnumber" id="chasisnumber">
                                </div>
                                <div class="col-md-4 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Year" aria-label="Year" name="year" id="year">
                                </div>
                                <div class="col-md-4 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Color" aria-label="Color" name="color" id="color">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <select class="form-select custom-input" name="selectfuel" id="selectfuel">
                                    <%
                                        List<VehicleFuel> vehiclefuel = new VehicleFuelService().getAll();
                                        request.setAttribute("vehiclefuel", vehiclefuel);
                                    %>
                                    <option>--Select Fuel--</option>
                                    <c:forEach items="${vehiclefuel}" var="temp">
                                        <option value="${temp.fuel}">${temp.fuel}</option>
                                    </c:forEach>
                                </select>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <select class="form-select custom-input" name=selectcapacity id="selectcapacity">
                                    <%
                                        List<VehicleCapacity> vehiclecapacity = new VehicleCapacityService().getAll();
                                        request.setAttribute("vehiclecapacity", vehiclecapacity);
                                    %>
                                    <option>--Select Capacity--</option>
                                    <c:forEach items="${vehiclecapacity}" var="temp">
                                        <option value="${temp.capacity}">${temp.capacity}</option>
                                    </c:forEach>
                                	</select>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Mileage" aria-label="Mileage" name="mileage" id="mileage">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="card mt-3">
                    <div class="card-header custom-card-header">
                        RateDetails
                    </div>
                    <div class="card-body">
                        <div class="container form-container">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Daily Rate" aria-label="Daily Rate" name="dailyrate" id="dailyrate">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Hourly Rate" aria-label="Hourly Rate" name="hourlyrate" id="hourlyrate">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="AdditionalDaily Rate" aria-label="AdditionalDaily Rate" name="additionaldailyrate" id="additionaldailyrate">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="AdditionalHourly Rate" aria-label="AdditionalHourly Rate" name="additionalhourlyrate" id="additionalhourlyrate">
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

        	<%
        		String	btn=request.getParameter("save");
        		System.out.println(btn);
        		if(btn!=null&&btn.equals("save"))
        		{
        			System.out.println("add");
        			MultipartRequest	m=new MultipartRequest(request,"D:\\maven\\javaproject\\src\\main\\vehiceimages");
        			Owners	owner=new OwnersService().find(Integer.parseInt(m.getParameter("selectowner")));
        			VehicleModels	vm=new VehicleModelService().find(Integer.parseInt(m.getParameter("selectvehiclemodel")));
        			States state=new StatesService().find(Integer.parseInt(m.getParameter("selectstate")));
        			File	file=m.getFile("image");
    				FileInputStream	fis=new FileInputStream(file);
    				byte []data=new byte[(int)file.length()];
    				fis.read(data);
        			com.iss.models.Vehicles vehicles = new com.iss.models.Vehicles();
        			vehicles.setState(state);
        			vehicles.setPicture(data);
        			vehicles.setOwner(owner);
        			vehicles.setVehiclemodels(vm);
        		    vehicles.setType(m.getParameter("selectvehicletype"));
        		    vehicles.setYear(Integer.parseInt(m.getParameter("year")));
        		    vehicles.setColor(m.getParameter("color"));
        		    vehicles.setFuel(m.getParameter("selectfuel"));
        		    vehicles.setCapacity(Integer.parseInt(m.getParameter("selectcapacity")));
        		    vehicles.setMileage(Integer.parseInt(m.getParameter("mileage")));
        		    vehicles.setRegistrationNumber(m.getParameter("registrationnumber"));
        		    vehicles.setChaisisNumber(m.getParameter("chasisnumber"));
        		    vehicles.setDailyRate(Integer.parseInt(m.getParameter("dailyrate")));
        		    vehicles.setHourlyRate(Integer.parseInt(m.getParameter("hourlyrate")));
        		    vehicles.setAdditionalHourlyRate(Integer.parseInt(m.getParameter("additionalhourlyrate")));
        		    vehicles.setAdditionalDailyRate(Integer.parseInt(m.getParameter("additionaldailyrate")));
        		    new VehiclesService().add(vehicles);
        		}
        		response.sendRedirect("Vehicles.jsp");
        		
        	%>

    
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
