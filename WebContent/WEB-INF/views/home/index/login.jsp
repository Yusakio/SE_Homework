<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header1.jsp"%>
 <body>
	   <img class="d-block w-100 h-100" src="../resources/home/img/banner/login_pic.jpg" alt="banner">
	   <div class="form-content-box">
                    <div class="details">
                        <a href="index.html">
                            <img src="../resources/home/img/front.png" class="cm-logo" alt="black-logo">
                        </a>
                        <h3>Sign into your account</h3>
                        <form action="index.html" method="GET">
                        <div id="normal">
                        	<div id="nor_log">
                            <div class="form-group">
                                <input id="name" type="text" name="name" class="input-text" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <input id="password" type="password" name="upwd" class="input-text" placeholder="Password">
                            </div>
                            </div>
                            <div class="form-group">
                            	<img id="cpacha-img" src="../system/get_cpacha?vl=4&w=173&h=33&type=accountLoginCpacha" onclick="changeVcode()" class="code" style="cursor:pointer;"/>
							    <input id="vcode" type="text" name = "vcode" class="input-text" placeholder="Verify Code"/>
						    </div>
                            <div class="checkbox">
                                <a href="contact" class="link-not-important pull-right">Forgot Password</a>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                            <div class="form-group mb-0">
                                <div id="bt_login" class="btn-md button-theme btn-block" style="cursor:pointer;">Login</div>
                            </div>
                        </form>
                        <ul class="social-list clearfix">
                            <li><a href="https://weixin.qq.com/" class="facebook-bg"><i class="fa fa-weixin"></i></a></li>
                            <li><a href="https://im.qq.com/" class="twitter-bg"><i class="fa fa-qq"></i></a></li>
                            <li><a href="https://weibo.com/" class="google-bg"><i class="fa fa-weibo"></i></a></li>
                            <li><a href="http://t.qq.com/" class="linkedin-bg"><i class="fa fa-tencent-weibo"></i></a></li>
                        </ul>
                    </div>
                    <div class="footer">
                        <span>Don't have an account? <a href="reg">Register here</a></span>
                    </div>
      </div>

<%@include file="../common/footer.jsp"%>
<script src="../resources/home/js/jquery-1.11.3.js"></script>
<script>
function changeVcode(){
	$("#cpacha-img").attr("src",'../system/get_cpacha?vl=4&w=173&h=33&type=accountLoginCpacha&t=' + new Date().getTime());
}
$(document).ready(function(){
	$("#bt_login").click(function(){
		var name = $("#name").val();
		var password = $("#password").val();
		var vcode = $("#vcode").val();
		if(name == '' || password == '' || vcode == ''){
			alert('请填写完成信息再提交!');
			return;
		}
		$.ajax({
			url:'login',
			type:'post',
			dataType:'json',
			data:{name:name,password:password,vcode:vcode},
			success:function(data){
				if(data.type == 'success'){
					window.location.href = 'index';
				}else{
					alert(data.msg)				
					changeVcode();
				}
			}
		});
	})
});
</script>
 </body>
</html>
