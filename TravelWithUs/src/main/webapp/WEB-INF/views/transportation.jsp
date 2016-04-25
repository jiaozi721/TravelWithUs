<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

     <style>
      #map-canvas {
        height: 340px;
        width:960px;
        margin: 0 auto;
        border-style: double;
      }
     </style> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Transportation</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<!-- templatemo 358 carousel -->
<!-- 
Carousel Template 
http://www.templatemo.com/preview/templatemo_358_carousel 
-->
<script type="text/javascript" src="js/jquery-1-4-2.min.js"></script> 
<!--script type="text/javascript" src="/jqueryui/js/jquery-ui-1.7.2.custom.min.js"></script--> 
<script type="text/javascript" src="js/jquery-ui.min.js"></script> 
<script type="text/javascript" src="js/showhide.js"></script> 
<script type="text/JavaScript" src="js/jquery.mousewheel.js"></script> 

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">

/***********************************************
* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

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
	<div id="site_title"><h1><a href="#">Carousel Template</a></h1></div>
     <div id="templatemo_menu" class="ddsmoothmenu">
                <ul>
            <li><a href="home">Home</a></li>
            <li><a href="about.html">About</a>
            </li>
            <li id="service" class="selected"><a href="Travel">Service</a>
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
	<div class="map-canvas">
    <h2>Transportation</h2>
    <form id="trans_info">
    <center>
    <h4>Departure : 
    	<select name="ss">
    	<option>beijing</option>
    	<option>b</option>
    	<option>c</option>
   		</select>
    </h4>
    <br />
    <h4>
    Destination :
        	<select name="ss">
    	<option>beijing</option>
    	<option>b</option>
    	<option>c</option>
   		</select>
    </h4>
    <br />
    <h4>
    One/Both way: One <input type="radio" name="one" checked/> Both <input type="radio" name="one" />
    </h4>
    <br />
    
    <h4>
    Departure Date: <input type="date" name="d_date" />
    Arrival Date: <input type="date" name="a_date"  />    
    </h4>
    </center>
    </form>
    </div>
    
    
            <div class="cleaner h40"></div>
    
        <div class="half float_l">
        <h4>Train</h4>
       		<div class="half float_l">
        		<div class="rp_pp">
            <img src="images/_avator.png" alt="Image 01" />
            <a href="#">AirChina - CA320</a>
            <p align="left"></p>
            <p>Fromto: Beijing -> Shanghai</p>
            <p>Time: 10:00 ~ 15:00</p>
            <p>Price: 2300 RMB</p>
            <div class="cleaner"></div>
        		</div>
			</div>
			       		<div class="half float_l">
        		<div class="rp_pp">
            <img src="images/_avator.png" alt="Image 01" />
            <a href="#">AirChina - CA320</a>
            <p align="left"></p>
            <p>Fromto: Beijing -> Shanghai</p>
            <p>Time: 10:00 ~ 15:00</p>
            <p>Price: 2300 RMB</p>
            <div class="cleaner"></div>
        		</div>
			</div>
		</div>
        <div class="half float_r">
        <h4>Airplain</h4>
       		<div class="half float_l">
        		<div class="rp_pp">
            <img src="images/_avator.png" alt="Image 01" />
            <a href="#">AirChina - CA320</a>
            <p align="left"></p>
            <p>Fromto: Beijing -> Shanghai</p>
            <p>Time: 10:00 ~ 15:00</p>
            <p>Price: 2300 RMB</p>
            <div class="cleaner"></div>
        		</div>
			</div>
			       		<div class="half float_l">
        		<div class="rp_pp">
            <img src="images/_avator.png" alt="Image 01" />
            <a href="#">AirChina - CA320</a>
            <p align="left"></p>
            <p>Fromto: Beijing -> Shanghai</p>
            <p>Time: 10:00 ~ 15:00</p>
            <p>Price: 2300 RMB</p>
            <div class="cleaner"></div>
        		</div>
			</div>
        </div>
        
        <div class="cleaner h40"></div>
        <div class="cleaner"></div>
    
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

</body>
</html>