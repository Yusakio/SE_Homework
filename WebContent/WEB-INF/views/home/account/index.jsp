<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/header2.jsp"%>
<body>
<div class="page_loader"></div>
<header class="main-header header-2 fixed-header">
    <div class="container-fluid">
        <nav class="navbar navbar-expand-lg navbar-light">
            <a class="navbar-brand logo pad-0" href="../index">
            	Real Home
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class="navbar-buttons ml-auto d-none d-xl-block d-lg-block">
                    <ul>
                        <li>
                            <div class="dropdown btns">
                                <a class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="../../resources/home/img/user.jpg" alt="avatar">
                                    My Account
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="index">Contact Us</a>
                                    <a class="dropdown-item" href="feedBack">Feedback</a>
                                    <a class="dropdown-item" href="booking">Bookings</a>                                    
                                    <a class="dropdown-item" href="profile">My profile</a>                                                                        
                                </div>
                            </div>
                        </li>
                        <li>
                            <a class="btn btn-theme btn-md" href="../logout">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
<div class="dashboard submit-property">
    <div class="container-fluid ">
        <div class="row">
            <div class="col-lg-3 col-md-12 col-sm-12 col-pad">
                <div class="dashboard-nav d-none d-xl-block d-lg-block">
                    <div class="dashboard-inner">
                        <h4>Main</h4>
                        <ul>
                            <li class="active"><a href="index"><i class="flaticon-earth"></i> Contact Us</a></li>
                            <li><a href="feedBack"><i class="flaticon-mail"></i> Feedback</a></li>
                            <li><a href="booking"><i class="flaticon-calendar"></i> Bookings</a></li>
                        </ul>
                        <h4>Account</h4>
                        <ul>
                            <li><a href="profile"><i class="flaticon-user"></i>My Profile</a></li>
                            <li><a href="../logout"><i class="flaticon-logout"></i>Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-12 col-sm-12 col-pad">
                <div class="content-area5 dashboard-content">
                    <div class="dashboard-header clearfix">
                        <div class="row">
                			<div class="col-md-3 col-sm-6 mrg-btn-50">
                    			<i class="flaticon-pin"></i>
                    			<p>Office Address</p>
                    			<strong>BeiHang Campus, Collage St. No.37, Beijing Haidian</strong>
                			</div>
                			<div class="col-md-3 col-sm-6 mrg-btn-50">
                    			<i class="flaticon-phone"></i>
                    			<p>Phone Number</p>
                    			<strong>+010 88888888</strong>
                			</div>
                			<div class="col-md-3 col-sm-6 mrg-btn-50">
                    			<i class="flaticon-mail"></i>
                    			<p>Email Address</p>
                    			<strong>RealHome@163.com</strong>
                			</div>
                			<div class="col-md-3 col-sm-6 mrg-btn-50">
                    			<i class="flaticon-earth"></i>
                    			<p>WeChat</p>
                    			<strong>RealHome</strong>
                			</div>                        
                        </div>
                    </div>
					<div class="contact-1 content-area-5">
    					<div class="container">
        					<!-- Main title -->
        					<div class="main-title text-center">
            					<h1>Opening Hours</h1>
            					<ul class="list-style-none">
            						<li><strong>Sunday</strong> <span class="text-red"> closed</span></li>
                					<li><strong>Monday</strong> <span> 10 AM - 8 PM</span></li>
                					<li><strong>Tuesday </strong> <span> 10 AM - 8 PM</span></li>
                					<li><strong>Wednesday </strong> <span> 10 AM - 8 PM</span></li>
                					<li><strong>Thursday </strong> <span> 10 AM - 8 PM</span></li>
                					<li><strong>Friday </strong> <span> 10 AM - 8 PM</span></li>
                					<li><strong>Saturday </strong> <span> 10 AM - 8 PM</span></li>
            					</ul>
        					</div>
    					</div>
					</div>                    
                    <p class="sub-banner-2 text-center">© 2020 Real Home Renting System  All Rights Reserved.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../../resources/home/js/jquery-1.11.3.js"></script>
<script src="../../resources/home/js/jquery-2.2.0.min.js"></script>
<script src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script  src="../../resources/home/js/jquery.scrollUp.js"></script>
<script  src="../../resources/home/js/jquery.magnific-popup.min.js"></script>
<script  src="../../resources/home/js/app.js"></script>    
</body>
</html>