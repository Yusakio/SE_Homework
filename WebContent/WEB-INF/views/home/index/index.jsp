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
      	<img class="d-block w-100 h-100" src="../resources/home/img/banner/IndexPhoto.JPEG" alt="banner">
     		<div class="carousel-content container banner-info-2 bi-3 text-center">
                <h3>Find Your Apartments</h3>
                <p>Provide a warm and comfortable home for the youth.</p>
                <a href="#anchor" class="btn btn-white btn-read-more">Read More</a>
            </div>
        </div>    
</div>
<div class="featured-properties content-area-14">
      <div class="container">
          <div class="main-title">
              <a name = "anchor"><h1>Featured Properties</h1></a>
              <p>Find the most suitable room for yourself here.</p>
          </div>
          <div class="row">
              <div class="col-lg-4 col-md-6">
                  <div class="property-box">
                      <div class="property-thumbnail">
                          <a class="property-img">
                              <div class="tag">Featured</div>
                              <div class="price-box"><span>RMB2200.00</span> month</div>
                              <img class="d-block w-100" src="../resources/home/img/properties/room1.jpg" alt="properties">
                          </a>
                      </div>
                      <div class="detail">
                          <h1 class="title">
                              <a >Brightly colored room</a>
                          </h1>
                          <div class="location">
                              <a >
                                  <i class="flaticon-pin"></i>123 WuDaoKou St. Beijing,
                              </a>
                          </div>
                          <ul class="facilities-list clearfix">
                              <li>
                                  <i class="flaticon-bed"></i> 1 Bed
                              </li>
                              <li>
                                  <i class="flaticon-bathroom"></i> 1 Bath
                              </li>
                              <li>
                                  <i class="flaticon-air-conditioner"></i> 1 conditioner
                              </li>
                              <li>
                                  <i class="flaticon-comment"></i> 110 likes
                              </li>

                          </ul>
                      </div>
                  </div>
              </div>
              <div class="col-lg-4 col-md-6">
                  <div class="property-box">
                      <div class="property-thumbnail">
                          <a class="property-img">
                              <div class="tag">Featured</div>
                              <div class="price-box"><span>RMB1800.00</span> month</div>
                              <img class="d-block w-100" src="../resources/home/img/properties/room2.jpg" alt="properties">
                          </a>
                      </div>
                      <div class="detail">
                          <h1 class="title">
                              <a >Contracted Style Room</a>
                          </h1>
                          <div class="location">
                              <a >
                                  <i class="flaticon-pin"></i>225 NanSanJie St. Beijing,
                              </a>
                          </div>
                          <ul class="facilities-list clearfix">
                              <li>
                                  <i class="flaticon-bed"></i> 1 Bed
                              </li>
                              <li>
                                  <i class="flaticon-bathroom"></i> 1 Bath
                              </li>
                              <li>
                                  <i class="flaticon-air-conditioner"></i> 1 conditioner
                              </li>
                              <li>
                                  <i class="flaticon-comment"></i> 230 likes
                              </li>
                          </ul>
                      </div>
                  </div>
              </div>
              <div class="col-lg-4 col-md-6">
                  <div class="property-box">
                      <div class="property-thumbnail">
                          <a  class="property-img">
                              <div class="tag">Featured</div>
                              <div class="price-box"><span>RMB1200.00</span> month</div>
                              <img class="d-block w-100" src="../resources/home/img/properties/room3.jpg" alt="properties">
                          </a>
                      </div>
                      <div class="detail">
                          <h1 class="title">
                              <a >Real Affordable Room</a>
                          </h1>
                          <div class="location">
                              <a >
                                  <i class="flaticon-pin"></i>118 ZhiChunLu St. Beijing,
                              </a>
                          </div>
                          <ul class="facilities-list clearfix">
                              <li>
                                  <i class="flaticon-bed"></i> 1 Bed
                              </li>
                              <li>
                                  <i class="flaticon-bathroom"></i> 1 Bath
                              </li>
                              <li>
                                  <i class="flaticon-air-conditioner"></i> None
                              </li>
                              <li>
                                  <i class="flaticon-comment"></i> 1100 likes
                              </li>
                          </ul>
                      </div>
                  </div>
              </div>
              <div class="col-lg-4 col-md-6">
                  <div class="property-box">
                      <div class="property-thumbnail">
                          <a  class="property-img">
                              <div class="tag">Featured</div>
                              <div class="price-box"><span>RMB2000.00</span> month</div>
                              <img class="d-block w-100" src="../resources/home/img/properties/room4.jpg" alt="properties">
                          </a>
                      </div>
                      <div class="detail">
                          <h1 class="title">
                              <a >Well Designed Room</a>
                          </h1>
                          <div class="location">
                              <a >
                                  <i class="flaticon-pin"></i>239 ZhiChunLu St. Beijing,
                              </a>
                          </div>
                          <ul class="facilities-list clearfix">
                              <li>
                                  <i class="flaticon-bed"></i> 1 Bed
                              </li>
                              <li>
                                  <i class="flaticon-bathroom"></i> 1 Bath
                              </li>
                              <li>
                                  <i class="flaticon-air-conditioner"></i> 1 conditioner
                              </li>
                              <li>
                                  <i class="flaticon-comment"></i> 56 likes
                              </li>
                          </ul>
                      </div>
                  </div>
              </div>
              <div class="col-lg-4 col-md-6">
                  <div class="property-box">
                      <div class="property-thumbnail">
                          <a  class="property-img">
                              <div class="tag">Featured</div>
                              <div class="price-box"><span>RMB1900.00</span> month</div>
                              <img class="d-block w-100" src="../resources/home/img/properties/room5.jpg" alt="properties">
                          </a>
                      </div>
                      <div class="detail">
                          <h1 class="title">
                              <a >Shared Room</a>
                          </h1>
                          <div class="location">
                              <a >
                                  <i class="flaticon-pin"></i>123 NanSanJie St. Beijing,
                              </a>
                          </div>
                          <ul class="facilities-list clearfix">
                              <li>
                                  <i class="flaticon-bed"></i> 1 Bed
                              </li>
                              <li>
                                  <i class="flaticon-bathroom"></i> 1 Bath
                              </li>
                              <li>
                                  <i class="flaticon-air-conditioner"></i> 1 conditioner
                              </li>
                              <li>
                                  <i class="flaticon-comment"></i> 1780 likes
                              </li>
                          </ul>
                      </div>
                  </div>
              </div>
              <div class="col-lg-4 col-md-6">
                  <div class="property-box">
                      <div class="property-thumbnail">
                          <a  class="property-img">
                              <div class="tag">Featured</div>
                              <div class="price-box"><span>RMB2300.00</span> month</div>
                              <img class="d-block w-100" src="../resources/home/img/properties/room6.jpg" alt="properties">
                          </a>
                      </div>
                      <div class="detail">
                          <h1 class="title">
                              <a >Good Viewed Room</a>
                          </h1>
                          <div class="location">
                              <a >
                                  <i class="flaticon-pin"></i>123 WuDaoKou St. Tampa City,
                              </a>
                          </div>
                          <ul class="facilities-list clearfix">
                              <li>
                                  <i class="flaticon-bed"></i> 1 Beds
                              </li>
                              <li>
                                  <i class="flaticon-bathroom"></i> 1 Bath
                              </li>
                              <li>
                                  <i class="flaticon-air-conditioner"></i> 1 conditioner
                              </li>
                              <li>
                                  <i class="flaticon-comment"></i> 34 likes
                              </li>
                          </ul>
                      </div>
                  </div>
              </div>
          </div>
    </div>
</div>
<div class="container">
	<div class="main-title">
		<a href="room_list"><h3>More properties...</h3></a>
    </div>
</div>
<div class="intro-section">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 col-md-8 col-sm-12">
				<div class="intro-text">
					<h3>Do You Have Questions ?</h3>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-12">
				<a href="contact.html" class="btn btn-md">Get in Touch</a>
			</div>
		</div>
	</div>
</div>
<%@include file="../common/footer.jsp"%>
<script src="../resources/home/js/jquery-1.11.3.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../resources/home/js/vendor/jquery-1.10.2.min.js"><\/script>')</script>
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
<script src="../resources/home/js/jquery-2.2.0.min.js"></script>
<script src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script  src="../resources/home/js/jquery.scrollUp.js"></script>
<script  src="../resources/home/js/jquery.magnific-popup.min.js"></script>
<script  src="../resources/home/js/app.js"></script>
</body>