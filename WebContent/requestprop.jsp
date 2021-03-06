<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Requested Properties</title>
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
<link rel="stylesheet"
	href="${contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
					<li><a href="${contextPath}/welcome">Home</a></li>
					<li><a
						href="${contextPath}/requestedprop/${pageContext.request.userPrincipal.name}">Requested
							Properties</a></li>
					<li>
						<div class="navbardd">
							<div class="dropdownd">
								<button class="dropbtnd">
									Welcome ${pageContext.request.userPrincipal.name} <i
										class="fa fa-caret-down"></i>
								</button>
								<div class="dropdownd-contentd">
									<a
										href="${contextPath}/userprofilett/${pageContext.request.userPrincipal.name}"><i
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
	<c:if test="${empty plist}">

		<tr>
			<td>
				<div align="center">
					<h2>Oh No! You Don't have Property to rent in this place</h2>
					<%-- <a href="${contextPath }/tenant.jsp">Try Searching another area</a> --%>
				</div>
			<td>
		</tr>
	</c:if>
	<c:set var="name" scope="application"
		value="${pageContext.request.userPrincipal.name}" />
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
				<th>Status</th>
			</tr>
 -->


		<c:forEach items="${plist}" var="p">
			<%-- <tr>
					<td>${p.pname}</td>

					<td>${p.location }</td>
					<td>${p.city }</td>
					<td><a href="${contextPath }/showprofile/${p.ownername}">${p.ownername}</a></td>
					<td>${p.sqyards }</td>
					<td>${p.price}</td>
					<td>${p.type }</td>
					<td><a
						href="showstatus/${pageContext.request.userPrincipal.name}/${ p.id}">Show
							Status</a></td>
					<a href="request/${pageContext.request.userPrincipal.name}">Request</a>
 --%>
			<div class="col-sm-4">
				&nbsp;
				<div class="feature-content">
					<center>
						<img src="${contextPath}/images/${p.imagepath}" width="400"
							height="400" alt="Image">
					</center>
					<h2 class="feature-content-title blue-text">${p.pname }</h2>
					<p class="feature-content-description">${p.location }
						<br> ${p.city }<br> <a
							href="${contextPath }/showprofile/${p.ownername}">${p.ownername}
					</p>
					<%-- <div align="center">
						<a
							href="showstatus/${pageContext.request.userPrincipal.name}/${ p.id}"
							class="feature-content-link blue-btn">Show Status</a>
					</div> --%>
				</div>
			</div>
		</c:forEach>

	</c:if>

</body>
</html>