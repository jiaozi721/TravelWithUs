<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Travel List</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery-1-4-2.min.js"></script> 
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>    
<script type="text/javascript" src="js/jquery-ui.min.js"></script> 
<script type="text/javascript" src="js/showhide.js"></script> 
<script type="text/JavaScript" src="js/jquery.mousewheel.js"></script> 

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">
</script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "templatemo_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script> 

</head>
<body id="subpage">

<div id="templatemo_header_wrapper">
	<div id="site_title"><h1><a href="#">Travel with us</a></h1></div>
     <div id="templatemo_menu" class="ddsmoothmenu">
                  <ul>
            <li><a href="home" >Home</a></li>
            <li><a href="about.html">About</a>
            </li>
            <li id="service"><a href="Travel" class="selected">Service</a>
                <ul>
                    <li><span class="top"></span><span class="bottom"></span></li>
                    <li><a href="Travel">Travel</a></li>
                    <li><a href="mylocation">My location</a></li>
                    <li><a href="Recommend">Recommend</a></li>
                    <li><a href="Transportation">Transportaion</a></li>
              	</ul>
            </li>
            <li><a href="epilogue">Epilogue</a></li>
            <li><a href="product">Product</a></li>
            <li id="login_button"><a href="login">Login</a></li>
            <li id="logout_button"><a href="logout">Logout</a></li>
        </ul>
        <br style="clear: left" />
    </div> <!-- end of templatemo_menu -->
    <div class="cleaner"></div>
</div>	<!-- END of templatemo_header_wrapper -->

<div id="templatemo_main">
	<div id="content">
	
	<c:forEach items="${list}" var="i">
    	<div class="post">	
            <h2><c:out value="${i.title}"></c:out></h2>      
            <img src="<c:out value="${i.l_image}"></c:out>"/>   
            <div class="meta">
                <span class="date">Duration : <c:out value="${i.duration}"></c:out></span>
                <span class="tag">Departure : <c:out value="${i.departure}"></c:out></span>
                <span class="comment">35 comments</span>
                <span class="tag">Price : <c:out value="${i.price}"></c:out></span>
                <span class="more_but"><a href="Travel/${i.num}" class="more">More</a></span>
                <div class="cleaner"></div>
            </div> 
        </div>
     </c:forEach>   
         <div class="pagging">
                <ul>
                    <li><a href="#">Previous</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">Next</a></li>
                </ul>
            </div>
        <div class="cleaner"></div>
    </div>
    
    
    <div class="cleaner"></div>
</div> <!-- END of templatemo_main -->

<div id="templatemo_bottom_wrapper">
    <div id="templatemo_bottom">
    	<div class="col one_third">
        	<h4><span></span>Blogroll</h4>
            <div class="bottom_box">
                <ul class="footer_list">
                    <li><a href="#">Learn HTML CSS</a></li>
                    <li><a href="#">Web Design</a></li>
                    <li><a href="#">Flash Gallery</a></li>
                    <li><a href="#">Website Templates</a></li>
                    <li><a href="#">Free Graphics</a></li>
                </ul>  
			</div>
        </div>
        
        <div class="col one_third">
        	<h4><span></span>Updates</h4>
            <div class="bottom_box">
              <ul class="twitter_post">
                    <li>Curabitur nec dui venenatis sem consectetur facilisis. Donec velit nisi, lacinia sed et. <a href="#">http://bit.ly/13IwZO</a></li>
                    <li>Proin dignissim, diam nec <a href="#">@TemplateMo</a> enim lorem tempus orci, ac imperdiet ante purus in justo.</li>
                </ul>
			</div>
        </div>
        
        <div class="col one_third no_margin_right">
        	<h4><span></span>About Us</h4>
            <div class="bottom_box">
                <p><em>Duis sem nisl, dignissim ac feugiat in, mattis sit amet est. Duis leo leo, suscipit cursus vehicula sit amet. Sed varius pellentesque massa vel rutrum.</em></p><br />
                <div class="footer_social_button">
                    <a href="#"><img src="images/facebook.png" title="facebook" alt="facebook" /></a>
                    <a href="#"><img src="images/flickr.png" title="flickr" alt="flickr" /></a>
                    <a href="#"><img src="images/twitter.png" title="twitter" alt="twitter" /></a>
                    <a href="#"><img src="images/youtube.png" title="youtube" alt="youtube" /></a>
                    <a href="#"><img src="images/feed.png" title="rss" alt="rss" /></a>
                </div>
            </div>
        </div>
        
    	<div class="cleaner"></div>
    </div> <!-- END of tempatemo_bottom -->
</div> <!-- END of tempatemo_bottom_wrapper -->

<div id="templatemo_footer_wrapper">
    <div id="templatemo_footer">
    	Copyright @ 2048 Your Company Name
    </div> <!-- END of templatemo_footer_wrapper -->
</div> <!-- END of templatemo_footer -->
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			typy: "GET",
			url: "http://localhost:8080/TravelSystem/status",
			cache:false,
			success: function(data) {
				var stutus = "";
				status = data;
				if(status=="") {
					$('#service,#logout_button').hide();
					$('#login_button').show();
				}
				else { 
					$('#login_button').hide();
					$('#service,#logout_button').show();
				}
			},
			error: function() {
				alert("status error!");
			}
		});
	});
	</script>
</body>
</html>