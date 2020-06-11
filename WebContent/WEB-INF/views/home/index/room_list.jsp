<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header1.jsp"%>
<body>
<header class="top-header" id="top-header-2">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-9 col-sm-7">
                <div class="list-inline">
                    <a href="tel:1-8X0-666-8X88"><i class="fa fa-phone"></i>+010 88888888</a>
                    <a href="tel:info@themevessel.com"><i class="fa fa-envelope"></i>RealHome@163.com</a>
                    <a href="tel:info@themevessel.com"><i class="flaticon-pin"></i>Mon - Sun: 8:00am - 6:00pm</a>
                </div>
            </div>
            <div class="col-lg-4 col-md-3 col-sm-5">
                <ul class="top-social-media pull-right">
                        <li>
                            <a href="https://im.qq.com/" class="qq"><i class="fa fa-qq"></i></a>
                        </li>
                        <li>
                            <a href="https://weixin.qq.com/" class="weixin"><i class="fa fa-weixin"></i></a>
                        </li>
                        <li>
                            <a href="http://t.qq.com/" class="weibo"><i class="fa fa-tencent-weibo"></i></a>
                        </li>
                        <li>
                            <a href="https://weibo.com/" class="weibo"><i class="fa fa-weibo"></i> </a>
                        </li>
                </ul>
            </div>
        </div>
    </div>
</header>
<header class="main-header fixed-header-2">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand company-logo" href="index.html">
                <img src="../resources/home/img/logo.png" alt="logo">
            </a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav header-ml">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="room_list" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Properties
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="room_list.html">Properties List</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="about">About</a></li>
                            <li><a class="dropdown-item" href="service">Services</a></li>
                            <li><a class="dropdown-item" href="contact">Contact</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink7" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            My Account
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        	<c:if test="${account == null }">
                            <li><a class="dropdown-item" href="login">Login</a></li>
                            <li><a class="dropdown-item" href="reg">Register</a></li>
                            <li><a class="dropdown-item" href="contact">Contact Us</a></li>                            
                            </c:if>
                            <c:if test="${account != null }">
                            <li><a class="dropdown-item" href="account/index">Account Center</a></li>
                            <li><a class="dropdown-item" href="account/feedBack">Feedback</a></li>                                                             
                            <li><a class="dropdown-item" href="account/profile">My Profile</a></li>
                            <li><a class="dropdown-item" href="account/booking">Bookings</a></li>
                            </c:if>
                        </ul>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                	<c:if test="${account == null }">
                    <li class="nav-item ">
                        <a class="nav-link" href="login.html">
                            <i class="flaticon-logout"></i>Sign In
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="reg.html" class="nav-link link-color"><i class="flaticon-plus"></i>Register</a>
                    </li>
                    </c:if>
                    <c:if test="${account != null }">
                    <li class="nav-item ">
                        <a class="nav-link" href="account/index">
                            <font color="Red">Welcome, Dear ${account.name }&nbsp;</font>
                            <i class="flaticon-logout"></i>Center
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../home/logout" class="nav-link link-color">Sign Out</a>
                    </li>
					</c:if>
                </ul>
            </div>
        </nav>
    </div>
</header>
<div class="banner" id="banner">
  	<div class="carousel-inner banner-slider-inner text-left">

      	<img class="d-block w-100 h-100" src="../resources/home/img/banner/ban3.png" alt="banner">
        </div>    
</div>
<div class="featured-properties content-area-14">
      <div class="container">
          <!-- Main title -->
          <div class="main-title">
              <a name="anchor"></a>
              <h1>Room List</h1>
          </div>
      </div>
</div>
<div id="due_menu">
<div id="pro_list">
<div id="guest_rooms"> 
<!-- Properties section start -->
<div class="properties-section content-area" >
    <div class="container" >
        <div class="row" >
            <div class="col-lg-8 col-md-12">             
              	    <div class="sidebar-right">
                    <!-- Search box -->
                    <div class="widget search-box">
                        <h3 class="sidebar-title">Search</h3>
                        <div class="s-border"></div>
                        <form class="form-inline form-search" method="GET">
                            <div class="form-group">
                                <input type="text" class="form-control" id="kw" placeholder="Looking for something" value="${kw }">
                            </div>
                            <button type="submit" class="btn" id="search-btn"><i class="fa fa-search"></i></button>
                            <form style="display:none;" action="room_list" method="get" id="search-form"><input type="hidden" name="name" id="search-name"></form>
                        </form>
                 	</div>
                	</div>                             
              	<c:forEach items="${roomTypeList }" var="roomType">
                <div class="property-box-2" >
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-pad">
                            <div class="property-thumbnail">
                                <c:if test="${roomType.status == 1 }">                            
                                <a onclick="window.location.href='account/book_order?roomTypeId=${roomType.id }'" class="property-img">
                                    <img src="${roomType.photo }" alt="properties" class="img-fluid">
                                    <div class="tag">Featured</div>
                                    <div class="price-box"><span>￥${roomType.price }</span> day</div>
                                </a>
                                </c:if>
                                <c:if test="${roomType.status == 0 }">                                
                                <a class="property-img">
                                    <img src="${roomType.photo }" alt="properties" class="img-fluid">
                                    <div class="tag">Featured</div>
                                    <div class="price-box"><span>￥${roomType.price }</span> day</div>
                                </a>                                
                                </c:if>                                
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-pad align-self-center">
                            <div class="detail">
                                <h3 class="title">
                                <c:if test="${roomType.status == 0 }">
                                    ${roomType.name }
                                </c:if>
                                <c:if test="${roomType.status == 1 }">
          							<a onclick="window.location.href='account/book_order?roomTypeId=${roomType.id }'" >
          							${roomType.name }
          							</a>
          						</c:if>
                                </h3>
                                <h5 class="location">
                                    <a onclick="window.location.href='account/book_order?roomTypeId=${roomType.id }'">
                                        </i>${roomType.remark }
                                    </a>
                                </h5>
                                <ul class="facilities-list clearfix">
                                    <li>
                                        <i class="flaticon-bed"></i> ${roomType.bedNum } Beds
                                    </li>
                                    <li>
                                        <i class="flaticon-user"></i> ${roomType.liveNum } People
                                    </li>
                                    <li>
                                        <i class="flaticon-bathroom"></i> 1 Baths
                                    </li>
                                    <li>
                                        <i class="flaticon-ui"></i>           	
                                        <c:if test="${roomType.status == 0 }">
          									Unavailable
          								</c:if>
          								<c:if test="${roomType.status == 1 }">
          									Available
          								</c:if>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <div class="pagination-box p-box-2 text-center">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item">
                            	<c:if test="${offset>0 }"><a class="page-link" href="room_list?offset=${offset-1 }"><i class="fa fa-angle-left"></i></a></c:if>
								<c:if test="${offset==0 }"><a class="page-link" href="room_list?offset=${maxOffset }"><i class="fa fa-angle-left"></i></a></c:if>
                            </li>
                            
                            <c:if test="${maxOffset<=5}">
                            	<c:forEach var="i" begin="0" end="${maxOffset }" step="1">
                            		<c:if test="${offset==i}">
                            			<li class="page-item"><a class="page-link active" href="#anchor"><c:out value="${i+1 }"></c:out></a></li>
                            		</c:if>
                            		<c:if test="${offset!=i}">
                            			<li class="page-item"><a class="page-link" href="room_list?offset=${i }"><c:out value="${i+1 }"></c:out></a>
                            		</c:if>
                            	</c:forEach>
                            </c:if>
                             <c:if test="${maxOffset>5}">
                             	<c:if test="${maxOffset-4>=offset }"><c:set var="x" value="${offset }"></c:set></c:if>
                             	<c:if test="${maxOffset-4<offset }"><c:set var="x" value="${maxOffset-4 }"></c:set></c:if>
                            	<c:forEach var="i" begin="${x }" end="${x+4 }" step="1">
                            		<c:if test="${offset==i}">
                            			<li class="page-item"><a class="page-link active" href="#anchor"><c:out value="${i+1 }"></c:out></a></li>
                            		</c:if>
                            		<c:if test="${offset!=i}">
                            			<li class="page-item"><a class="page-link" href="room_list?offset=${i }"><c:out value="${i+1 }"></c:out></a>
                            		</c:if>
                            	</c:forEach>
                            </c:if>
                            
                            <li class="page-item">
                                <c:if test="${offset<maxOffset }"><a class="page-link" href="room_list?offset=${offset+1 }"><i class="fa fa-angle-right"></i></a></c:if>
                                <c:if test="${offset==maxOffset }"><a class="page-link" href="room_list?offset=${0 }"><i class="fa fa-angle-right"></i></a></c:if>
                            </li>
                        </ul>
                    </nav>
                </div>                                
            	</div>
            <div class="col-lg-4 col-md-12">
              	<div class="sidebar-right">
                    <div class="widget search-box">
                        <h3 class="sidebar-title">Our Aim</h3>
                        <p><img src = "../resources/home/img/Scene.jpg" width="310px"></p>
                        <p>Considerate Service</p>
                        <p>Comfortable Room</p>
                        <p>Agreeable Environment</p>  
                        <p>A Real Home for You</p>                                                                                                                         
                        <div class="s-border"></div>
                 	</div>
                </div>  
            </div>                                	
        </div>
    </div>
</div>
</div>
</div>
</div>
<%@include file="../common/footer.jsp"%>
<script src="../resources/home/js/jquery-1.11.3.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../resources/home/js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
<script src="../resources/home/js/plugins.js"></script>
<script src="../resources/home/js/main.js"></script>
<script>
  (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
  function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
  e=o.createElement(i);r=o.getElementsByTagName(i)[0];
  e.src='//www.google-analytics.com/analytics.js';
  r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
  ga('create','UA-XXXXX-X');ga('send','pageview');
</script>
<script>
$(document).ready(function(){
	$("#search-btn").click(function(){
		$("#search-name").val($("#kw").val());
		$("#search-form").submit();
	})
});
</script>
<script src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script  src="../resources/home/js/jquery.scrollUp.js"></script>
<script  src="../resources/home/js/jquery.magnific-popup.min.js"></script>
<script  src="../resources/home/js/app.js"></script>
</body>