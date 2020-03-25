<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
						href="${contextPath }/paymenthistory/${pageContext.request.userPrincipal.name}"><i
							class="fa fa-payment"></i> Payment History</a></li>
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
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<%-- <c:out value="${now }"></c:out> --%>

	<br>
	<br>
	<div align="center">
		<form
			action="${contextPath }/addpayment/${pageContext.request.userPrincipal.name}"
			method="get">
			<table class="tablepay">
				<tr>
					<td>Date</td>
					<td>:<input type="text"
						value="<fmt:formatDate type = "both" 
      					   value = "${now}" />"
						readonly="readonly" name="date" /></td>
				</tr>
				<tr>
					<td>Enter Name on the Card</td>
					<td>: <input type="text" name="name"
						placeholder="Enter name on the card" required="required">
					</td>
				</tr>

				<tr>
					<td>Enter Amount</td>
					<td>: <input type="text" name="amount"
						placeholder="Enter Payment" required="required">
					</td>
				</tr>
				<tr>
					<td>Type of Payment</td>
					<td>: <select name="type" required="required">
							<option>Select Payment Mode</option>
							<option>Debit Card</option>
							<option>Credit Card</option>
					</select></td>
				</tr>
				<tr>
					<td>Card Number</td>
					<td>: <input type="text" id="cc_no" name="cc_no"
						placeholder="Enter Card Number" required="required" /> <span
						id="err_cc_no" class="jserror"> </span></td>
				</tr>
				<tr>
					<td>Expiry Date</td>
					<td>
						<table cellpadding="0" cellspacing="0">
							<tr>
								<td><select id="cc_exp_mm" name="cc_exp_mm"
									required="required">
										<option value="">Month</option>
										<option value="1" selected="selected">January</option>
										<option value="2">February</option>
										<option value="3">March</option>
										<option value="4">April</option>
										<option value="5">May</option>
										<option value="6">June</option>
										<option value="7">July</option>
										<option value="8">August</option>
										<option value="9">September</option>
										<option value="10">October</option>
										<option value="11">November</option>
										<option value="12">December</option>
								</select></td>
								<td width="20">&nbsp;</td>
								<td><select id="cc_exp_yyyy" name="cc_exp_yyyy">
										<option value="">Month</option>
										<option value="2016" selected="selected">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
										<option value="2021">2021</option>
										<option value="2022">2022</option>
										<option value="2023">2023</option>
										<option value="2024">2024</option>
										<option value="2025">2025</option>
										<option value="2026">2026</option>
										<option value="2027">2027</option>
										<option value="2028">2028</option>
										<option value="2029">2029</option>
										<option value="2030">2030</option>
								</select></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>Security Code</td>
					<td>: <input id="cvv" type="text" size="5" name="cvv"
						value="111" required="required" />
					</td>
				</tr>
			</table>
			<div align="center">
				<button class="button button-3 button-3e icon-arrow-right"
					type="submit" value="Confirm Payment">
					<i class="	fab fa-amazon-pay	"></i> Confirm Payment
				</button>
			</div>

		</form>
	</div>
</body>
</html>