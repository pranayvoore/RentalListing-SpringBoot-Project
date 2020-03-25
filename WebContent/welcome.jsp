<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>

<title>Rental Listing</title>
<link rel="icon" href="${contextPath}/images/favicon.ICO "
	type="image/x-icon">
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
<style type="text/css">
</style>
</head>
<body>
	<div class="opacity"
		style="background-image: url('${contextPath}/images/bg.jpg');">
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a href="${contextPath }/welcome"> <img alt="image"
						src="${contextPath}/images/logo.png" height="80" width="150"></a>
				</div>
				<div class="single-page-nav sticky-wrapper" id="tmNavbar">
					<ul class="nav navbar-nav">
						<li><a href="${contextPath}/welcome">Homepage</a></li>
						<li><a
							href="${contextPath}/userprofilell/${pageContext.request.userPrincipal.name}">My
								Profile</a></li>
						
						<!-- <li><a href="#section2">About Us</a></li>
						<li><a href="#section3">Services</a></li>
						<li><a href="#section4">Contact</a></li>
						<li><a href="#">External</a></li> -->
						<li><c:if
								test="${pageContext.request.userPrincipal.name != null}">
								<form id="logoutForm" method="POST"
									action="${contextPath}/logout">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>

								<a onclick="document.forms['logoutForm'].submit()">Logout</a>
							</c:if></li>
					</ul>
				</div>
			</div>
		</nav>
		<br> <br> <br> <br>

		<div id="section1">
			<header id="header-area" class="intro-section">
				<div class="container">
					<div class="row">
						<div class="col-sm-12 text-center">
							<div class="header-content">
								<%-- <img alt="" src="${contextPath}/images/logo.png" height="100"
									width="300"> --%>
								<h1>Welcome</h1>
								<h4>${pageContext.request.userPrincipal.name}</h4>
								<form
									action="${contextPath}/tenorlan/${pageContext.request.userPrincipal.name}"
									method="get">
									<button class="button button-3 button-3e icon-arrow-right"
										type="submit" value="Landlord" value="Landlord" name="ten">
										<i class="	fa fa-edit"></i>LandLord
									</button>
									<button class="button button-3 button-3e icon-arrow-right"
										type="submit" value="Tenant" name="ten">
										<i class="fa fa-edit"></i>Tenant
									</button>

								</form>
							</div>
						</div>
					</div>
				</div>
			</header>
		</div>

		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	</div>
</body>

</html>
