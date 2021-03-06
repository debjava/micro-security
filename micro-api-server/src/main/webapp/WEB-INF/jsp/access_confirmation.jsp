<%@ page
	import="org.springframework.security.core.AuthenticationException"%>
<%@ page
	import="org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter"%>
<%@ page
	import="org.springframework.security.oauth2.common.exceptions.UnapprovedClientAuthenticationException"%>

<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Access Confirmation</title>

</head>

<body>

	<h1>Access Confirmation</h1>

	<div id="content">

		<%
			if (session
					.getAttribute(AbstractAuthenticationProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY) != null
					&& !(session
							.getAttribute(AbstractAuthenticationProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY) instanceof UnapprovedClientAuthenticationException)) {
		%>
		<div class="error">
			<h2>Woops!</h2>
			<p>
				Access could not be granted. (<%=((AuthenticationException) session
						.getAttribute(AbstractAuthenticationProcessingFilter.SPRING_SECURITY_LAST_EXCEPTION_KEY))
						.getMessage()%>)
			</p>
		</div>
		<%
			}
		%>
		<c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION" />

		<authz:authorize ifAllGranted="ROLE_USER">
			<h2>Please Confirm</h2>

			<p>
				You hereby authorize "
				<c:out value="${client.clientId}" />
				" to access your ZARA protected resources with following scopes :
			</p>
			<ul>
				<c:forEach var="scope" items="${auth_request.scope}">
					<li>${scope}</li>
				</c:forEach>
			</ul>

			<table>
				<tr>
					<td>
						<form id="confirmationForm" name="confirmationForm"
							action="<%=request.getContextPath()%>/oauth/authorize"
							method="post">
							<input name="user_oauth_approval" value="true" type="hidden" />
							<label><input name="authorize" value="Authorize"
								type="submit"></label>
						</form>
					</td>

					<td>
						<form id="denialForm" name="denialForm"
							action="<%=request.getContextPath()%>/oauth/authorize"
							method="post">
							<input name="user_oauth_approval" value="false" type="hidden" />
							<label><input name="deny" value="Deny" type="submit"></label>
						</form>
					</td>
				</tr>
			</table>




		</authz:authorize>
	</div>

</body>
</html>
