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
                            <li><a href="index"><i class="flaticon-earth"></i> Contact Us</a></li>
                            <li><a href="feedBack"><i class="flaticon-mail"></i> Feedback</a></li>
                            <li class="active"><a href="booking"><i class="flaticon-calendar"></i> Bookings</a></li>
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
                <div class="content-area5">
                    <div class="dashboard-content">
                        <div class="dashboard-header clearfix">
                            <div class="row">
                                <div class="col-sm-12 col-md-6"><h4>Booking Lists</h4></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="dashboard-list">
                                    <h3>Latest Orders</h3>
                                    <div class="dashboard-message dashboard-table-responsive bdr clearfix ">
                                        <div class="table-responsive dashboard-table-responsive">
                                        <div id="contain">
                                            <table class="table mb-0">
                                                <thead>
                                                <tr>
                                                    <th>Photo</th>
                                                    <th>RoomType</th>
                                                    <th>Username</th>
                                                    <th>OrderId</th>                                                                                                        
                                                    <th>ArrivedDate</th>
                                                    <th>LeaveDate</th>
                                                    <th>Status</th>
                                                    <th>Remark</th>
                                                </tr>
                                                </thead>
                                                <tbody>
               										<c:forEach items="${bookOrderList }" var="bookOrder">
               											<tr>
															<c:forEach items="${roomTypeList }" var="roomType">
																<c:if test="${roomType.id == bookOrder.roomTypeId }">
																	<td><img src="${roomType.photo }" width="100px"></td>
																	<td>${roomType.name }</td>
																</c:if>
															</c:forEach>
															<td>${account.realName }</td>
															<td>${bookOrder.id }</td>
															<td>${bookOrder.arriveDate }</td>
															<td>${bookOrder.leaveDate }</td>																														
																													
															<td>
																<c:if test="${bookOrder.status == 0 }">
			          												<span class="badge badge-warning">Pending</span>
			          											</c:if>
			          											<c:if test="${bookOrder.status == 1 }">
			          												<c:if test="${bookOrder.contract == 1 }">
			          													<span class="badge badge-success" title="点击下载合同"><a href="download?filename=asposeTemplate1.docx">Approved</a></span>
			          												</c:if>
			          												<c:if test="${bookOrder.contract == 0 }">
			          													<span class="badge badge-success">Approved</span>
			          												</c:if>
			          											</c:if>
			          											<c:if test="${bookOrder.status == 2 }">
			          												<span class="badge badge-danger">Disapproved</span>
			          											</c:if>
															</td>
															<td>${bookOrder.remark }</td>
               											</tr>
               										</c:forEach>                                                
                                                </tbody>
                                            </table>
                                        </div>
                                        </div>
                                    </div>
                                </div>
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