<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My Location</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
     <style>
      #map-canvas {
        height: 340px;
        width:960px;
        margin: 0 auto;
        border-style: double;
      }
     </style> 
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<!--script type="text/javascript" src="/jqueryui/js/jquery-ui-1.7.2.custom.min.js"></script--> 
<script type="text/javascript" src="js/jquery-ui.min.js"></script> 
<script type="text/javascript" src="js/showhide.js"></script> 
<script type="text/JavaScript" src="js/jquery.mousewheel.js"></script> 
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>    

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCG_MWD0loXlW9PcUECLrYjRA-lGHd5QFw&v=3.exp&signed_in=true&libraries=places"></script>
     
         <script>
    	var map;
   		var infowindow;
   		var hospital = 'images/marker/hospital.png';
   		
   		//var MARKER_PATH = 'https://maps.gstatic.com/intl/en_us/mapfiles/marker_green';
   		//var markers = [];
   
    function initialize() {
    	 var mapOptions = {  // 줌 옵션
        zoom: 15
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
          
          
          
          var request = {     	//각각 정보 세팅
        	location: pos,
        	radius: 1000,
        	types: ['hospital']
          };
          
          map.setCenter(pos); //현재 위치를 맵가운데에 고정
          
          infowindow = new google.maps.InfoWindow(); //알림창 선언
          
          
          var service = new google.maps.places.PlacesService(map);  // 장소 서비스 연결 선언
          service.nearbySearch(request,callback);   // 콜백함수와 요청함수를 매개변수로 주변 검색 호출
          
          
        }, function() {
          handleNoGeolocation(true); //에러 핸들러 함수 실행
        });
      } else {
        // Browser doesn't support Geolocation
        handleNoGeolocation(false); //에러핸들러 함수 실행안함
      }
    }
    
    function callback(results, status) {  // 콜백 함수는 결과와, 상태를 매개변수로 한다.
    	  if (status == google.maps.places.PlacesServiceStatus.OK) {  //현재 상태가 서비스가 연결된 상태이면
    	    for (var i = 0; i < results.length; i++) {  // 결과의 총 값만큼 반복 실행
    	      createMarker(results[i]);  //수많큼 마커를 찍는다
    	    }
    	  }
    	}

    function createMarker(place) {  //마커 생성함수
    	 
    	  var placeLoc = place.geometry.location;  //결과정보 ( 장소정보) 를 출력해오는데 거기의 지역위치를 받는다.
    	  var placetype = place.types;
    	  if(placetype.indexOf("hospital") == -1 && placetype.indexOf("lodging") == -1 && placetype.indexOf("restaurant") == -1) {
    		 return; 
    	  }
    	  var marker = new google.maps.Marker({    //마커 함수를 맵 객체와, 현재위치 객체와, 애니매이션 효과로 생성한다.
    	    map: map,
    	    position: place.geometry.location,
    	    animation: google.maps.Animation.DROP
    	    //icon : hospital
    	  });
		
    	  //alert(place.geometry.location);
    	  
    	  var output = '';
    	  output += '<div class="col one_third fp_services">';
    	  if(placetype.indexOf("hospital") != -1){
    		  output += '<div class="rp_pp">';
        	  output += '<img src="images/region/hopital.png"/>';
    	  }
    	  else if(placetype.indexOf("lodging") != -1){
    		  output += '<div class="rp_pp">';
        	  output += '<img src="images/region/lodging.png"/>';
    	  }
    	  else if(placetype.indexOf("restaurant") != -1){
    		  output += '<div class="rp_pp">';
        	  output += '<img src="images/region/restaurant.png"/>';
    	  }
    	  output += '<a href="#">'+place.name+'</a>';
    	  output += '<p>Address : '+place.vicinity+'</p>';
    	  output += '<div class="cleaner"></div></div></div>';
  	  
    	  if(placetype.indexOf("hospital") != -1){
    		  $('#hospital').append(output);
    	  }
    	  else if(placetype.indexOf("lodging") != -1){
    		  $('#lodging').append(output);
    	  }
    	  else if(placetype.indexOf("restaurant") != -1){
    		  $('#restaurant').append(output);
    	  }
    	  
    	  
    	  google.maps.event.addListener(marker, 'click', function() { //클릭할시에 
    	    infowindow.setContent('Name :'+place.name+'<br>Address :'+place.vicinity); //정보에 장소 이름을 띄운다.
    	    infowindow.open(map, this);
    	  });
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
</div>

<div id="templatemo_main">
	<div id="content">
	<div id="map-canvas"></div>
    </div>
    <div class="cleaner"></div>
    <br><br>
    
    <div id="hospital" class="col one_third fp_services">
	<h3>HOSPITAL</h3>
    </div>
    
    <div id="restaurant" class="col one_third fp_services">
	<h3>RESTAURANT</h3>
    </div>
    
    
    <div id="lodging" class="col one_third fp_services">
	<h3>LODGING</h3>
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