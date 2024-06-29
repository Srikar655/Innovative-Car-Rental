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
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Innovative Drive Cars</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="/simple-webapp/JSP/UserHomePageJSP/UserHomePageService.jsp">
                        <i class="fas fa-home fa-2x"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="UserHomePageService.jsp?value=reservations">
                        <i class="fas fa-calendar-alt fa-2x"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/simple-webapp/JSP/UserHomePageJSP/CustomerEdit.jsp?customerno=${customerno}">
                        <i class="fas fa-user-edit fa-2x"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/simple-webapp/JSP/UserHomePageJSP/UserHomePage.jsp?loginfailure=">
                        <i class="fas fa-sign-out-alt fa-2x"></i>
                    </a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link active" href="/simple-webapp/JSP/UserHomePageJSP/Admin.jsp">
                       <i class="fas fa-user-circle fa-2x"></i>
                    </a>
                </li>
            </ul>
        </div>
    </nav><br>
    <div class="content">
	        <div class="row">
	        	<div class="col-md-3">
	        			<div class="alert alert-success">
	        				<c:out value="${loginsuccess}"/>
	        			</div>
	       				<div class="card">
	       					<div class="card-header custom-card-header">
	       						Fleet Options For Cars & Coaches
	       					</div>
	       					<div class="card-body scroll-pane">
	       						<%
	       							List<VehicleTypes>	list=new VehicleTypesService().getAll();
	       							request.setAttribute("typeslist",list);
	       						%>
	       						<c:forEach items="${typeslist}" var="temp">
	       							&#8594;<a href="/simple-webapp/JSP/UserHomePageJSP/UserHomePageService.jsp?type=${temp.type}">${temp.type}</a><br>
	       						</c:forEach>
	       					</div>
	       				</div>
	       				<div class="card">
	       					<div class="card-header custom-card-header">
	       						Fleet Options For Cars & Coaches
	       					</div>
	       					<div class="card-body scroll-pane">
	       						<%
	       							List<VehicleMakes>	makeslist=new VehicleMakesService().getAll();
	       							request.setAttribute("makeslist",makeslist);
	       						%>
	       						<c:forEach items="${makeslist}" var="temp">
	       							&#8594;<a href="UserHomePageService.jsp?make=${temp.name}">${temp.name}</a><br>
	       						</c:forEach>
	       					</div>
	       					
	       				</div>
	        	</div>
	        	<div class="col-md-9">
	        		<div class="row">
					<c:choose>
	        				<c:when test="${param.type != null}">
	        						<div class="col-md-6">
			        				<div class="card" style="heigth:500px">
			        						<c:set var="type" value="${param.type}" scope="request"/>
			        						<%
					       							List<Vehicles>	premimumlist=new VehiclesService().find(""+request.getAttribute("type"));
					       							request.setAttribute("vehicleslist",premimumlist);
					       					%>
					       					<c:forEach items="${vehicleslist}" var="guest">
					       						<div class="card-header custom-card-header">
						       						&#8594;${type}
						       					</div>
						       					<div class="card-body scroll-pane">
						       					<c:set var="bytes" value="${guest.picture}" scope="request"/>
						       							<%
						       								request.setAttribute("base64",new String(Base64.getEncoder().encodeToString((byte[])request.getAttribute("bytes"))));
						       							%>
						       							<div style="text-align:center">
						       								<a href="UserHomePageService.jsp?value=${guest.vehicleNo}&btn=details&customerno=${customerno}" ><img src="data:image/jpeg;base64,${base64}" alt="Logo" style="width:150px;height:150px;" class="rounded-pill"><br>${guest.vehiclemodels.name}</a>
						       							</div>
						       					</div>
						       				</c:forEach>
						       		</div>
						       	</div>
	        				</c:when>
	        				<c:when test="${param.make != null}">
	        						<div class="col-md-6">
				        				<div class="card" style="heigth:500px">
				        						<c:set var="make" value="${param.make}" scope="request"/>
				        						<%
						       							List<Vehicles>	premimumlist=new VehiclesService().findByMake(""+request.getAttribute("make"));
						       							request.setAttribute("vehicleslist",premimumlist);
						       					%>
						       					<c:forEach items="${vehicleslist}" var="guest">
						       					
						       						<div class="card-header custom-card-header">
							       						&#8594;Make-${make}
							       					</div>
							       					<div class="card-body scroll-pane">
							       					<c:set var="bytes" value="${guest.picture}" scope="request"/>
							       							<%
							       								request.setAttribute("base64",new String(Base64.getEncoder().encodeToString((byte[])request.getAttribute("bytes"))));
							       							%>
							       							<div style="text-align:center">
							       								<a href="UserHomePage.jsp?value=${guest.vehicleNo}&btn=details" ><img src="data:image/jpeg;base64,${base64}" alt="Logo" style="width:150px;height:150px;" class="rounded-pill"><br>${guest.vehiclemodels.name}</a>
							       							</div>
							       					</div>
							       				</c:forEach>
				       				</div>
						       	</div>
	        				</c:when>
	        				<c:when test="${param.btn eq 'details' }">
	        					<c:set var="type" value="${param.value}" scope="session"/>
	        					<c:set var="customerno" value="${param.customerno}" scope="session"/>
	        					<c:set var="path" value="/simple-webapp/JSP/UserHomePageJSP/UserHomePageService.jsp" scope="session"/>
	        					<%@ include file="/JSP/ShareSourceJSPS/DetailsShow.jsp" %>
	        				</c:when>
	        				<c:when test="${param.btn eq 'buy' }">
	        					<c:set var="value" value="${vehicleno}" scope="session"/>
	        					<c:set var="customerno" value="${customerno}" scope="session"/>
	        					<%
	        						Customers customer=new CustomerService().find(Integer.parseInt(""+session.getAttribute("customerno")));
	        						session.setAttribute("name",customer.getName());
	        					%>
	        					<jsp:include page="/JSP/ShareSourceJSPS/Buy.jsp"/>
	        				</c:when>
	        				<c:when test="${param.value eq 'reservations' }">
								<jsp:include page="Reservations.jsp"/>
							</c:when>
	        				<c:otherwise>
								<c:forEach items="${typeslist}" var="temp" varStatus="status">
			        				<div class="col-md-6">
				        				<div class="card" style="heigth:200px">
				        						<c:set var="type" value="${temp.type}" scope="request"/>
				        						<%
						       							List<Vehicles>	premimumlist=new VehiclesService().find(""+request.getAttribute("type"));
						       							request.setAttribute("vehicleslist",premimumlist);
						       					%>
						       					<c:forEach items="${vehicleslist}" var="guest">
						       						<div class="card-header custom-card-header">
							       						&#8594;${type}
							       					</div>
							       					<div class="card-body scroll-pane">
							       					<c:set var="bytes" value="${guest.picture}" scope="request"/>
							       							<%
							       								request.setAttribute("base64",new String(Base64.getEncoder().encodeToString((byte[])request.getAttribute("bytes"))));
							       							%>
							       							<div style="text-align:center">
							       								<a href="/simple-webapp/JSP/UserHomePageJSP/UserHomePageService.jsp?value=${guest.vehicleNo}&btn=details&customerno=${customerno}" ><img src="data:image/jpeg;base64,${base64}" alt="Logo" style="width:150px;height:150px;" class="rounded-pill"><br>${guest.vehiclemodels.name}</a>
							       							</div>
							       					</div>
							       				</c:forEach>
							       		</div>
							       	</div>
		     					</c:forEach>	        					
	        				</c:otherwise>
	        			</c:choose>

	     			</div>
	        	</div>
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
