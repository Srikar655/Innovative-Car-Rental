<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  </style>
</head>
<body>
  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">CitiesDetails</a>
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/simple-webapp/JSP/MenuPage.jsp"><img src="https://thumbs.dreamstime.com/b/home-button-simple-vector-illustration-blue-round-white-background-131069041.jpg" alt="Logo" style="width:40px;" class="rounded-pill"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="Cities.jsp"><img src="https://th.bing.com/th/id/OIP.D5Npngc53EqWc9tZ6VFytAHaHa?rs=1&pid=ImgDetMain" alt="Logo" style="width:40px;" class="rounded-pill"></a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#"><img src="https://th.bing.com/th/id/OIP.xw9yUAyagcIGoD2GbqheqgHaHY?rs=1&pid=ImgDetMain" alt="Logo" style="width:40px;" class="rounded-pill"></a>
        </li>
      </ul>
    </div>
  </nav>
  <div class="content">
    <form action="CitiesAdd.jsp" method="post">
      <div class="container form-container">
        <div class="row">
          <div class="col-md-6 offset-md-3">
            <div class="custom-input-group">
              <select class="form-select custom-input" name="select" id="select">
                <%
                  List<States> list = new StatesService().getAll();
                  request.setAttribute("States", list);
                %>
                <option>--Select City--</option>
                <c:forEach items="${States}" var="temp">
                  <option value="${temp.stateNo}">${temp.stateName}</option>
                </c:forEach>
              </select>
              <input type="text" class="form-control custom-input" placeholder="Enter City" aria-label="Enter City" name="t1" id="t1">
              <button class="custom-btn" type="submit" name="btn" value="add">Add</button>
            </div>
          </div>
        </div>
      </div>
    </form>
    <c:choose>
      <c:when test="${param.btn == 'add'}">
        <c:if test="${param.t1 != 'null'}">
         <jsp:useBean id="cities" class="com.iss.models.Cities" scope="request">
                <jsp:setProperty name="cities" property="cityName" value="${param.t1}" />
            </jsp:useBean>
                <% 
                    try {
                    	States state=new StatesService().find(Integer.parseInt(request.getParameter("select")));
                    	cities.setState(state);
                        new CitiesService().add(cities);
                        response.sendRedirect("CitiesAdd.jsp");
                    } catch(Exception ex) {
                        ex.printStackTrace();        
                    }
                %>
        </c:if>
      </c:when>
    </c:choose>
  </div>
  <footer class="footer">
    <div class="container">
      <p>&copy; 2024 InnovativeSoftwareSolutions. All rights reserved.</p>
      <p>Contact us at: <a href="mailto:info@InnovativeSoftwareSolutions.com">info@InnovativeSoftwareSolutions.com</a></p>
      <div class="footer-icons">
        <a href="https://www.facebook.com/InnovativeSoftwareSolutions.org/" target="_blank"><img src="https://png.pngtree.com/png-clipart/20190515/original/pngtree-facebook-social-media-icon-png-image_3572498.jpg" alt="Logo" style="width:40px;" class="rounded-pill"><i class="bi bi-facebook"></i></a>
        <a href="https://www.instagram.com/srikar_655/?igsh=MWpoZzljZGZyZmxpaw%3D%3D" target="_blank"><img src="https://th.bing.com/th/id/OIP.1ZFzMQYnNghA_MZUU-hqIgHaF5?rs=1&pid=ImgDetMain" alt="Logo" style="width:40px;" class="rounded-pill"><i class="bi bi-twitter"></i></a>
        <a href="https://x.com/i/flow/login?redirect_after_login=%2FInnovativeSoft3" target="_blank"><img src="https://e7.pngegg.com/pngimages/930/355/png-clipart-angle-symbol-brand-logo-utilities-x11-angle-logo.png" alt="Logo" style="width:40px;" class="rounded-pill"><i class="bi bi-instagram"></i></a>
      </div>
    </div>
  </footer>
</body>
</html>
