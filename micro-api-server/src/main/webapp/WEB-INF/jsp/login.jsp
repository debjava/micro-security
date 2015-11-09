<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<title>OAUTH2 Authentication in Spring Security</title>

</head>

<body>

	<h1>JDBC based OAUTH2 Authentication in ZARA Security</h1>

	<div id="content">
		<!-- For displaying errors -->
		<c:if test="${not empty param.authentication_error}">
			<h1>Woops!</h1>
			<p class="error">Your login attempt was not successful.</p>
		</c:if>
		<c:if test="${not empty param.authorization_error}">
			<h1>Woops!</h1>
			<p class="error">You are not permitted to access that resource.</p>
		</c:if>
		<!-- For displaying errors -->

		<h2>Login with your credentials</h2>
		<h3>Username : d, password : d</h3>

		<form id="loginForm" name="loginForm"
			action="<c:url value="/login.do"/>" method="post">

			<table>
				<tr>
					<td><strong>Username:</strong></td>
					<td><input type='text' name='j_username' value="d"></td>
				</tr>

				<tr>
					<td><strong>Password:</strong></td>
					<td><input type="password" name='j_password' value="d"></td>
				</tr>
				<tr>
					<td/>
					<td><input name="login" value="Login" type="submit" /></td>
				</tr>
			</table>

		</form>
	</div>

</body>
</html>
