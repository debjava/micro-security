<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<script type="text/javascript">

	var authServerUrl = "http://localhost:8080/micro-auth-server";
	var clientUrl = "http://localhost:8080/micro-client/index.jsp";
	var apiServerUrl = "http://localhost:8080/micro-api-server";
	
	function Redirect() {
		var clientId = "client1"; /*Fixed for an application*/
		var scope = "read write delete";
		var responseType = "token";
		
		var serverUrl = authServerUrl+"/oauth/authorize";
		
		serverUrl = serverUrl + "?response_type=" + responseType
				+ "&client_id=" + clientId + "&scope=" + scope;
		var authUrl = serverUrl + "&redirect_uri=" + clientUrl;

		$(location).attr('href', authUrl);
	}

	function check() {
		try {
			var currentUrl = window.location.href;
			var access_token = currentUrl.match(/\#(?:access_token)\=([\S\s]*?)\&/)[1];
			var serverURL = apiServerUrl+"/api/test/test/123";
			
			$.ajax({
				type : "GET",
				url : serverURL,
				dataType : 'text',
				async : true,
				headers : {
					"Authorization" : "bearer " + access_token
				},
				
				success : function(response) {
					//alert(response);
					$('#resultId').html(response).css({"color":"green"});
				},

				error : function(result) {
					$('#resultId').html(" Unexpected Server Error ").css({"color":"red"});
				}
			});
		}
		catch(err) {
			var message = "Unexpected error, probably you have to login by clicking above the clink.";
			$('#resultId').html(message).css({"color":"red"});;
		}
	}
</script>

</head>

<body>
	<h1>Click below the link to login before submitting zara cluster id.</h1>
	<h2>
		<a id="loginLink" href="#" onclick="Redirect();" style="text-decoration: none"> 
			<strong>Click here to login</strong>
		</a>
	</h2>

	<table>
		<tr>
			<td>Enter ZARA cluster id:</td>
			<td><input type="text" name="textId" value="" id="studentId"></td>
			<td><input type="button" value="Submit" onclick="check();"></td>
		</tr>
	</table>
	
	<br>
	<div id="responseId">
		<label id="resultId"> </label>
		<label id="errorId" style="color: red"></label>
	</div>
	
	
	<input type="hidden" id="tokenId" value="" />

</body>
</html>