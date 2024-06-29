<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.iss.services.*,java.util.*,com.iss.models.*,java.text.*,java.sql.Date" %>
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
        .custom-input {
	  border: 2px solid #f06292;
	  border-radius: 20px;
	  padding: 10px;
	  width: 100%;
	  max-width: 100%;
	  margin-bottom: 10px;
	}
	.custom-card-header {
	    background-color: #f06292;
	    color: white;
	    font-weight: bold;
	    text-align: center;
	}
	.card-body {
	    padding: 1rem;
	}
	.row > .col-md-6,
	.row > .col-md-4,
	.row > .col-md-8 {
	    margin-bottom: 1rem;
	}
</style>
</head>
<body>
	
    <div class="content">
    	<form action="/simple-webapp/JSP/UserHomePageJSP/Payments.jsp" method="post">
	        <div class="row">
	        	<div class="col-md-9">
	        		<div class="row">
	        			<%
	        					if(session.getAttribute("value")!=null)
	        					{
		        					Vehicles vehicle = new VehiclesService().find(Integer.parseInt(""+session.getAttribute("value")));
		        					if(vehicle != null) {
			        					session.setAttribute("base64", new String(Base64.getEncoder().encodeToString(vehicle.getPicture())));
			        					session.setAttribute("vehicle", vehicle);
			        					session.setAttribute("vehicleno",vehicle.getVehicleNo());
		        					}
		        					Customers customer=new CustomerService().find(Integer.parseInt(""+session.getAttribute("customerno")));
		        					session.setAttribute("customer",customer);
	        					}
	        					else
	        					{
	        						for(int i=0;i<10;i++)
	        							System.out.println(session.getAttribute("value"));
	        					}
	        			%>
	        				<div class="col-md-12">
		        				<a href="#" ><img src="data:image/jpeg;base64,${base64}" alt="Logo" style="width:150px;height:150px;" class="rounded-pill"></a>
			        			<br>
	        				</div>
	        				<div class="row">
						        <div class="customer-signup">
						            --Rental Details--
						        </div>
						    </div>
						    <div class="row">
			                    <div class="col-md-6 mb-3">
			                        <input type="text" class="form-control custom-input" placeholder="Customer Name" aria-label="Customer Name" name="customername" id="customername" value="${name}">
			                    </div>
			                    <div class="col-md-6 mb-3">
			                        <input type="text" class="form-control custom-input" placeholder="Vehicle" aria-label="Vehicle" name="vehicle" id="vehicle" value="${vehicle.registrationNumber}">
			                    </div>
			                </div>
			                <div class="row">
			                	<div class="card mt-3">
			                		<div class="card-header custom-card-header">
				                        Reservation details
				                    </div>
				                    <div class="card-body">
				                 		<div class="row">
			                                <div class="col-md-6 mb-3">
			                                	<label class="block text-zinc-700">Start Date:</label>
			                                    <input type="date" class="form-control custom-input" placeholder="Start Date" aria-label="Start Date" name="startdate" id="startdate" onChange="calculateDaysAndRate()">
			                                </div>
			                                <div class="col-md-6 mb-3">
			                                	<label class="block text-zinc-700">End Date:</label>
			                                    <input type="date" class="form-control custom-input" placeholder="End Date" aria-label="End Date" name="enddate" id="enddate" onChange="calculateDaysAndRate()">
			                                </div>
			                            </div>
			                            <div class="row">
			                                <div class="col-md-4 mb-3">
			                                	<label class="block text-zinc-700">Rate:</label>
			                                    <input type="text" class="form-control custom-input" placeholder="Rate" aria-label="Rate" name="rate" id="rate" value="${vehicle.dailyRate}" readonly>
			                                </div>
			                                <div class="col-md-4 mb-3">
			                                	<label class="block text-zinc-700">Days:</label>
			                                  	<input type="text" class="form-control custom-input" placeholder="Days" aria-label="Days" name="days" id="days" readonly>
			                                </div>
			                                <div class="col-md-4 mb-3">
			                                	<label class="block text-zinc-700">Total:</label>
			                                    <input type="text" class="form-control custom-input" placeholder="Total" aria-label="Total" name="total" id="total" readonly>
			                                </div>
			                            </div>
			                            <div class="row">
				                            <div class="card mt-3">
				                            	<div class="card-header custom-card-header">
							                        Location details
							                    </div>
							                    <div class="card-body">
						                            	<div class="row">
						                            		<div class="col-md-8 mb-3">
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
						                            	</div>
						                            </div>
						                         </div>
						                    </div>
				                            <div class="row">
					                            <div class="card mt-3">
					                            	<div class="card-header custom-card-header">
								                        From
								                    </div>
								                    <div class="card-body">
							                            	<div class="row">
							                            		<div class="col-md-8 mb-3">
							                            			<select class="form-select custom-input" name="selectstatefrom" id="selectstatefrom">
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
							                            		<div class="col-md-8 mb-3">
							                            			<select class="form-select custom-input" name="selectcityfrom" id="selectcityfrom">
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
							                            	</div>
							                            </div>
							                         </div>
						                    </div>
						                    <div class="row">
					                            <div class="card mt-3">
					                            	<div class="card-header custom-card-header">
								                        To
								                    </div>
								                    <div class="card-body">
							                            	<div class="row">
							                            		<div class="col-md-8 mb-3">
							                            			<select class="form-select custom-input" name="selectstateto" id="selectstateto">
									                                    <option>--Select State--</option>
									                                    <c:forEach items="${states}" var="temp">
									                                        <option value="${temp.stateNo}">${temp.stateName}</option>
									                                    </c:forEach>
									                                </select>
							                            		</div>
							                            	</div>
							                            	<div class="row">
							                            		<div class="col-md-8 mb-3">
							                            			<select class="form-select custom-input" name="selectcityto" id="selectcityto">
									                                    <option>--Select City--</option>
									                                    <c:forEach items="${cities}" var="temp">
									                                        <option value="${temp.cityNo}">${temp.cityName}</option>
									                                    </c:forEach>
									                                </select>
							                            		</div>
							                            	</div>
							                            </div>
							                         </div>
						                    </div>
						                    <div class="row">
					                            <div class="card mt-3">
					                            	<div class="card-header custom-card-header">
								                       Travel Purpose
								                    </div>
								                    <div class="card-body">
							                            <textarea class="form-control" name="travelpurpose" rows="3"></textarea>
							                          </div>
							                       </div>
						                    </div>
						                    
											<input class="custom-btn" type="submit" name="btn" value="Google Checkout">								             
				                    </div>
			                	</div>
			                </div>
	     			</div>
	        	</div>
	        </div>
        </form>
        <script src="Calculate.js"></script>
    </div>
</body>
</html>
