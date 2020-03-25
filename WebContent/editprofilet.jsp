
<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<%@ page isELIgnored="false"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="icon" href="${contextPath}/images/favicon.ICO "
	type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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

	<div align="center">
		<u>
			<h2>Edit Details</h2>
		</u>
		<div>
			<div>
				<form:form
					action="${contextPath }/updateusert/${pageContext.request.userPrincipal.name}?${_csrf.parameterName}=${_csrf.token}"
					modelAttribute="user" method="post" enctype="multipart/form-data">
					<table>
						<div align="center">

							<tr>
								<div>
									<td><form:label path="email">Email</form:label></td>
									<td>: <form:input type="email" id="email" path="email"
											required="required" /></td>
									<form:errors path="email" />
								</div>
							</tr>
							<tr>
								<div>
									<td><form:label path="phonenum">Phone Number</form:label></td>
									<td>: <form:input type="text" id="phonenum"
											path="phonenum" required="required" /></td>
									<form:errors path="phonenum" />
								</div>
							</tr>
							<tr>
								<div>
									<td><form:label path="address">Address</form:label></td>
									<td>: <form:input type="text" id="address" path="address"
											required="required" /></td>
									<form:errors path="address" />
								</div>
							</tr>
						</div>
						<tr>
							<div>
								<td><input type="file" name="file" required="required" /></td>
								<div>
						</tr>
					</table>
					<div align="center">
						<button class="button button-3 button-3e icon-arrow-right"
							type="submit" value="Add Property">
							<i class="	fa fa-home"></i>Update Details
						</button>
						<!-- <input type="submit" value="Add Property"> -->


					</div>
			</div>

		</div>

		</form:form>
	</div>
	</div>
	</div>

</body>
</html>