<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" href="${contextPath}/images/favicon.ICO "
	type="image/x-icon">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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

	<%-- 	<table class="table table-hover">
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




		<tr>

			<td>${plist.pname}</td>

			<td>${plist.location }</td>
			<td>${plist.city }</td>
			<td><a href="showprofile/${plist.ownername}">${plist.ownername}</a></td>
			<td>${plist.sqyards }</td>
			<td>${plist.price}</td>
			<td>${plist.type }</td>
			<td><c:if test="${empty status }">

					<c:out value="Status Pending"></c:out>


				</c:if> <c:out value="${status}"></c:out></td>
		</tr>
	</table> --%>
	<section>
		<div class="grid-flex">
			<div class="col col-image"
				style="background-image: url('${contextPath}/images/${plist.imagepath}');">
			</div>
			<div class="col col-text">
				<div class="Aligner-item">
					<p style="text-transform: uppercase;">
						Name : ${plist.pname}<br> Location : ${plist.location } <br>
						City : ${plist.city }<br> Area : ${plist.sqyards }sqfts<br>
						Price : <i class="fa fa-inr" aria-hidden="true"></i>${plist.price}/month
						<br> Type : ${plist.type } <br> <cite><c:if
								test="${empty status }">

								<c:out value="Status Pending"></c:out>


							</c:if> <c:out value="${status}"></c:out></cite>
					</p>

				</div>
			</div>
		</div>
	</section>

</body>
</html>