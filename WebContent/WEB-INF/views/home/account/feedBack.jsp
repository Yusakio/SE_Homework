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
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-md-12 col-sm-12 col-pad">
                <div class="dashboard-nav d-none d-xl-block d-lg-block">
                    <div class="dashboard-inner">
                        <h4>Main</h4>
                        <ul>
                            <li><a href="index"><i class="flaticon-earth"></i> Contact Us</a></li>
                            <li class="active"><a href="feedBack"><i class="flaticon-mail"></i> Feedback</a></li>
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
                            <div class="col-sm-12 col-md-6"><h4>Submit FeedBack</h4></div>
                        </div>
                    </div>                    
                    <div class="submit-address dashboard-list">
                    	<h4 class="bg-grea-3">Comments List</h4>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="dashboard-list">
                                    <div class="dashboard-message dashboard-table-responsive bdr clearfix ">
                                        <div class="table-responsive dashboard-table-responsive">
                                        <div >
                                            <table class="table mb-0" id="pro_list">
                                                <thead>
                                                <tr>
                                                    <th>Type</th>
                                                    <th>Content</th>
                                                    <th>CreateTime</th>
                                                    <th>ReplyTime</th>                                                                                                        
                                                    <th>Reply</th>
                                                </tr>
                                                </thead>
                                                <tbody>
               										<c:forEach items="${feedBackList }" var="FeedBack">
               											<tr>
															<c:if test="${FeedBack.feedType == 0 }">
																<td><span class="badge badge-danger">Complaint</span></td>
															</c:if>
															<c:if test="${FeedBack.feedType == 1 }">
																<td><span class="badge badge-warning">Repairs</span></td>
															</c:if>
															<c:if test="${FeedBack.feedType == 2 }">
																<td><span class="badge badge-success">Praise</span></td>
															</c:if>
															<td>${FeedBack.text }</td>
															<td>${FeedBack.createTime }</td>
															<c:if test="${FeedBack.status == 0 }">
																<td>No reply. Please wait.</td>
															</c:if>
															<c:if test="${FeedBack.status == 1 }">
																<td>${FeedBack.handleTime }</td>
															</c:if>
															<c:if test="${FeedBack.status == 0 }">
																<td>No reply. Please wait.</td>
															</c:if>
															<c:if test="${FeedBack.status == 1 }">
																<td>${FeedBack.feedback }</td>
															</c:if>
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
                        <form method="POST", action="addFeedBack">
                            <h4 class="bg-grea-3">Options</h4>                        
                            <div class="row pad-2">
                                <div class="col-lg-3 col-md-4 col-sm-6">
                                    <input type="radio" name="feedBackType" value="0" >
                                        <span class="custom-control-description">Complaint</span>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6">
                                    <input type="radio" name="feedBackType" value="1">
                                        <span class="custom-control-description">Repairs</span>
                                </div>
                                <div class="col-lg-3 col-md-4 col-sm-6">
                                    <input type="radio" name="feedBackType" value="2">
                                        <span class="custom-control-description">Praise</span>
                                </div>
                            </div>                        
                            <h4 class="bg-grea-3">Detailed Information</h4>
                            <div class="row pad-20">
                                <div class="col-lg-12">
                                    <textarea id="story" class="input-text" name="story" placeholder="If you want to add feedback to our work (after your problem is solved), please add the worker's number and your name."></textarea>
                                </div>
                            </div>
                            <h4 class="bg-grea-3">Upload Photos</h4>
                            <div class="row pad-20">
                                <div class="col-lg-12">
                                    <div id="myDropZone" class="dropzone dropzone-design">
                                        <div class="dz-default dz-message" >
                                        <img id="preview"  src="/Project/resources/admin/images/photograph.jpg" width="100px">
                                        <a onclick="uploadPhoto()">Upload</a>
                                        <span><input id="photo-file"  type="file" style="display:none;" onchange="upload()"></span>
                                        <input type="text" id="edit-photo" name="photo" name="photo" readonly="readonly" />
                                        </div>
                                    </div>
                                </div>
                            </div>                            
                            <div class="row pad-20">
                                <div class="col-lg-4 col-md-12 col-sm-12">
                                    <input type="submit" class="btn btn-md button-theme" value="Submit FeedBack">
                                </div>
                            </div>                            
                        </form>
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
<script type="text/javascript">
function upload(){
	if($("#photo-file").val() == '')return;
	var formData = new FormData();
	formData.append('photo',document.getElementById('photo-file').files[0]);
	$.ajax({
		url:'upload_photo',
		type:'post',
		data:formData,
		contentType:false,
		processData:false,
		success:function(data){
			if(data.type == 'success'){
				//alert(data.filepath);
				$("#edit-photo").val(data.filepath);
				$("#preview").attr('src',data.filepath);
			}else{
				$.messager.alert("消息提醒",data.msg,"warning");
			}
		},
		error:function(data){
			$.messager.alert("消息提醒","上传失败!","warning");
		}
	});
}

function uploadPhoto(){
	$("#photo-file").click();
}	
</script>
</body>
</html>