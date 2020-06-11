<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="All Rights Reserved, Copyright (C) 2020, RealHome." />
<title>Background System of Real Home</title>
<link rel="stylesheet" type="text/css" href="../resources/admin/easyui/easyui/1.3.4/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="../resources/admin/easyui/css/wu.css" />
<link rel="stylesheet" type="text/css" href="../resources/admin/easyui/css/icon.css" />
<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet" type="text/css" />
<link href="../resources/admin/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="../resources/admin/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="../resources/admin/css/ionicons.css" rel="stylesheet" type="text/css">
<link href="../resources/admin/css/simple-line-icons.css" rel="stylesheet" type="text/css">
<link href="../resources/admin/css/jquery.mCustomScrollbar.css" rel="stylesheet">
<link href="../resources/admin/css/weather-icons.min.css" rel="stylesheet">
<link rel="stylesheet" href="../resources/admin/js/index/morris-chart/morris.css">
<link href="../resources/admin/css/style.css" rel="stylesheet">
<link href="../resources/admin/css/responsive.css" rel="stylesheet">
<script type="text/javascript" src="../resources/admin/easyui/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../resources/admin/easyui/easyui/1.3.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../resources/admin/easyui/easyui/1.3.4/locale/easyui-lang-zh_CN.js"></script>
<script>
    var pc; 
    $.parser.onComplete = function () {
        if (pc) clearTimeout(pc);
        pc = setTimeout(closes, 1000);
    } 

    function closes() {
    	$('#loading').fadeOut('normal', function () {
            $(this).remove();
        });
    }
</script>
<link rel="shortcut icon" href="../resources/home/img/R.png" type="image/x-icon" >
</head>
<body>

<div class="wrapper">
	<header class="main-header">
		<div class="container_header">
			<div class="logo d-flex align-items-center">
				<a href="../home/index" target="_blank"> <span class="logo-default"> <img src="../resources/home/img/logo.png" alt=""> </span> </a>
			</div>
			<div class="right_detail">
				<div class="row d-flex align-items-center min-h pos-md-r">
					<div class="col-xl-5 col-3 search_col "></div>
					<div class="col-xl-7 col-9 d-flex justify-content-end">
						<div class="right_bar_top d-flex align-items-center">
							<div class="dropdown">
								<p>Welcome, <strong class="easyui-tooltip">${role.name}:</strong></p>
							</div>
							<div class="dropdown dropdown-inbox">
								<p><strong class="easyui-tooltip">${admin.username}</strong></p>
							</div>
							<div class="dropdown dropdown-user">
								<img class="img-circle pro_pic" src="${admin.photo}" alt="" width="50px"> </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="container_full">
		<div class="side_bar scroll_auto">
        	<div class="user-panel">
				<div class="user_image">
					<img src="${admin.photo}" class="img-circle mCS_img_loaded" alt="User Image">
				</div>
				<div class="info">
				<p>
					${admin.username}
				</p>
				<i class="fa fa-circle text-success"></i> Online</a>
				</div>
			</div>
			<ul id="dc_accordion" class="sidebar-menu tree">
				<c:if test="${role.id == 1}">
					<li class="menu_sub">
						<a href="#"> <i class="fa fa-home"></i> <span>RoomType </span> 
						<span class="arrow"></span> </a>
						<ul class="down_menu">
							<li>
								<a href="../admin/room_type/list">RoomTypeList</a>
							</li>
						</ul>
					</li>
					<li class="menu_sub">
						<a href="#"> <i class="fa fa-user"></i> <span>User </span> 
						<span class="arrow"></span> </a>
						<ul class="down_menu">
							<li>
								<a href="../admin/user/list">UserList</a>
							</li>
						</ul>
					</li>
					<li class="menu_sub">
						<a href="#"> <i class="fa fa-id-card"></i> <span>Account </span> 
						<span class="arrow"></span> </a>
						<ul class="down_menu">
							<li>
								<a href="../admin/account/list">AccountList</a>
							</li>
						</ul>
					</li>						
					<li class="menu_sub">
						<a href="#"> <i class="fa fa-address-book"></i> <span>Role </span> 
						<span class="arrow"></span> </a>
						<ul class="down_menu">
							<li>
								<a href="../admin/role/list">RoleList</a>
							</li>
						</ul>
					</li>
					<li class="menu_sub">
						<a href="#"> <i class="fa fa-shopping-cart"></i> <span>Booking </span> 
						<span class="arrow"></span> </a>
						<ul class="down_menu">
							<li>
								<a href="../admin/book_order/list">Book Order</a>
							</li>
						</ul>
					</li>
					<li class="menu_sub">
						<a href="#"> <i class="fa fa-folder-open"></i> <span>Log </span> 
						<span class="arrow"></span> </a>
						<ul class="down_menu">
							<li>
								<a href="../admin/log/list">Log Content</a>
							</li>
						</ul>
					</li>																			
				</c:if>
					<li class="menu_sub">
						<a href="#"> <i class="fa fa-envelope"></i> <span>FeedBack </span> 
						<span class="arrow"></span> </a>
						<ul class="down_menu">
							<li>
								<a href="../admin/feedback/list">FeedBackList</a>
							</li>
						</ul>
					</li>
					<li class="menu_sub">
						<a href="#"> <i class="fa fa-key"></i> <span>Edit Password </span> 
						<span class="arrow"></span> </a>
						<ul class="down_menu">
							<li>
								<a href="edit_password">Edit Password</a>
							</li>
						</ul>
					</li>					
					<li class="menu_sub">
						<a href="#"> <i class="fa fa-sign-out"></i> <span>Log Out </span> 
						<span class="arrow"></span> </a>
						<ul class="down_menu">
							<li>
								<a href="login">Logout</a>
							</li>
						</ul>
					</li>																																
			</ul>
		</div>
		<div class="content_wrapper">
			<div class="container-fluid">
				<div class="page-heading">
					<div class="row d-flex align-items-center">
						<div class="col-md-6">
							<div class="page-breadcrumb">
								<h1>Welcome</h1>
							</div>
						</div>
					</div>
				</div>
				<section class="chart_section">
					<div title="Welcome to administration system" style="padding:20px;overflow:hidden; color:black; " >
						<p style="font-size: 50px; line-height: 60px; height: 60px;">${admin.username}</p>
						<p style="font-size: 25px; line-height: 30px; height: 30px;">Welcome to Background System of Management</p>
						<p>-------------------------------------------------------------------------------------------</p>
						<p><img src="../resources/home/img/admin.jpeg" width="550px"></p>
					</div>
				</section>						
			</div>
		</div>
	</div>
<footer class="footer ptb-20">
	<div class="row">
		<div class="col-md-12 text-center">
			<div class="copy_right">
			<p>
				2020 © Administration System By Real Home
			</p>
			</div>
			<a id="back-to-top" href="#"> <i class="ion-android-arrow-up"></i> </a>
		</div>
	</div>
</footer>
<script type="text/javascript">
		$(function(){
			$('.wu-side-tree a').bind("click",function(){
				var title = $(this).text();
				var url = $(this).attr('data-link');
				var iconCls = $(this).attr('data-icon');
				var iframe = $(this).attr('iframe')==1?true:false;
				addTab(title,url,iconCls,iframe);
			});	
		})
</script>
</div>
<script type="text/javascript" src="../resources/admin/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="../resources/admin/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="../resources/admin/js/custom.js" type="text/javascript"></script>
</body>
</html>