<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../common/header3.jsp"%>
<body>
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
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="index">Contact Us</a></li>
                                    <li><a class="dropdown-item" href="feedBack">Feedback</a></li>
                                    <li><a class="dropdown-item" href="booking">Bookings</a></li>                                    
                                    <li><a class="dropdown-item" href="profile">My profile</a></li>                                                                        
                                </ul>
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
                            <li><a href="booking"><i class="flaticon-calendar"></i> Bookings</a></li>
                        </ul>
                        <h4>Account</h4>
                        <ul>
                            <li class="active"><a href="profile"><i class="flaticon-user"></i>My Profile</a></li>
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
                                <div class="col-sm-12 col-md-6"><h4>My Profile</h4></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="dashboard-list">
                                    <h3 class="heading">Are You Sure to Edit Your Data?</h3>
      										<h4>
      											<ul class="tabs">
        										<li><a href="#info" >Yes &nbsp;<input type="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;(You have to <font color="red">Tick Here</font> before you edit your data.)</a></li>
      											</ul>
      										</h4>        							                                 
                                    <div class="dashboard-message contact-2">
                                        <div action="#" method="GET" enctype="multipart/form-data">
                                            <div class="row">
    										<div id="contain">
      										<div class="content">   										
        										<div class="info">
        										<form id="update-info-form">   										
          										<table style="border:0px;cellspacing:0px;" >
            										<tbody>
               										<tr>
                                                			<td><div class="col-lg-12">
                                                    			<div class="form-group name">
                                                        			<label>UserName</label>
                                                        			<input class="form-control" type="text" value="${account.name}" name="name" style="width:400px;max-width: 820px;">
                                                    			</div>
                                                				</div>
                                                			</td>               										
               										</tr>
			   										<tr style="border:0px;">
                                                			<td><div class="col-lg-12">
                                                    			<div class="form-group name">
                                                        			<label>RealName</label>
                                                        			<input class="form-control" type="text" value="${account.realName}" name="realName" style="width:400px;max-width: 820px;">
                                                    			</div>
                                                				</div>
                                                			</td>  			   										
               										</tr>
			   										<tr>
                                                			<td><div class="col-lg-12">
                                                    			<div class="form-group name">
                                                        			<label>IDCard</label>
                                                        			<input class="form-control" type="text" value="${account.idCard}" name="idCard" style="width:400px;max-width: 820px;">
                                                    			</div>
                                                				</div>
                                                			</td>  			   										
               										</tr>
			   										<tr>
                                                			<td><div class="col-lg-12">
                                                    			<div class="form-group name">
                                                        			<label>Telephone</label>
                                                        			<input class="form-control" type="text" value="${account.mobile}" name="mobile" style="width:400px;max-width: 820px;">
                                                    			</div>
                                                				</div>
                                                			</td>  				   										
               										</tr>
			   										<tr>
                                                			<td><div class="col-lg-12">
                                                    			<div class="form-group name">
                                                        			<label>Email</label>
                                                        			<input class="form-control" type="email" value="${account.address}" name="address" style="width:400px;max-width: 820px;">
                                                    			</div>
                                                				</div>
                                                			</td>  				   										
               										</tr>
			   										<tr>
                                                			<td><div class="col-lg-12">
                                                    			<div class="form-group subject">                                                
                                                    				<label></label>
                                                    			</div>                                                
                                                    			<div class="send-btn">
                                                        			<button type="button" class="btn btn-md button-theme" id="update-info-btn">Submit</button>
                                                    			</div>
                                                				</div>
                                                			</td>			   										
															<td style="border:0px;"></td><td style="float:left;width:400px;max-width: 820px;border:0px;"></td>
               										</tr>
            										</tbody>
          										</table>
          										</form>
          										<p> </p>
                                    			<h3 >Change Password</h3>
                                    			<p> </p>          										
          										<table style="border:0px;cellspacing:0px;">
            									<tbody>
               										<tr>
                                                			<td><div class="col-lg-12">
                                                    			<div class="form-group name">
                                                        			<label>Current Password</label>
                                                        			<input type="password" class="form-control" id="old-password" style="width:400px;max-width: 820px;">
                                                    			</div>
                                                				</div>
                                                			</td>
               										</tr>
			   										<tr style="border:0px;">
                                                			<td><div class="col-lg-12">
                                                    			<div class="form-group email">
                                                        			<label>New Password</label>
                                                        			<input type="password" class="form-control" id="new-password" style="width:400px;max-width: 820px;">
                                                    			</div>
                                                				</div>
                                                			</td>
               										</tr>
			   										<tr>
                                                			<td><div class="col-lg-12">
                                                    			<div class="form-group subject">
                                                        			<label>Confirm New Password</label>
                                                        			<input type="password" class="form-control" id="renew-password" style="width:400px;max-width: 820px;">
                                                    			</div>
                                                				</div>
                                                			</td>
               										</tr>
			   										<tr>
                                                			<td><div class="col-lg-12">
                                                    			<div class="form-group subject">                                                
                                                    				<label></label>
                                                    			</div>                                                
                                                    			<div class="send-btn">
                                                        			<button type="button" class="btn btn-md button-theme" id="update-password-btn">Change Password</button>
                                                    			</div>
                                                				</div>
                                                			</td>			   
															<td style="float:left;margin-top:15px;width:400px;max-width: 820px;border:0px;"></td>
               										</tr>
            									</tbody>
          										</table>
        										</div>
      										</div>
    										</div>                                            
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="dashboard-list">
                                    <h3 class="heading">Recommendations</h3>
                                    <div class="dashboard-message contact-2">
                                        <form action="#" method="GET" enctype="multipart/form-data">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <img src="../../resources/home/img/food.jpg" width="500px">
                                                    <div class="form-group name">
                                                    <p></p>
                                                        <p><strong>&nbsp;&nbsp;If it is convenient, you can hang out at night around our apartment, and you will find a lot of delicious food.</strong></p>
                                                    </div>
                                                </div>
                                                <p></p>
                                                <div class="col-lg-12">
                                                    <img src="../../resources/home/img/house.jpeg" width="500px">
                                                    <div class="form-group name">
                                                    <p></p>
                                                        <p><strong>&nbsp;&nbsp;Choosing our apartment, you will feel like home. Imagine the sunshine and the birds, it is a beautiful picture.</strong></p>
                                                    </div>
                                                </div>                                                
                                            </div>
                                        </form>
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
    <div id="c_footer"></div>
    <script src="../../resources/home/js/jquery-1.11.3.js"></script>
 <script>
	$(".tabs").on("click","li a",function(){
    $(this).addClass("active").parents().siblings().children(".active").removeClass("active");
    var href=$(this).attr("href");
    href=href.slice(1);
    var $div=$("div.content>div."+href);
     $div.show().siblings().hide();
    //修改个人信息
     $("#update-info-btn").click(function(){
    	$.ajax({
    		url:'update_info',
    		type:'post',
    		dataType:'json',
    		data:$("#update-info-form").serialize(),
    		success:function(data){
    			alert(data.msg);
    		}
    	});
    });
    //修改密码
    $("#update-password-btn").click(function(){
    	var oldPassword = $("#old-password").val();
    	var newPassword = $("#new-password").val();
    	var renewPassword = $("#renew-password").val();
    	if(oldPassword == ''){
    		alert('请填写原密码！');
    		return;
    	}
    	if(newPassword == ''){
    		alert('请填写新密码！');
    		return;
    	}
    	if(newPassword != renewPassword){
    		alert('两次密码不一致！');
    		return;
    	}
    	$.ajax({
    		url:'update_pwd',
    		type:'post',
    		dataType:'json',
    		data:{oldPassword:oldPassword,newPassword:newPassword},
    		success:function(data){
    			alert(data.msg)
				window.location.href = 'index';    			
    		}
    	});
    });
});
	
</script>
<script src="../../resources/home/js/jquery-2.2.0.min.js"></script>
<script src="http://cdn.bootstrapmb.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script  src="../../resources/home/js/jquery.scrollUp.js"></script>
<script  src="../../resources/home/js/jquery.magnific-popup.min.js"></script>
<script  src="../../resources/home/js/app.js"></script>  
</body>
</html>