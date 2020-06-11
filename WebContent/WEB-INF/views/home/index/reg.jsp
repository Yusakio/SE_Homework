<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header1.jsp"%>
<body>
	<img class="d-block w-100 h-100" src="../resources/home/img/banner/Reg_pic.jpg" alt="banner">
 	<div id="reg">
    <form id="user_info">
    <div class="form-content-box">
    	<div class="details">
        	<a href="index.html">
            	<img src="../resources/home/img/front.png" class="cm-logo" alt="black-logo">
            </a>
            <h3>Create an account</h3>
            <div id="reg">
            <form action="reg" method="GET" id="user_info">
      			<div class="form-group">
                <input required type="text" id="uname" name="name" class="input-text" placeholder="UserName">
                <span class="msg-default">User name length should be between 3 to 9</span>
                </div>
                <div class="form-group">
                <input type="password" id="upwd" name="password" class="input-text" placeholder="Password">
                	<span class="msg-default hidden">Password length should be between 6 to 12</span>
                </div>
                <div class="form-group">
                	<input type="password" id="upwd2" name="confirm_Password" class="input-text" placeholder="Confirm Password">
                	<span class="msg-default hidden">Password length should be between 6 to 12</span>
                </div>
                <div class="form-group">
                    <input required type="tel" id="uphone" name="mobile" class="input-text" placeholder="Telephone" />
                    <span class="msg-default hidden">Please enter a valid mobile phone number</span>
                </div>
                <div class="form-group mb-0">
                    <button type="button" id="btn_reg" class="btn-md button-theme btn-block" style="cursor:pointer;">Sign up</button>
                </div>
            </form>
            </div>
            <ul class="social-list clearfix">
            	<li><a href="https://weixin.qq.com/" class="facebook-bg"><i class="fa fa-weixin"></i></a></li>
                 <li><a href="https://im.qq.com/" class="twitter-bg"><i class="fa fa-qq"></i></a></li>
                 <li><a href="https://weibo.com/" class="google-bg"><i class="fa fa-weibo"></i></a></li>
                 <li><a href="http://t.qq.com/" class="linkedin-bg"><i class="fa fa-tencent-weibo"></i></a></li>
            </ul>
    	</div>
    	<div class="footer">
    		<span>Already a member? <a href="login.html">Login here</a></span>
    	</div>
    </div>
    </form>
	</div>
   <%@include file="../common/footer.jsp"%>
	  <script src="../resources/home/js/jquery-1.11.3.js"></script>
<script>
/*1.对用户名进行验证*/
var login=0;
uname.onblur = function(){
  var val=this.value;
  if(this.validity.valueMissing){
    this.nextElementSibling.innerHTML = 'User name cannot be empty';
    this.nextElementSibling.className = 'msg-error';
    login=0;
    this.setCustomValidity('User name cannot be empty');
  }else if(this.validity.tooShort){
    this.nextElementSibling.innerHTML = 'User name may not be less than 3 digits';
    this.nextElementSibling.className = 'msg-error';
    login=0;
    this.setCustomValidity('User name may not be less than 3 digits');
  }else {
    this.nextElementSibling.innerHTML = 'Username format is correct';
    this.nextElementSibling.className = 'msg-success';
    login=1;
    this.setCustomValidity('');
  }

}


//2.对密码进行验证
upwd.onfocus = function(){
  this.nextElementSibling.innerHTML = 'Password for at least six digits or characters';
  this.nextElementSibling.className = 'msg-default';
  login=0;
}
upwd.onblur = function(){
  if(upwd.value == '' || upwd.value.length < 6){
    this.nextElementSibling.innerHTML = 'Password for at least six digits or characters';
	  this.nextElementSibling.className = 'msg-default';
    login=0;
  }else{
		this.nextElementSibling.innerHTML = 'Valid';
		this.nextElementSibling.className = 'msg-success';
		login=1;
		this.setCustomValidity('');
	}
    
}

uphone.onblur = function(){
	var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
  if(this.validity.valueMissing){
    this.nextElementSibling.innerHTML = 'Teleohone Number should not be empty';
    this.nextElementSibling.className = 'msg-error';
    login=0;
    this.setCustomValidity('Teleohone Number should not be empty');
  }else if(this.validity.typeMismatch){
    this.nextElementSibling.innerHTML = 'Telephone Format is illegal';
    this.nextElementSibling.className = 'msg-error';
    login=0;
    this.setCustomValidity('Telephone Format is illegal');
  }else if(!myreg.test(uphone.value)){
		this.nextElementSibling.innerHTML = 'Telephone Format is illegal';
    this.nextElementSibling.className = 'msg-error';
    login=0;
    this.setCustomValidity('Telephone Format is illegal');
	}
	else {
    this.nextElementSibling.innerHTML = 'Valid';
    this.nextElementSibling.className = 'msg-success';
    login=1;
    this.setCustomValidity('');
  }
}
uphone.onfocus = function(){
  this.nextElementSibling.innerHTML = 'Please enter a valid telephone number';
  this.nextElementSibling.className = 'msg-default';
  login=0;
}
//确认密码
upwd2.onblur=function() {
  if (upwd2.value != upwd.value) {
    this.nextElementSibling.innerHTML = 'Password should be the same';
    login=0;
    this.nextElementSibling.className = 'msg-error';
  } else if (upwd2.value == upwd.value) {
    this.nextElementSibling.innerHTML = 'Accepted';
    this.nextElementSibling.className = 'msg-success';
    login=1;
  }
}
$('#btn_reg').click(function(){
  //表单序列化，获得所有的用户输入
  if (upwd2.value != upwd.value){
  	return;
  }
  var data = $('#user_info').serialize();

  //异步提交请求数据
  $.ajax({
    type: 'POST',
    dataType:'json',
    url: 'reg',
    data: data,
    success: function(result){
      //console.log(result);
      if(result.type=='success'){
        alert('Signup Success.');
        location.href='login';
      }else {
        alert(result.msg)
      }
    }
  });
})

/*功能点2：轮播*/
var pic = {
intr: function () {
  var i = 1;
  var str1 = $("#trigger img").attr("src");
  var str = str1.toString();
  var timer = setInterval(function () {
    i++;
    if (i > 3) {
      i = 1;
    }
    str = str.replace(/[1-3]/, i);
    $("#trigger img").attr("src", str);
  }, 2000);
}
}
pic.intr();
</script>	

</body>
</html>