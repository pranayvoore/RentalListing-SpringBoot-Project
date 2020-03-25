<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Profile</title>
<link rel="icon" href="${contextPath}/images/favicon.ICO "
	type="image/x-icon">
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	max-width: 300px;
	margin: auto;
	text-align: center;
	font-family: arial;
}

.title {
	color: grey;
	font-size: 18px;
}

/* button {
	border: none;
	outline: 0;
	display: inline-block;
	padding: 8px;
	color: white;
	background-color: #000;
	text-align: center;
	cursor: pointer;
	width: 100%;
	font-size: 18px;
} */
a {
	text-decoration: none;
	font-size: 22px;
	color: black;
}

button:hover, a:hover {
	opacity: 0.7;
}
</style>

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
	<h2 style="text-align: center">User Profile</h2>

	<div class="card">
		<img src="${contextPath}/images/${details.imagepath}" alt="Image"
			style="width: 100%">
		<h1>${details.username}</h1>
		<p class="title">${details.email}</p>
		<p>${details.phonenum}</p>
		<p>${details.address }</p>
	</div>
	<center>
		<form method="get"
			action="${contextPath }/editprofilet/${pageContext.request.userPrincipal.name}">
			<button class="button button-3 button-3e icon-arrow-right"
				type="submit" value="Add New Property">
				<i class="fa fa-edit"></i> Edit Profile
			</button>
		</form>
	</center>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
