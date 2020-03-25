<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html lang="en">
<head>
<%@ page isELIgnored="false"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Property</title>
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


	<div>
		<div align="center">
			<u>
				<h2>Edit Your Property</h2>
			</u>
		</div>
		<div>
			<div>
				<form:form
					action="${contextPath }/${plist.id}/update/${pageContext.request.userPrincipal.name}?${_csrf.parameterName}=${_csrf.token}"
					modelAttribute="plist" method="post" enctype="multipart/form-data">
					<div align="center">
						<table>
							<tr>
								<div align="center">
									<td><form:label path="pname"> Property Name </form:label>
									</td>
									<td>:&nbsp;&nbsp;&nbsp;<form:input type="text" id="pname"
											path="pname" required="required" /></td>
									<form:errors path="pname" />
								</div>
							</tr>
							<tr>
								<div>
									<td><form:label path="sqyards">Square-fts  </form:label></td>
									<td>:&nbsp;&nbsp;&nbsp;<form:input type="text"
											id="sqyards" path="sqyards" required="required" /></td>
									<form:errors path="sqyards" />
								</div>
							</tr>
							<tr>
								<div>
									<td><form:label path="price">Rental Cost  </form:label></td>
									<td>:&nbsp;&nbsp;&nbsp;<form:input type="text" id="price"
											path="price" required="required" /></td>
									<form:errors path="price" />
								</div>
							</tr>
							<div>
								<tr>
									<td><form:label path="city">City  </form:label></td>
									<td>:&nbsp;&nbsp;&nbsp;<form:input type="text" id="city"
											path="city" required="required" /></td>
									<form:errors path="city" />
								</tr>
							</div>
							<div>
								<tr>
									<td><form:label path="location">Location  </form:label></td>
									<td>:&nbsp;&nbsp;&nbsp;<form:input type="text"
											id="location" path="location" required="required" /></td>
									<form:errors path="location" />
								</tr>
							</div>
							<div>
								<tr>
									<td><form:label path="type">Type  </form:label></td>
									<td>:&nbsp;&nbsp;&nbsp;<form:radiobutton path="type"
											value="1bhk" /> 1BHK <form:radiobutton path="type"
											value="2bhk" /> 2BHK <form:radiobutton path="type"
											value="3bhk" /> 3BHK
									</td>
									<form:errors path="type" />
								</tr>
							</div>
							<div>
								<tr>
									<td><form:label path="ownername">Landlord Name  </form:label>
									</td>
									<td>:&nbsp;&nbsp;&nbsp;<form:input type="ownername"
											id="ownername" path="ownername"
											value="${pageContext.request.userPrincipal.name}"
											readonly="true" /></td>
									<form:errors path="ownername" />
								</tr>
							</div>
							</div>

							<div align="center">
								<tr>
									<td><input type="file" name="file" required="required" /></td>

								</tr>
							</div>
						</table>
						<br> <br>
						<div align="center">
							<button class="button button-3 button-3e icon-arrow-right"
								type="submit" value="Add Property">
								<i class="	fa fa-home"></i>Update Property
							</button>
							<!-- <input type="submit" value="Add Property"> -->


						</div>
				</form:form>
				</table>
			</div>
		</div>
	</div>
	<%-- <form action="${contextPath}/upl?${_csrf.parameterName}=${_csrf.token}"
		method="post" enctype="multipart/form-data">
		<input type="file" name="file" /><br /> <br /> <input type="submit"
			value="Submit" />
	</form> --%>
</body>
</html>