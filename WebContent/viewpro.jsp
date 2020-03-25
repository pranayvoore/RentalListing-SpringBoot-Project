<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kirai Pe Ghar</title>
</head>
<body style="background-color: #cfd2c7">

	<div class="container-fluid" align="right">
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form id="Homeform" method="get" action="${contextPath}/welcome">
				<input type="submit" name="Home" value="Home" />
			</form>

			<form id="logoutForm" method="POST" action="${contextPath}/logout">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>

			<h2>
				Welcome ${pageContext.request.userPrincipal.name} | <a
					onclick="document.forms['logoutForm'].submit()">Logout</a>
			</h2>
		</c:if>
	</div>

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
	<form action="${contextPath}/searchbycity" method="get">
		<input type="text" name="city" placeholder="Enter City"> <input
			type="text" name="place" placeholder="Enter Place">
		<button type="submit">Search</button>
	</form>
	<c:if test="${empty plist}">

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
				<!-- <th>Owner Name</th>
				<th>Square Yards</th>
				<th>Price</th>
				<th>Type</th> -->
			</tr>


			<c:forEach items="${plist}" var="p">

				<tr>

					<td><a href="${contextPath }/${p.id}/getProp"> ${p.pname}</a></td>

					<td>${p.location }</td>
					<td>${p.city }</td>
					<%-- <td>${p.ownername}</td>
					<td>${p.sqyards }</td>
					<td>${p.price}</td>
					<td>${p.type }</td> --%>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>