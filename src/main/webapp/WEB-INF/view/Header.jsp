<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deal Your Car</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-sm ">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="Home">
    <img src="resources/Images/Logo.png" alt="logo" style="width:40px;">
  </a>
  
  <!-- Links -->
  <c:if test ="${!sessionScope.loggedIn }">
   <ul class="navbar-nav">
   <li class="nav-item">
      <a class="nav-link" href="Login"> <h3 style="color:grey;">Login</h3></style></a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="Register"> <h3 style="color:grey;">Register</h3></style></a>
    </li>
  </ul></c:if>
  
  <c:if test ="${sessionScope.loggedIn }">
  <c:if test="${sessionScope.role=='ROLE_ADMIN' }">
  
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="Category"> <h3 style="color:grey;">Category</h3></style></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="Product"><h3 style="color:grey;">Product</h3></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="Supplier"><h3 style="color:grey;">Supplier</h3></a>
    </li>
     <li>
     <a class="navbar-nav" href="logout">Logout</a>
     </li>
     
  </ul></c:if>
  <c:if test="${sessionScope.role=='ROLE_USER' }">
  
<ul class="navbar-nav">
  <li class="nav-item">
      <a class="nav-link" href="productPage"><h3 style="color:grey;">ProductPage</h3></a>
    </li>
      <ul class="nav navbar-nav navbar-right">
    <li>
    <a class="navbar-nav" href="Cart">Cart</a>
    </li>
     <li>
     <a class="navbar-nav" href="logout">Logout</a>
     </li>
     </u>
     </ul>
    </c:if>
    </c:if>
</nav>
