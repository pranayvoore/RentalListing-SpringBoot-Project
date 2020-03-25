
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
</head>
<body>
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

	<div>
		<h2>New User</h2>
		<div>
			<div>
				<form:form
					action="${contextPath }/updateuser/${pageContext.request.userPrincipal.name}"
					modelAttribute="user" method="post">
					<div align="center">
						<table>
							<tr>
								<div>
									<td><form:label path="email">email : </form:label></td>
									<td><form:input type="email" id="email" path="email"
											required="required" /></td>
									<form:errors path="email" />
								</div>
							</tr>
							<tr>
								<div>
									<td><form:label path="phonenum">Phone Number	 : </form:label></td>
									<td><form:input type="text" id="phonenum" path="phonenum"
											required="required" /></td>
									<form:errors path="phonenum" />
								</div>
							</tr>
							<tr>
								<div>
									<td><form:label path="address">Address : </form:label></td>
									<td><form:input type="text" id="address" path="address"
											required="required" /></td>
									<form:errors path="address" />
								</div>
							</tr>
						</table>
					</div>

					<div>

						<div>
							<input type="submit" value="Update User">
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>

</body>
</html>