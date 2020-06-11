<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header1.jsp"%>
<body>
<div class="page_loader"></div>
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
<div class="services content-area">
    <div class="container">
        <div class="main-title text-center">
            <h1>Property Services</h1>
            <p>We are equipped with all the furniture and equipments that you will need.</p>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="service-info-2">
                    <div class="icon">
                        <i class="flaticon-air-conditioner"></i>
                    </div>
                    <div class="detail">
                        <h3>Air conditioning</h3>
                        <p>You can set the temperature according to your feeling.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="service-info-2">
                    <div class="icon">
                        <i class="flaticon-password"></i>
                    </div>
                    <div class="detail">
                        <h3>Security</h3>
                        <p>Each room is equipped with a a coded lock.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="service-info-2">
                    <div class="icon">
                        <i class="flaticon-sale"></i>
                    </div>
                    <div class="detail">
                        <h3>Commercial</h3>
                        <p>There are many shopping malls, restaurants around our apartment.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="service-info-2">
                    <div class="icon">
                        <i class="flaticon-maid"></i>
                    </div>
                    <div class="detail">
                        <h3>Apartments Clean</h3>
                        <p>We will have someone cleaning your room at 10 p.m. every day.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="service-info-2">
                    <div class="icon">
                        <i class="flaticon-gym"></i>
                    </div>
                    <div class="detail">
                        <h3>Gym</h3>
                        <p>Some equipments are offered to every room.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
                <div class="service-info-2">
                    <div class="icon">
                        <i class="flaticon-clock"></i>
                    </div>
                    <div class="detail">
                        <h3>Alarm</h3>
                        <p>We can offer a wake-up call.</p>
                    </div>
                </div>
            </div>
        </div>
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
<script src="../resources/home/js/jquery-2.2.0.min.js"></script>
<script src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script  src="../resources/home/js/jquery.scrollUp.js"></script>
<script  src="../resources/home/js/jquery.magnific-popup.min.js"></script>
<script  src="../resources/home/js/app.js"></script>
</body>
</html>