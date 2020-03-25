<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kirai Pe Ghar</title>
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

	<%-- <form action="${contextPath }/empByNameOrId">
		Enter Id : <input type="text" id="id" name="id" /> Enter Name : <input
			type="text" id="name" name="name" /> <label>Select City:</label> <select
			name="list">
			<option>Select City</option>
			<c:forEach items="${citylist}" var="category">

				<option>${category}</option>
			</c:forEach>
		</select> <input type="submit" value="Submit" />

	</form>
 --%>
	&nbsp;&nbsp;&nbsp;&nbsp;
	<%-- <form action="${contextPath }/empByName">
		Enter Name : <input type="text" id="name" name="name" /> <input
			type="submit" value="Submit" />
	</form> --%>
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Agreement</h4>
				</div>
				<div class="modal-body">
					<h2>Land Lord Information</h2>
					<p>
						I
						<%-- <a href="showprofile/${plist.ownername}"> --%>${plist.ownername}<!-- </a> -->
						agree to rent to the tenant the rental unit.
					<form action="showprofile/${plist.ownername}" method="get">
						<button type="submit" class="btn btn-warning">Visit
							Landlord</button>
					</form>
					</p>
					<h2>Rent Amount</h2>
					<p>
						The rent to be paid by the tenant to the landlord throughout the
						term of this agreement is Rs<u> ${plist.price}</u> per month.
					</p>
					<h2>Security Deposit</h2>
					<p>Rs.1000</p>
					<p>This security deposit may be used for the purpose of
						repairing damage for which the tenant is responsible.</p>
					<p>
					<p>Location of premises is Hyderabad,Telanagana,</p>
				</div>
				<div class="modal-footer">
					<form action="request/${pageContext.request.userPrincipal.name}"
						method="get">
						<button type="submit" class="btn btn-primary">Agree</button>
						&nbsp;
					</form>
					<button type="button" class="btn btn-default" data-dismiss="modal">DisAgree</button>
				</div>
			</div>

		</div>
	</div>
	<%-- <c:if test="${empty plist}">

		<tr>
			<td>
				<div align="center">
					<h2>Oh No! You Don't have Property to rent in this place</h2>
					<a href="${contextPath }/tenant.jsp">Try Searching another area</a>
				</div>
			<td>
		</tr>
	</c:if>
	<c:if test="${!empty plist}">
		<table class="table table-hover">
			<tr>

				<th>Name</th>

				<th>Location</th>
				<th>City</th>
				<th>Owner Name</th>
				<th>Square Yards</th>
				<th>Price</th>
				<th>Type</th>
				<th>Send Request</th>
			</tr>




			<tr>

				<td>${plist.pname}</td>

				<td>${plist.location }</td>
				<td>${plist.city }</td>
				<td><a href="showprofile/${plist.ownername}">${plist.ownername}</a></td>
				<td>${plist.sqyards }</td>
				<td>${plist.price}</td>
				<td>${plist.type }</td>
				<td><button type="button" class="btn btn-info btn-lg"
						data-toggle="modal" data-target="#myModal">Request</button></td>
				<a href="request/${pageContext.request.userPrincipal.name}">Request</a>
			</tr>

		</table>
	</c:if>
 --%>
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
						<br> Type : ${plist.type } <br> <cite><button
								type="button" class="btn btn-info btn-lg" data-toggle="modal"
								data-target="#myModal">Request</button></cite>
					</p>

				</div>
			</div>
		</div>
	</section>
</body>
</html>