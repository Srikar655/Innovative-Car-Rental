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
</style>
</head>
<body>
    <div class="content">
	        <div class="row">
	        	<div class="col-md-9">
	        		<div class="row">
	        			<%
	        					Vehicles vehicle=new VehiclesService().find(Integer.parseInt(""+session.getAttribute("type")));
	        					if(vehicle!=null)
	        					{
		        					session.setAttribute("base64",new String(Base64.getEncoder().encodeToString(vehicle.getPicture())));
		        					session.setAttribute("vehicle",vehicle);
		        					session.setAttribute("vehicleno",vehicle.getVehicleNo());
		        					session.setAttribute("customerno",session.getAttribute("customerno"));
	        					}
	        			%>
	        			<div class=col-md-12>
	        				<a href="#" ><img src="data:image/jpeg;base64,${base64}" alt="Logo" style="width:250px;height:250px;" class="rounded-pill"></a>
		        			<a href="${path}?btn=buy"style="margin-left: 400px;" ><img src="https://th.bing.com/th/id/R.c61c21523bd9c93da10350bd35b249c6?rik=zKrzAqREtUL%2beA&riu=http%3a%2f%2ficons.iconarchive.com%2ficons%2fcustom-icon-design%2fflatastic-4%2f512%2fBuy-now-icon.png&ehk=bRvDIA5%2fXJC%2fG%2bcxaxkiOkiIWBc5gpeVrPxwECbllng%3d&risl=&pid=ImgRaw&r=0" alt="Logo" style="width:150px;height:150px;" class="rounded-pill"></a>
		        			<br>
	        			</div>
	        			<div class="container mt-3 table-responsive" style="height:300px">
		        			<table class="table table-striped table-bordered table-dark table-responsive" style="height:400px">
				            <thead>
				                <tr>
				                    <th scope="col-12">--Details--</th>
				                    <th></th>
				                </tr>
				            </thead>
				            <tbody>
				                    <tr>
				                        <div>
				                            <td class="col-6">Model:</td>
				                        </div>
				                        <div>
				                            <td class="col-6">
				                                    ${vehicle.vehiclemodels.name}
				                            </td>
				                        </div>
				                    </tr>
				                    <tr>
				                        <div>
				                            <td class="col-6">Make:</td>
				                        </div>
				                        <div>
				                            <td class="col-6">
				                                    ${vehicle.vehiclemodels.vehiclemakes.name}
				                            </td>
				                        </div>
				                    </tr>
				                    <tr>
				                        <div>
				                            <td class="col-6">Color:</td>
				                        </div>
				                        <div>
				                            <td class="col-6">
				                                    ${vehicle.color}
				                            </td>
				                        </div>
				                    </tr>
				                    <tr>
				                        <div>
				                            <td class="col-6">Capacity:</td>
				                        </div>
				                        <div>
				                            <td class="col-6">
				                                    ${vehicle.capacity}
				                            </td>
				                        </div>
				                    </tr>
				                    <tr>
				                        <div>
				                            <td class="col-6">Fuel:</td>
				                        </div>
				                        <div>
				                            <td class="col-6">
				                                    ${vehicle.fuel}
				                            </td>
				                        </div>
				                    </tr>
				                    <tr>
				                        <div>
				                            <td class="col-6">Mileage:</td>
				                        </div>
				                        <div>
				                            <td class="col-6">
				                                    ${vehicle.mileage}
				                            </td>
				                        </div>
				                    </tr>
				                    <tr>
				                        <div>
				                            <td class="col-6">DailyRate:</td>
				                        </div>
				                        <div>
				                            <td class="col-6">
				                                    ${vehicle.dailyRate}
				                            </td>
				                        </div>
				                    </tr>
				                    <tr>
				                        <div>
				                            <td class="col-6">AdditionalDailyRate:</td>
				                        </div>
				                        <div>
				                            <td class="col-6">
				                                    ${vehicle.additionalDailyRate}
				                            </td>
				                        </div>
				                    </tr>
				                    <tr>
				                        <div>
				                            <td class="col-6">HourlyRate:</td>
				                        </div>
				                        <div>
				                            <td class="col-6">
				                                    ${vehicle.hourlyRate}
				                            </td>
				                        </div>
				                    </tr>
				                    <tr>
				                        <div>
				                            <td class="col-6">AdditionalHourlyRate:</td>
				                        </div>
				                        <div>
				                            <td class="col-6">
				                                    ${vehicle.additionalHourlyRate}
				                            </td>
				                        </div>
				                    </tr>
				            </tbody>
				        </table>
			        </div>
	     			</div>
	        	</div>
	        </div>
    </div>

</body>
</html>
