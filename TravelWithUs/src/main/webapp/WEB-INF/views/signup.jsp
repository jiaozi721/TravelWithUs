<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>    
    <title>Sign Up</title>
    <link rel="stylesheet" href="css/style.css">
  </head>
  
<body>

    <div class="wrapper">
	<div class="container">
		<form action="signup" method = "post">
			<input type="text" name="id" placeholder="Username">
			<input type="password" name="password" placeholder="Password">
			<input type="text" name="name" placeholder="Name">
			<input type="text" name="phone" placeholder="Phone Number">
			<input type="email" name="email" placeholder="E-Mail">
			<input type="text" name="nation" placeholder="Nation">
			<button type="submit">Sign Up</button>
		</form>
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>

	</ul>
</div>
       <script src="js/index.js"></script>    
  </body>
</html>