<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Travel With Us</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>    
<script type="text/javascript" src="js/jquery-1-4-2.min.js"></script> 
<script type="text/javascript" src="js/jquery-ui.min.js"></script> 
<script type="text/javascript" src="js/showhide.js"></script> 
<script type="text/JavaScript" src="js/jquery.mousewheel.js"></script> 

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "templatemo_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script> 

<script type="text/JavaScript" src="js/cloud-carousel.1.0.5.js"></script>
 
<script type="text/javascript">
$(document).ready(function(){
						   
	// This initialises carousels on the container elements specified, in this case, carousel1.
	$("#carousel1").CloudCarousel(		
		{			
			reflHeight: 40,
			reflGap: 2,
			titleBox: $('#da-vinci-title'),
			altBox: $('#da-vinci-alt'),
			buttonLeft: $('#slider-left-but'),
			buttonRight: $('#slider-right-but'),
			yRadius: 30,
			xPos: 480,
			yPos: 32,
			speed:0.15,
			autoRotate: "yes",
			autoRotateDelay: 1500
		}
	);
});
</script>

</head>
<body id="home">

<div id="templatemo_header_wrapper">
	<div id="site_title"><h1><a href="home">Travel with us</a></h1></div>
     <div id="templatemo_menu" class="ddsmoothmenu">
        <ul>
            <li><a href="home" class="selected">Home</a></li>
            <li><a href="about.html">About</a>
            </li>
            <li id="service"><a href="Travel">Service</a>
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
<div id="templatemo_slider">
	<!-- This is the container for the carousel. -->
    <div id = "carousel1" style="width:960px; height:280px;background:none;overflow:scroll; margin-top: 20px">            
    <c:forEach items="${list}" var="d">
        <a href="Travel/${d.num}" rel="lightbox"><img class="cloudcarousel" src="${d.image}" title="${d.title}" /></a>
    </c:forEach>    
    </div>
    
    <!-- Define left and right buttons. -->
    <center>
    <input id="slider-left-but" type="button" value="" />
    <input id="slider-right-but" type="button" value="" />
    </center>
</div>
<div id="templatemo_main">
	
    <div class="col one_third fp_services">
    <h2>Welcome TWU !</h2>
        <img src="images/Travelwithus2.png" alt="Image 04 " class="image_fl" />
        <p>Welcome to Travel With Us</p>
        <p>Our website can recommend, provide to search region, recommend travel package and compare transportation. You can be smart with us.        </p>
        <ul class="templatemo_list">
          <li class="flow">Search Surrounding Area Information</li>
            <li class="flow nomr">Recommend Travel Package</li>
            <li class="flow">Compare Transportation Price</li>
        </ul>
    </div>
    
    
    <div class="col one_third fp_services">
        <h2>Best Epilogue</h2>
        
        <div class="testimonial">
            <p>bla bla</p>
            <cite>Writer  <a href="#"><span>- travel region , recommend</span></a></cite></div>
    	<div class="testimonial">
            <p>bla bla</p>
    		<cite>Writer <a href="#"><span>- Senior Director, recommend</span></a></cite></div>
        
    </div>
    
    
    
  <div class="col one_third no_margin_right fp_services">
  
  
        <h2>Best Product</h2>
        <c:forEach items="${top3}" var="p">
        <div class="rp_pp">
            <img src="${p.s_imagepath}"/>
            <a href="Product/${p.num}">${p.name}</a>
            <p>price: <c:out value="${p.price}"></c:out>,  Hit : <c:out value="${p.hit}"></c:out></p>
            <div class="cleaner"></div>
    	</div>
    	</c:forEach>
    </div>
    
    
    <div class="cleaner"></div>
</div> <!-- END of templatemo_main -->

<div id="templatemo_bottom_wrapper">
    <div id="templatemo_bottom">
    	<div class="col one_third">
        	<h4><span></span>Reference</h4>
            <div class="bottom_box">
                <ul class="footer_list">
                    <li>1<a href="#"></a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                </ul>  
			</div>
        </div>
        <div class="col one_third">
        	<h4><span></span>Information</h4>
            <div class="bottom_box">
                <ul class="twitter_post">
                    <li>Our service is provided by GOOGLE MAP. If you want to get more information, <a href="http://map.google.com">http://map.google.com/</a></li>
                    <li>All of our service can uesd by only our's member. So, if you want to use our service, login !</li>
                </ul>
			</div>
        </div>
        <div class="col one_third no_margin_right">
        	<h4><span></span>About Us</h4>
            <div class="bottom_box">
                <p><em>Our team is composed 5 members. 2 indonesian, 3 korean.</em></p><br />              
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
    	Copyright @ 2015 Travel with us
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