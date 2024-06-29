<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home Page</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Include Bootstrap Icons library -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      padding-top: 60px; /* Offset for fixed navbar */
    }
    .navbar-brand {
      font-size: 1.5rem;
      font-weight: bold;
      color: #f06292;
    }
    .navbar-brand:hover {
      color: #ef9a9a;
    }
    .main-content {
      padding: 20px;
    }
    .card {
      background-color: #fff;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 15px;
      margin-bottom: 10px; /* Reduced margin between cards */
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    .card a {
      color: #007bff;
      text-decoration: none;
      display: flex;
      align-items: center;
    }
    .card a:hover {
      text-decoration: underline;
    }
    .card a .link-text {
      margin-left: 5px;
    }
    .section-title {
      font-size: 1.2rem;
      font-weight: bold;
      color: #333;
      margin-bottom: 10px;
    }
    .row:not(:last-child) {
      margin-bottom: 15px; /* Reduced margin between rows */
    }
    .row-same-height {
      display: flex;
      align-items: stretch;
    }
    .col-same-height {
      display: flex;
      flex-direction: column;
    }
    .col-same-height > .card {
      flex: 1;
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
  <nav class="navbar navbar-expand-sm navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
    <a href="MenuPage.jsp"><img src="https://i.pinimg.com/originals/05/b8/79/05b87923139744ae9e999f1bd28e988d.png" alt="Logo" style="width:40px;" class="rounded-pill"></a>
      <a class="navbar-brand" href="MenuPage.jsp">Home Page</a>
      <form class="d-flex ms-auto">
        <input class="form-control me-2" type="text" placeholder="Search">
        <button class="btn btn-primary" type="button">Search</button>
      </form>
    </div>
  </nav>

  <div class="container main-content">
    <div class="row row-same-height">
      <div class="col-md-6 col-same-height">
        <div class="card">
          <div class="section-title">Vehicle Management <i class="bi bi-gear"></i></div>
          <a href="VehicleMakeJSPS/VehicleMakes.jsp"><i class="bi bi-list"></i><span class="link-text">Vehicle Make Details</span></a><br>
          <a href="VehicleMakeJSPS/VehicleMakesAdd.jsp"><i class="bi bi-plus"></i><span class="link-text">Add</span></a><br>
          <a href="VehicleModelJSPS/VehicleModel.jsp"><i class="bi bi-list"></i><span class="link-text">Vehicle Model Details</span></a><br>
          <a href="VehicleModelJSPS/VehicleModelAdd.jsp"><i class="bi bi-plus"></i><span class="link-text">Add</span></a><br>
          <a href="VehilceJSPS/Vehicles.jsp"><i class="bi bi-list"></i><span class="link-text">Vehicle Details</span></a><br>
          <a href="VehilceJSPS/VehiclesAdd.jsp"><i class="bi bi-plus"></i><span class="link-text">Add</span></a>
        </div>
      </div>
      <div class="col-md-6 col-same-height">
        <div class="card">
          <div class="section-title">Driver Management <i class="bi bi-person"></i></div>
          <a href="DriverJSPS/DriverDetails.jsp"><i class="bi bi-list"></i><span class="link-text">Driver Details</span></a><br>
          <a href="DriverJSPS/DriverDetailsAdd.jsp"><i class="bi bi-plus"></i><span class="link-text">Add</span></a>
        </div>
      </div>
    </div>

    <div class="row row-same-height">
      <div class="col-md-6 col-same-height">
        <div class="card">
          <div class="section-title">Location Management <i class="bi bi-geo-alt"></i></div>
          <a href="CountriesJSPS/Countries.jsp"><i class="bi bi-list"></i><span class="link-text">Country Details</span></a><br>
          <a href="CountriesJSPS/CountriesAdd.jsp"><i class="bi bi-plus"></i><span class="link-text">Add</span></a><br>
          <a href="StatesJSPS/States.jsp"><i class="bi bi-list"></i><span class="link-text">State Details</span></a><br>
          <a href="StatesJSPS/StatesAdd.jsp"><i class="bi bi-plus"></i><span class="link-text">Add</span></a><br>
          <a href="CitiesJSPS/Cities.jsp"><i class="bi bi-list"></i><span class="link-text">City Details</span></a><br>
          <a href="CitiesJSPS/CitiesAdd.jsp"><i class="bi bi-plus"></i><span class="link-text">Add</span></a>
        </div>
      </div>
      <div class="col-md-6 col-same-height">
        <div class="card">
          <div class="section-title">Reservation Management <i class="bi bi-calendar"></i></div>
          <a href="ReservationsJSP/ReservationDetails.jsp"><i class="bi bi-list"></i><span class="link-text">Reservation Details</span></a><br>
          <a href="ReservationsJSP/TodaysReservations.jsp"><i class="bi bi-list"></i><span class="link-text">View Reservations For Today</span></a><br>
          <a href="ReservationsJSP/NextTwoDaystReservations.jsp"><i class="bi bi-list"></i><span class="link-text">View Reservations For Tomorrow</span></a><br>
          <a href="ReservationsJSP/Next7DaysReservations.jsp"><i class="bi bi-list"></i><span class="link-text">View Reservations For Next 7 Days</span></a><br>
          <a href="ReservationsJSP/ThisMonth.jsp"><i class="bi bi-list"></i><span class="link-text">View Reservations For This Month</span></a><br>
          <a href="ReservationsJSP/NextMonth.jsp"><i class="bi bi-list"></i><span class="link-text">View Reservations For Next Month</span></a>
        </div>
      </div>
    </div>

    <div class="row row-same-height">
      <div class="col-md-6 col-same-height">
        <div class="card">
          <div class="section-title">User Management <i class="bi bi-people"></i></div>
          <a href="EmployeesJSPS/Employees.jsp"><i class="bi bi-list"></i><span class="link-text">Employee Details</span></a><br>
          <a href="EmployeesJSPS/EmployeesAdd.jsp"><i class="bi bi-plus"></i><span class="link-text">Add</span></a><br>
          <a href="CustomerJSPS/Customers.jsp"><i class="bi bi-list"></i><span class="link-text">Customer Details</span></a><br>
          <a href="CustomerJSPS/CustomersAdd.jsp"><i class="bi bi-plus"></i><span class="link-text">Add</span></a>
        </div>
      </div>
      <div class="col-md-6 col-same-height">
        <div class="card">
          <div class="section-title">Owner Management <i class="bi bi-person"></i></div>
          <a href="OwnersJSPS/Owners.jsp"><i class="bi bi-list"></i><span class="link-text">Owner Details</span></a><br>
          <a href="OwnersJSPS/OwnersAdd.jsp"><i class="bi bi-plus"></i><span class="link-text">Add</span></a>
        </div>
      </div>
    </div>

  </div>
<footer class="footer">
    <div class="container">
        <p>&copy; 2024 Your Company. All rights reserved.</p>
        <p>Contact us at: <a href="mailto:info@yourcompany.com">info@InnovativeSoftwareSolutions.com</a></p>
        <div class="footer-icons">
            <a href="https://www.facebook.com/InnovativeSoftwareSolutions.org/" target="_blank"><img src="https://png.pngtree.com/png-clipart/20190515/original/pngtree-facebook-social-media-icon-png-image_3572498.jpg" alt="Logo" style="width:40px;" class="rounded-pill"></a>
            <a href="https://www.instagram.com/srikar_655/?igsh=MWpoZzljZGZyZmxpaw%3D%3D" target="_blank"><img src="https://th.bing.com/th/id/OIP.1ZFzMQYnNghA_MZUU-hqIgHaF5?rs=1&pid=ImgDetMain" alt="Logo" style="width:40px;" class="rounded-pill"></a>
            <a href="https://x.com/i/flow/login?redirect_after_login=%2FInnovativeSoft3" target="_blank"><img src="https://e7.pngegg.com/pngimages/930/355/png-clipart-angle-symbol-brand-logo-utilities-x11-angle-logo.png" alt="Logo" style="width:40px;" class="rounded-pill"></a>
        </div>
    </div>
</footer>
</body>
</html>
