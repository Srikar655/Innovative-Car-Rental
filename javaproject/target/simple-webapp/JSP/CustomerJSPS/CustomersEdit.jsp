
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
	<%
		System.out.println("find");
		System.out.println(request.getParameter("customerno"));
		if(request.getParameter("customerno")!=null)
		{
			System.out.println("finding");
			Customers	customer=new CustomerService().find(Integer.parseInt(request.getParameter("customerno")));
			request.setAttribute("customer",customer);
		}
	%>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">CustomerDetails</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="/simple-webapp/JSP/MenuPage.jsp">
                        <img src="https://thumbs.dreamstime.com/b/home-button-simple-vector-illustration-blue-round-white-background-131069041.jpg" alt="Logo" style="width:40px;" class="rounded-pill">
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="Customers.jsp">
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
        <form action="CustomersEdit.jsp?customerno=${param.customerno }" method="post">
            <div class="container form-container">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <input type="text" class="form-control custom-input" placeholder="Customer Name" aria-label="Customer Name" name="customername" id="customername" value="${customer.name}">
                    </div>
                     <div class="col-md-6 mb-3">
                        <input type="text" class="form-control custom-input" placeholder="Email Address" aria-label="Email Address" name="emailaddress" id="emailaddress" value="${customer.emailAddress}">
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
                                <input type="text" class="form-control custom-input" placeholder="Address" aria-label="Address" name="address1" id="address" value="${customer.addressLine1}">
                            </div>
                            <div class="col-md-12 mb-3">
                                <input type="text" class="form-control custom-input" placeholder="Address" aria-label="Address" name="address2" id="address" value="${owner.addressLine2}">
                            </div>
                            <div class="col-md-6 mb-3">
                                <select class="form-select custom-input" name="selectcountry" id="selectcountry">
                                    <%
                                        List<Countries> countrieslist = new CountriesService().getAll();
                                        request.setAttribute("countries", countrieslist);
                                    %>
                                    <option value="${customer.country.countryNo }">${customer.country.country }</option>
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
                                    <option value="${customer.state.stateNo}">${customer.state.stateName}</option>
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
                                    <option value="${customer.city.cityNo}">${customer.city.cityName}</option>
                                    <c:forEach items="${cities}" var="temp">
                                        <option value="${temp.cityNo}">${temp.cityName}</option>
                                    </c:forEach>
                                </select>
                               </div>
                              <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Pincode" aria-label="Pincode" name="Pincode" id="Pincode" value="${customer.pincode}">
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
                                    <input type="text" class="form-control custom-input" placeholder="Phone Number" aria-label="Phone Number" name="phonenumber" id="phonenumber" value="${customer.phoneNumber}">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <input type="text" class="form-control custom-input" placeholder="Mobile Number" aria-label="Mobile Number" name="mobilenumber" id="mobilenumber" value="${customer.mobileNumber}">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-center mt-4">
                <button class="custom-btn" type="submit" name="btn" value="save">Save</button>
                <button class="custom-btn" type="submit" name="btn" value="clear">Clear</button>
            </div>
        </form>
    </div>
    
    <c:choose>
        <c:when test="${param.btn == 'save'}">

                 <jsp:useBean id="customers" class="com.iss.models.Customers" scope="request">
                <jsp:setProperty name="customers" property="name" value="${param.customername}" />
                <jsp:setProperty name="customers" property="customerNo" value="${param.customerno}" />
                <jsp:setProperty name="customers" property="emailAddress" value="${param.emailaddress}" />
                <jsp:setProperty name="customers" property="addressLine1" value="${param.address1}" />
                <jsp:setProperty name="customers" property="addressLine2" value="${param.address2}" />
                <jsp:setProperty name="customers" property="pincode" value="${param.Pincode}" />
                <jsp:setProperty name="customers" property="phoneNumber" value="${param.phonenumber}" />
                <jsp:setProperty name="customers" property="mobileNumber" value="${param.mobilenumber}" />
                <jsp:setProperty name="customers" property="username" value="${param.username}" />
                <jsp:setProperty name="customers" property="password" value="${param.pass}" />
            	</jsp:useBean>
                <% 
                    try {
                    	for(int i=0;i<10;i++)
                    	{
                    		System.out.println(customers.getName());
                    	}
                    	Cities	city=new CitiesService().find(Integer.parseInt(request.getParameter("selectcity")));
                    	States state=new StatesService().find(Integer.parseInt(request.getParameter("selectstate")));
                    	Countries country=new CountriesService().find(Integer.parseInt(request.getParameter("selectcountry")));
                    	customers.setCity(city);
                    	customers.setCountry(country);
                    	customers.setState(state);
                        new CustomerService().edit(customers);
                    } catch(Exception ex) {
                        ex.printStackTrace();        
                    }
                %>
        </c:when>
        <c:when test="${param.btn=='clear'}">
        	<%
        		try{
        				response.sendRedirect("CustomersEdit.jsp");
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

</head>
<body>

</body>
</html>