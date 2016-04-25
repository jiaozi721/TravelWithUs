<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>    
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
  </head>
  
<body>

    <div class="wrapper">
	<div class="container">
		<h1>Welcome To Travel With Us !</h1>
		
		<form id="login_data">
			<input type="text" name="id" placeholder="Username">
			<input type="password" name="password" placeholder="Password">
			<button type="submit">Login</button>
			<p>If you are not a our member, please <a href="signup">Sign up</a> first !</p>
		</form>
		
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
</div>
    

        <script src="js/index.js"></script>
        
	    <script type="text/javascript">
	$(document).ready(function() {
		$("#login_data").submit(function() {
			var tid = login_data.id.value;
			var tpassword = login_data.password.value;
			var _url = "http://localhost:8080/TravelSystem/login/"+tid+"/"+tpassword;
			$.ajax({
				type:"GET",		
				url:_url,
				cache:false,
				success: function(data) {
					alert(data);
					var temp = data;
					if(temp.indexOf("Success") != -1){
						location.replace("home");
					}
					},
				error: function() {
					alert("Access denied");
					}
			});
			event.preventDefault();	
		});
	});
	</script>
    
    
    
  </body>
</html>