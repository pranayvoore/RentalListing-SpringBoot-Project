<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tenant Home</title>
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
<script src="https://maps.googleapis.com/maps/api/js"></script>
<style>
/* Set the size of the div element that contains the map */
#map {
	height: 400px; /* The height is 400 pixels */
	width: 100%; /* The width is the width of the web page */
}
</style>

<style type="text/css">
input[type=text] {
	width: 304px;
	height: 65px;
	box-sizing: border-box;
	border: 3px solid #2F3237;
	border-radius: 4px;
	font-size: 16px;
	background-color: white;
	background-position: 10px 10px;
	background-repeat: no-repeat;
	padding: 12px 20px 12px 40px;
	-webkit-transition: width 0.4s ease-in-out;
	transition: width 0.4s ease-in-out;
	box-sizing: border-box;
}

/* When the input field gets focus, change its width to 100% */
input[type=text]:focus {
	width: 30%;
}
</style>
</head>
<body onload=loadMap() style="background-color: #cfd2c7">
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
					<%-- <li><a
						href="${contextPath}/userprofilett/${pageContext.request.userPrincipal.name}">Welcome
							${pageContext.request.userPrincipal.name}</a></li>
					<li><c:if
							test="${pageContext.request.userPrincipal.name != null}">
							<form id="logoutForm" method="POST"
								action="${contextPath}/logout">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</form>

							<a onclick="document.forms['logoutForm'].submit()">Logout</a>
						</c:if></li>
					<li> --%>
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
	<%-- <form
		action="${contextPath}/userprofilett/${pageContext.request.userPrincipal.name}"
		method="get">
		<button type="submit">My Profile</button>
	</form>
	<form
		action="${contextPath}/requestedprop/${pageContext.request.userPrincipal.name}"
		method="get">
		<button type="submit">Requested Properties</button>
	</form> --%>
	<br>
	<div align="center">
		<form
			action="${contextPath}/searchbycity/${pageContext.request.userPrincipal.name}"
			method="get">
			<input type="text" name="city" placeholder="Enter City"> <input
				type="text" name="place" placeholder="Enter Place">
			<button class="button button-3 button-3e icon-arrow-right"
				type="submit" value="Search Property">
				<i class="	fa fa-search"></i>Search Property
			</button>
		</form>
	</div>
	<div id="map"></div>
	<script>
		// Initialize and add the map
		function initMap() {
			// The location of Uluru
			var uluru = {
				lat : 17.387140,
				lng : 78.491684
			};
			// The map, centered at Uluru
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 10,
				center : uluru
			});
			// The marker, positioned at Uluru
			var marker = new google.maps.Marker({
				position : uluru,
				map : map
			});
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCGEnqKjmd2gs-rwXtaXmOmu8jKQ6P8lEk&callback=initMap">
		
	</script>
	<c:if test="${empty plist}">

		<tr>
			<td>
				<div align="center">
					<h2>Oh No! You Don't have Property to rent in this place</h2>
					<a
						href="${contextPath }/searchbycity/${pageContext.request.userPrincipal.name}/?city=&place=">Try
						Searching another area</a>
				</div>
			<td>
		</tr>
	</c:if>
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
			</tr>
 -->

		<c:forEach items="${plist}" var="p">

			<%-- <tr>

					<td><a href="${contextPath }/${p.id}/getProp"> ${p.pname}</a></td>

					<td>${p.location }</td>
					<td>${p.city }</td>
					<td>${p.ownername}</td>
					<td>${p.sqyards }</td>
					<td>${p.price}</td>
					<td>${p.type }</td>
				</tr>
 --%>
			<div class="col-sm-4">
				&nbsp;
				<div class="feature-content">
					<center>
						<img src="${contextPath}/images/${p.imagepath}" width="400"
							height="400" alt="Image">
					</center>
					<h2 class="feature-content-title blue-text">${p.pname }</h2>
					<p class="feature-content-description">${p.location }<br>
						<br> ${p.city }
					</p>
					<div align="center">
						<a href="${contextPath }/${p.id}/getProp"
							class="feature-content-link blue-btn">See Details</a>
					</div>
				</div>
			</div>

		</c:forEach>
		<!-- </table> -->
	</c:if>

</body>
</html>