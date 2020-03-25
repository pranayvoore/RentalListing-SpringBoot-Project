<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LandLord Page</title>
<link rel="icon" href="${contextPath}/images/favicon.ICO "
	type="image/x-icon">
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

</head>

<body style="background-color: #cfd2c7">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<img alt="image" src="${contextPath}/images/logo.png" height="80"
					width="150">
			</div>
			<div class="single-page-nav sticky-wrapper" id="tmNavbar">
				<ul class="nav navbar-nav">
					<li><a href="${contextPath}/welcome"><i class="fa fa-home"></i>
							Home</a></li>
					<li><a
						href="${contextPath}/propByuser/${pageContext.request.userPrincipal.name}">
							<i class='fas fa-building'></i> My Properties
					</a></li>

					<li>
						<div class="navbardd">
							<div class="dropdownd">
								<button class="dropbtnd">
									Welcome ${pageContext.request.userPrincipal.name} <i
										class="fa fa-caret-down"></i>
								</button>
								<div class="dropdownd-contentd">
									<a
										href="${contextPath}/userprofilell/${pageContext.request.userPrincipal.name}"><i
										class="fa fa-address-card"></i>My Profile</a> <a
										onclick="document.forms['logoutForm'].submit()"><c:if
											test="${pageContext.request.userPrincipal.name != null}">
											<form id="logoutForm" method="POST"
												action="${contextPath}/logout">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" />
											</form>
											<i class="fas fas-sign-out"></i> Logout
										</c:if></a>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<br>



	<%-- <div class="container">
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<form id="logoutForm" method="POST" action="${contextPath}/logout">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>

				<h2>
					 | <a
						onclick="document.forms['logoutForm'].submit()">Logout</a>
				</h2>
			</c:if>
		</div>
 --%>
	<br>
	<br>
	<div align="center">
		<form action="${contextPath}/new-prop" method="get">

			<button class="button button-3 button-3e icon-arrow-right"
				type="submit" value="Add New Property">
				<i class="fas fa-building"></i> Add New Property
			</button>
		</form>
	</div>
	&nbsp; &nbsp;
	<%-- <form
		action="${contextPath}/userprofilell/${pageContext.request.userPrincipal.name}"
		method="get">
		<button
			style="background-color: blue;; margin-left: auto; margin-right: auto; display: block; margin-top: 00%; margin-bottom: 0%;"
			type="submit" class="btn btn-primary">My Profile</button>
	</form> --%>
	<c:if test="${empty plist}">

		<tr>
			<td>
				<div align="center">
					<h2>No Properties Added</h2>
					<a href="${contextPath }/new-prop">Add Property Here</a>
				</div>
			<td>
		</tr>
	</c:if>
	<div align="center">
		<h1>
			<u>List of Your Properties</u>
		</h1>
	</div>
	<c:if test="${!empty plist}">
		<!-- <table class="table table-hover">
			<tr>

				<th>Name</th>

				<th>Location</th>
				<th>City</th>
				<th>Owner Name</th>
				<th>Square Yards</th>
				<th>Price</th>
				<th>Type</th>
				<th>Select Option</th>
				<th>Show Requests</th>
			</tr>
 -->
		<c:forEach items="${plist}" var="p">

			<%-- <tr>

					<td>${p.pname}</td>

					<td>${p.location }</td>
					<td>${p.city }</td>
					<td>${p.ownername}</td>
					<td>${p.sqyards }</td>
					<td>${p.price}</td>
					<td>${p.type }</td>
					<td><a href="${contextPath }/${p.id}">Edit</a> &nbsp; /
						&nbsp;&nbsp; <a
						href="${contextPath }/${p.id}/delete/${pageContext.request.userPrincipal.name}">
							Delete </a></td>
					<td><a href="${contextPath }/${p.id}/showrequests">Show
							Requests</a></td>
				</tr>
 --%>

			<div class="col-sm-4">
				&nbsp;
				<div>
					<img src="${contextPath}/images/${p.imagepath}" width="400"
						height="400" />

					<h2 class="feature-content-title blue-text">${p.pname }</h2>
					<p class="feature-content-description">${p.location }<br>
						<br> ${p.city }
					</p>
					<div align="center">
						<a
							href="${contextPath}/propByuser/${pageContext.request.userPrincipal.name}"
							class="feature-content-link blue-btn">See Details</a>
					</div>
				</div>
			</div>
		</c:forEach>

	</c:if>

</body>
</html>