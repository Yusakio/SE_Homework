<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header2.jsp"%>
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
            <a class="navbar-brand company-logo" href="../index">
                <img src="../../resources/home/img/logo.png" alt="logo">
            </a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav header-ml">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="../room_list" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Properties
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="../room_list.html">Properties List</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Pages</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <li><a class="dropdown-item" href="../about">About</a></li>
                            <li><a class="dropdown-item" href="../service">Services</a></li>
                            <li><a class="dropdown-item" href="../contact">Contact</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink7" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            My Account
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        	<c:if test="${account == null }">
                            <li><a class="dropdown-item" href="../login">Login</a></li>
                            <li><a class="dropdown-item" href="../reg">Register</a></li>
                            <li><a class="dropdown-item" href="../contact">Contact Us</a></li>                            
                            </c:if>
                            <c:if test="${account != null }">
                            <li><a class="dropdown-item" href="index">Account Center</a></li>
                            <li><a class="dropdown-item" href="feedBack">Feedback</a></li>                                                             
                            <li><a class="dropdown-item" href="profile">My Profile</a></li>
                            <li><a class="dropdown-item" href="booking">Bookings</a></li>
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
                        <a class="nav-link" href="index">
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
<div class="properties-details-page content-area-6">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-12 col-xs-12">
                <div class="properties-details-section">
                    <div id="propertiesDetailsSlider" class="carousel properties-details-sliders slide mb-40">
                        <div class="carousel-inner">
                            <div class="active item carousel-item" data-slide-number="0">
                                <img src="${roomType.photo }" class="img-fluid" alt="slider-properties" width="750px">
                            </div>
                        </div>                    
                        <div class="heading-properties-2">
                            <h3>Relaxing Apartment</h3>
                            <div class="price-location"><span class="property-price">￥${roomType.price } /Day</span>
                            <span class="rent">For Sale</span>
                            <font color="white"><i class="flaticon-bed"></i> ${roomType.bedNum } Beds</font>
                            <font color="white"><i class="flaticon-user"></i> ${roomType.liveNum } Peoples</font>
                            <font color="white"><i class="flaticon-bathroom"></i> 1 Baths</font>
                            <font color="white"><i class="flaticon-ui"></i> 
                            <c:if test="${roomType.status == 0 }">
          						Unavailable
          					</c:if>
          					<c:if test="${roomType.status == 1 }">
          						Available
          					</c:if>                             
                            </font>                                                                                       
                            </div>
                        </div>
                    </div>
                    <div class="tabbing tabbing-box mb-40">
                        <div class="tab-content" id="carTabContent">
                            <div class="tab-pane fade active show" id="one" role="tabpanel" aria-labelledby="one-tab">
                                <div class="properties-description mb-50">
                                    <h3 class="heading-2">
                                        Description
                                    </h3>
                                    <p>What kind of house type is a good one?<br>
Often Buyers ask: what is a good house type? Is not the hot model must be a good model? In fact, pay more attention to the real estate market will find that: a good house type is not necessarily a hot selling house type, and a good house type is not necessarily a good house type. After all, the quality of a real estate sales is not only affected by the house type, but also by many other factors. Therefore, in the evaluation of a house type, we should exclude the influence of project sales and analyze its advantages and disadvantages from an objective and scientific perspective. So, what is the standard of good house type? To be sure: only on the basis of humanized design, and for a specific project refers to a certain category of consumers, the customized house type is the most suitable for consumers, is a good house type. On the basis of this understanding, we put forward four characteristics of good house type.</p>
                                    <p><br/>
What is the standard for a good house type? <br>                                 
◆ The layout of the plane space is reasonable, and the functional division is in line with people's life trajectory.<br>
◆ Under the determination of area standard, the scale of each room is appropriate.<br>
◆ After the total area of the house type is increased, the functional areas should also be enlarged accordingly for multi space design.<br>
◆ A good house type is not necessarily one recognized by the market.<br>
◆ Small high-rise (11-12 floors) towers or plank buildings are very popular in Beijing. This form is not high, investment and construction time are short, and the environment is good, especially the floor building. The ventilation and orientation are good, and the size of the house is flexible.<br><br>
The house design should be done in detail, and each part should be done well. But a good house type is not equal to a good residential product. Residential products should include: Engineering, quality, function, environmental quality, service and other four aspects. But the house design is only one aspect.<br>
									</p>
                                </div>
                            </div>
                        </div>
                    </div>                    
                    <div class="dashboard-message contact-2">
                    	<div action="#" method="GET" enctype="multipart/form-data">
                        	<div class="row">
    							<div id="section">
      								<div class="content">   										
        								<div class="info">
        									<form id="order_info"> 
        									<h3 class="heading-2">Order Form</h3>  										
          									<table style="border:0px;cellspacing:0px;" >
            								<tbody>
               								<tr>
                                            	<td><div class="col-lg-12">
                                                    <div class="form-group name">
                                                        <label>ArriveDate:</label>
                                                        <input class="datepicker" type="text" name="arriveDate" id="arriveDate">
                                                    </div>
                                                	</div>
                                                </td>               										
               								</tr>
			   								<tr style="border:0px;">
                                            	<td><div class="col-lg-12">
                                                    <div class="form-group name">
                                                        <label>LeaveDate:</label>
                                                        <input class="datepicker" type="text" name="LeaveDate" id="leaveDate">
                                                    </div>
                                                	</div>
                                                </td>  			   										
               								</tr>
			   								<tr>
                                                <td><div class="col-lg-12">
                                                    <div class="form-group name">
                                                        <label>Price:</label><span class="total">￥${roomType.price }/Day</span>
                                                    </div>
                                                	</div>
                                                </td>  			   										
               								</tr>
               								<tr>
                                                <td><div class="col-lg-12">
                                                    <div class="form-group name">
                                                        <label><font color="red" >Please Complete Your Information in Center/Profile Page, or Your Order will be REFUSED!</font></label>
                                                    </div>
                                                	</div>
                                                </td>  				   										
               								</tr>
			   								<tr>
                                                <td><div class="col-lg-12">
                                                    <div class="form-group name">
                                                        <label><font color="red">500 RMB deposit will be payed before you check in.</font></label>
                                                    </div>
                                                	</div>
                                                </td>  				   										
               								</tr>                								
			   								<tr>
                                                <td><div class="col-lg-12">
                                                    <div class="form-group name">
                                                        <label>UserName</label>
                                                        <input class="form-control" type="text" id="name" value="${account.name}" name="mobile" style="width:400px;max-width: 820px;"><span class="msg"></span>
                                                    </div>
                                                	</div>
                                                </td>  				   										
               								</tr>
			   								<tr>
                                                <td><div class="col-lg-12">
                                                    <div class="form-group name">
                                                        <label>Telephone</label>
                                                        <input class="form-control" type="text" maxlength="11" id="mobile" value="${account.mobile}" name="mobile" style="width:400px;max-width: 820px;"><span class="msg"></span>
                                                    </div>
                                                	</div>
                                                </td>  				   										
               								</tr>
			   								<tr>
                                                <td><div class="col-lg-12">
                                                    <div class="form-group name">
                                                        <label>IDCard</label>
                                                        <input class="form-control" type="text" id="idCard" value="${account.idCard}" name="idCard" style="width:400px;max-width: 820px;"><span class="msg"></span>
                                                    </div>
                                                	</div>
                                                </td>  				   										
               								</tr>
			   								<tr>
                                                <td><div class="col-lg-12">
                                                    <div class="form-group name">
                                                        <label>Remark</label>
                                                        <textarea class="form-control" id="remark" name="remark" style="width:400px;max-width: 820px;"></textarea>
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
                                                        <button type="button" class="btn btn-md button-theme" id="btn_booking">Submit</button>
                                                    </div>
                                                	</div>
                                                </td>			   										
												<td style="border:0px;"></td><td style="float:left;width:400px;max-width: 820px;border:0px;"></td>
               								</tr>
            								</tbody>
          									</table>
          									</form>
        								</div>
      								</div>
    							</div>                                            
                            </div>
                        </div>
                    </div>                    
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="sidebar-right">
                    <div class="widget search-box">
                        <h3 class="sidebar-title">Our Aim</h3>
                        <p><img src = "../../resources/home/img/Scene.jpg" width="310px"></p>                        
                        <p>Considerate Service</p>
                        <p>Comfortable Room</p>
                        <p>Agreeable Environment</p>  
                        <p>A Real Home for You</p>                                                                                                 
                        <div class="s-border"></div>
                 	</div>
                    <div class="widget social-links">
                        <h3 class="sidebar-title">Social Links</h3>
                        <ul class="social-list clearfix">
                        	<li><a href="https://weixin.qq.com/" class="facebook-bg"><i class="fa fa-weixin"></i></a></li>
                            <li><a href="https://im.qq.com/" class="twitter-bg"><i class="fa fa-qq"></i></a></li>
                            <li><a href="https://weibo.com/" class="google-bg"><i class="fa fa-weibo"></i></a></li>
                            <li><a href="http://t.qq.com/" class="linkedin-bg"><i class="fa fa-tencent-weibo"></i></a></li>
                        </ul>
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
                <a href="../contact.html" class="btn btn-md">Get in Touch</a>
            </div>
        </div>
    </div>
</div>
<%@include file="../common/footer1.jsp"%>
<script src="../../resources/home/js/jquery-1.11.3.js"></script>
<script src="../../resources/home/js/jquery-ui.min.js"></script>
</body>
<script>
  $(function() {
    $(".datepicker").datepicker({"dateFormat":"yy-mm-dd"});
    $("#btn_booking").click(function(){
    	var arriveDate = $("#arriveDate").val();
    	var leaveDate = $("#leaveDate").val();
    	if(arriveDate == '' || leaveDate == ''){
    		alert('请选择时间!');
    		return;
    	}
    	var name = $("#name").val();
    	if(name == ''){
    		$("#name").next("span.msg").text('Please input your name!');
    		return;
    	}
    	$("#name").next("span.msg").text('');
    	var mobile = $("#mobile").val();
    	if(mobile == ''){
    		$("#mobile").next("span.msg").text('Please input your mobile!');
    		return;
    	}
    	$("#mobile").next("span.msg").text('');
    	var idCard = $("#idCard").val();
    	if(idCard == ''){
    		$("#idCard").next("span.msg").text('Please input your IDCard Number!');
    		return;
    	}
    	$("#idCard").next("span.msg").text('');
    	var remark = $("#remark").val();
    	$.ajax({
    		url:'book_order',
    		type:'post',
    		dataType:'json',
    		data:{roomTypeId:'${roomType.id }',name:name,mobile:mobile,idCard:idCard,remark:remark,arriveDate:arriveDate,leaveDate:leaveDate},
    		success:function(data){
    			if(data.type == 'success'){
    				$(".malog").show();
    				setTimeout(function(){
    					window.location.href = 'index';
    				},1000)
    			}else{
    				alert(data.msg);
    			}
    		}
    	});
    })
  });
  </script>
</html>