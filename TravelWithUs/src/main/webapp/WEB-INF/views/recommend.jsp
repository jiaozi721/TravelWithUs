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
<title>Recommend</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />


<script type="text/javascript" src="js/jquery-ui.min.js"></script> 
<script type="text/javascript" src="js/showhide.js"></script> 
<link rel="stylesheet" href="css/slimbox2.css" type="text/css" media="screen" /> 
<script type="text/JavaScript" src="js/jquery.mousewheel.js"></script> 
<script type="text/JavaScript" src="js/slimbox2.js"></script> 
        <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
        
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>    

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>
     
     <script>
    	var map;
   		var infowindow;
   		
   		var infoArray = new Array();
   		var localmarker = new Array();
   		
    function initialize() {
    	 var mapOptions = {  // 줌 옵션
        zoom: 10
      };
      
      map = new google.maps.Map(document.getElementById('map-canvas'),   //해당되는 아이디와, 맵옵션 이 매개변수인 생성자
          mapOptions);

      // Try HTML5 geolocation
      if(navigator.geolocation) { //값을 읽을 수 있다면
        navigator.geolocation.getCurrentPosition(function(position) { //현재의 위치를 아는 함수 바로 실행 변수는 포지션
          var pos = new google.maps.LatLng(position.coords.latitude,   //위도와 경도를 매개변수로해서 pos에 저장
                                           position.coords.longitude);
		
          var marker = new google.maps.Marker({		//마커에 포지선은: pos 맵은 : map으로
        	  position: pos,
        	  map: map
          });
         
          
          
          
          map.setCenter(pos); //현재 위치를 맵가운데에 고정
          infowindow = new google.maps.InfoWindow(); //알림창 선언
         
          $.getJSON('http://localhost:8080/TravelSystem/RecommendInfo',function(data) {
        	 $(data).each(function (index, item) {
        		 var info = new Object();
        		 var placeinfor = new google.maps.LatLng(item.latitude,item.longitude);
        		 var dist = calcDistance(position.coords.latitude, position.coords.longitude,
        				 item.latitude, item.longitude);
        		 info.loc = placeinfor;
        		 info.num = item.num;
        		 info.title = item.title;
        		 info.price = item.price;
        		 info.duration = item.duration;
        		 info.image = item.image;
        		 info.departure = item.departure;
        		 info.dist = dist;
        		 infoArray.push(info);
        	 });
        	 
        	 sortDesc(infoArray, infoArray.length);
        	 for(var i in infoArray) {
        	   var output = '';
        	   output += '<div class="col one_fourth gallery_box">';
        	   output += '<a href="Travel/'+infoArray[i].num+'"><img src="'+infoArray[i].image+'" class="image_frame"/></a>';
        	   output += '<h5>'+infoArray[i].title+'</h5>';
        	   output += '<p>Price :'+infoArray[i].price+' Duration : '+infoArray[i].duration+'</p>';
        	   output += '<p>Departure : '+ infoArray[i].departure+'</p>';
        	   output += '<strong><p>Distance from departure :'+infoArray[i].dist+'km</p></strong>';
        	   output += '</div>'
        	   $('#recommend').append(output);   
         	  var marker = new google.maps.Marker({    //마커 함수를 맵 객체와, 현재위치 객체와, 애니매이션 효과로 생성한다.
          	    map: map,
          	    position: infoArray[i].loc,
          	    animation: google.maps.Animation.DROP
          	  });
         	 google.maps.event.addListener(marker, 'click', function() { 
          	    infowindow.setContent(infoArray[i].departure); 
          	    infowindow.open(map, this);
          	  });
         	 }

      	

            
          });

          
        }, function() {
          handleNoGeolocation(true); //에러 핸들러 함수 실행
        });
      } else {
        // Browser doesn't support Geolocation
        handleNoGeolocation(false); //에러핸들러 함수 실행안함
      }
    }

    function createMarker(place) {  //마커 생성함수
    	  var marker = new google.maps.Marker({    //마커 함수를 맵 객체와, 현재위치 객체와, 애니매이션 효과로 생성한다.
    	    map: map,
    	    position: place,
    	    animation: google.maps.Animation.DROP
    	  });
    	  
    	//  google.maps.event.addListener(marker, 'click', function() { //클릭할시에 
    	   // infowindow.setContent(place.name+'^^'+place.website); //정보에 장소 이름을 띄운다.
    	  //  infowindow.open(map, this);
    	 // });
     }

    function sortDesc(infoArray, num) {
    	var temp = new Object;
    	for(var i = 0 ; i < num-1 ; i++) {
    		for (var j = i + 1 ; j < num ; j++) {
    			if(infoArray[i].dist > infoArray[j].dist) {
    				temp = infoArray[i];
    				infoArray[i] = infoArray[j];
    				infoArray[j] = temp;
    			}
    		}
    	}
    }

    function handleNoGeolocation(errorFlag) {
      if (errorFlag) {
        var content = 'Error: The Geolocation service failed.';
      } else {
        var content = 'Error: Your browser doesn\'t support geolocation.';
      }

      var options = {
        map: map,
        position: new google.maps.LatLng(60, 105),
        content: content
      };

      var infowindow = new google.maps.InfoWindow(options);
      map.setCenter(options.position);
    }

    google.maps.event.addDomListener(window, 'load', initialize);

    
    
    function calcDistance(lat1, lon1, lat2, lon2){
        var EARTH_R, Rad, radLat1, radLat2, radDist; 
        var distance, ret;

        EARTH_R = 6371000.0;
        Rad = Math.PI/180;
        radLat1 = Rad * lat1;
        radLat2 = Rad * lat2;
        radDist = Rad * (lon1 - lon2);
        
        distance = Math.sin(radLat1) * Math.sin(radLat2);
        distance = distance + Math.cos(radLat1) * Math.cos(radLat2) * Math.cos(radDist);
        ret = EARTH_R * Math.acos(distance);

        return  Math.round(Math.round(ret) / 1000);
    }

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
	<div id="site_title"><h1><a href="home">Travel with us</a></h1></div>
     <div id="templatemo_menu" class="ddsmoothmenu">
                <ul>
            <li><a href="home">Home</a></li>
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
<div id="map-canvas"></div>
<div class="cleaner"></div>
<br><br>
			<center><h2>Recommend</h2></center>
			<center><h4>More closely...</h4></center>
            <br>
            
			<div id="recommend"></div>
			            
            <div class="cleaner"></div>
            <div class="pagging">
                <ul>
                    <li><a href="#">Previous</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">Next</a></li>
                </ul>
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