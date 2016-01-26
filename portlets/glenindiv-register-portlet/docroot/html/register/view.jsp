<%@include file="/html/init.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<portlet:actionURL name="registerUser" var="registerUserURL" windowState="normal" />
<portlet:resourceURL var="resourceURL"/>

<liferay-ui:error key="all-required" message="所有选项均为必填项！" />
<liferay-ui:error key="password-not-match" message="两次密码不一致！" />
<liferay-ui:error key="vercd-not-match" message="验证码不匹配！" />

<%
	/* String verifyCode = "";
	if(request.getAttribute("verifyCode") !=null){
		verifyCode = (String) request.getAttribute("verifyCode");
	} */
%>

<body>
<!--main content start-->
  <main>
          <form action="<%= registerUserURL %>" method="POST" id="register-form">
              <span id="group-msg-block"></span>
              <div class="register-form" >
                      <div class="form-item">
                          <label  for=""><span class="register-must">*</span>用户名</label>
                          <input class="register-input" type="text" name="<portlet:namespace/>userName" id="userName" required placeholder="请输入手机号"/>
                      </div>
                      	  
                      <div class="form-item">
                      	   <label for=""><span class="register-must">*</span></label>
                      	   <input class="btn-info" type="button" value="免费获取验证码" id="vCodebutton" onclick="callServeResource()" >
                      </div>
                      
                      <div class="form-item">
                      	   <label for=""><span class="register-must">*</span>验证码</label>
                      	   <input id="reg-ver-cd-1" name="<portlet:namespace/>reg-ver-cd-1"  type="hidden"/>
                      	   <input class="register-input" id="reg-ver-cd-2" name="<portlet:namespace/>reg-ver-cd-2" type="text" maxlength="4" placeholder="请输入验证码" data-equal-to="#reg-ver-cd-1" required/>
                      </div>
                      
                      <div class="form-item">
                          <label for=""><span class="register-must">*</span>姓名</label>
                          <input class="register-input" minlength="2" maxlength="20" type="text" name="<portlet:namespace/>name" id="name" placeholder="请输入姓名" required/>
                      </div>
        
                      <div class="form-item">
                      	<label for=""><span class="register-must">*</span>性别</label>
                      	<div class="register-radios">
                              <input type="radio" name="<portlet:namespace/>gender" value="1" checked>
                                    <span>男</span>
                              <input type="radio" name="<portlet:namespace/>gender" value="0">
                                    <span>女</span>
                      	</div>
                      </div>
                      
                      <div class="form-item">
                          <label for=""><span class="register-must">*</span>请设置密码</label>
                          <input class="register-input" minlength="6" maxlength="20" id="reg-vld-pwd-1" name="<portlet:namespace/>pwd" type="password" placeholder="请输入至少6位密码" required/>
                      </div>

                      <div class="form-item">
                          <label for=""><span class="register-must">*</span>请确认密码</label>
                          <input class="register-input" id="reg-vld-pwd-2" name="<portlet:namespace/>repeat_pwd" type="password" placeholder="请与上面输入的值一致" data-equal-to="#reg-vld-pwd-1" required/>
                      </div>            

                      <div class="form-item">
                          <label for=""><span class="register-must">*</span>您的净身高</label>
                          <input class="register-input"  type="text" id="height" name="<portlet:namespace/>height" required/><span class="body">cm</span>
                       </div>
                       
                       <div class="form-item">
                          <label for=""><span class="register-must">*</span>您的净体重</label>
                          <input class="register-input"  type="text" id="weight" name="<portlet:namespace/>weight" required/><span class="body">kg</span>
                       </div>	
                       
                       <h3 class="cfm-ttl"><span class="register-must">*</span>体型确认</h3>
                       <h3 class="cfm-ttl-en">SHAPE CONFIRMATION</h3>
                       
                       <!-- Shape Confirmation for Back -->
                       <div class="cfm-items">
                       	  <h4 class="cfm-item-ttl">后背 back</h4>
                       	  <div class="cfm-item-list" id="back">
                       	  	 <div class="cfm-item" data_sj="后仰">
                       	  	 	<img src="<%= request.getContextPath()%>/images/login/back1.png" class="cfm-item-img">
                       	  	    <h3>后仰</h3>
                       	  	 </div>
                       	  	 <div class="cfm-item" data_sj="标准">
                       	  	 	<img src="<%= request.getContextPath()%>/images/login/back2.png" class="cfm-item-img">
                       	  	    <h3>标准</h3>
                       	  	 </div>
                       	  	 <div class="cfm-item" data_sj="轻微驼背">
                       	  	 	<img src="<%= request.getContextPath()%>/images/login/back3.png" class="cfm-item-img">
                       	  	    <h3>轻微驼背</h3>
                       	  	 </div>
                       	  	 <div class="cfm-item" data_sj="严重驼背">
                       	  	 	<img src="<%= request.getContextPath()%>/images/login/back4.png" class="cfm-item-img">
                       	  	    <h3>严重驼背</h3>
                       	  	 </div>
                       	  </div>
                       </div>
                       
                       <!-- Shape Confirmation for Shoulder Overlook -->
                       <div class="cfm-items">
                       	  <h4 class="cfm-item-ttl">肩膀 shoulder 俯视</h4>
                       	  <div class="cfm-item-list" id="shoulder_f">
                       	  	 <div class="cfm-item" data_sj="严重后仰">
                       	  	 	<img src="<%= request.getContextPath()%>/images/login/shoulder1.png" class="cfm-item-img">
                       	  	    <h3>严重后仰</h3>
                       	  	 </div>
                       	  	 <div class="cfm-item" data_sj="轻微后仰">
                       	  	 	<img src="<%= request.getContextPath()%>/images/login/shoulder2.png" class="cfm-item-img">
                       	  	    <h3>轻微后仰</h3>
                       	  	 </div>
                       	  	 <div class="cfm-item" data_sj="标准">
                       	  	 	<img src="<%= request.getContextPath()%>/images/login/shoulder3.png" class="cfm-item-img">
                       	  	    <h3>标准</h3>
                       	  	 </div>
                       	  	 <div class="cfm-item" data_sj="轻微前冲">
                       	  	 	<img src="<%= request.getContextPath()%>/images/login/shoulder4.png" class="cfm-item-img">
                       	  	    <h3>轻微前冲</h3>
                       	  	 </div>
                       	  	 <div class="cfm-item" data_sj="严重前冲">
                       	  	 	<img src="<%= request.getContextPath()%>/images/login/shoulder4.png" class="cfm-item-img">
                       	  	    <h3>严重前冲</h3>
                       	  	 </div>
                       	  </div>
                       </div>
                       
                       <!-- Shape Confirmation for Shoulder Straight Look -->
                       <div class="cfm-items">
                       	  <h4 class="cfm-item-ttl">肩膀 shoulder 平视</h4>
                       	  <div class="cfm-item-list" id="shoulder_p">
                       	  	 <div class="cfm-item" data_sj="标准">
                       	  	 	<img src="<%= request.getContextPath()%>/images/login/shoulder6.png" class="cfm-item-img">
                       	  	    <h3>标准</h3>
                       	  	 </div>
                       	  	 <div class="cfm-item" data_sj="平肩">
                       	  	 	<img src="<%= request.getContextPath()%>/images/login/shoulder7.png" class="cfm-item-img">
                       	  	    <h3>平肩</h3>
                       	  	 </div>
                       	  	 <div class="cfm-item" data_sj="溜肩">
                       	  	 	<img src="<%= request.getContextPath()%>/images/login/shoulder8.png" class="cfm-item-img">
                       	  	    <h3>溜肩</h3>
                       	  	 </div>
                       	  </div>
                       </div>
                       
                       <!-- Shape Confirmation for Belly -->
                       <div class="cfm-items" style="margin-bottom: 100px;">
                       	  <h4 class="cfm-item-ttl">肚子 belly</h4>
                       	  <div class="cfm-item-list" id="belly">
                       	  	 <div class="cfm-item" data_sj="标准">
                       	  	 	<img src="<%= request.getContextPath()%>/images/login/belly1.png" class="cfm-item-img">
                       	  	    <h3>标准</h3>
                       	  	 </div>
                       	  	 <div class="cfm-item" data_sj="啤酒肚">
                       	  	 	<img src="<%= request.getContextPath()%>/images/login/belly2.png" class="cfm-item-img">
                       	  	    <h3>啤酒肚</h3>
                       	  	 </div>
                       	  </div>
                       </div>
                       
                       <!-- Register Button for whole Register Page -->
					   <button class="register" type="submit" id="button">立即注册</button>
              </div>

          </form>
  </main>
</body>

<script type="text/javascript">
$(function(){
	$('.cfm-item-list .cfm-item').on('click', function(){
		$(this).addClass('active').siblings().removeClass('active');
	});
});

$("#button").click(function(event){
	var str = "";
    var res = true;
    if($("#reg-ver-cd-2").val()!=$("#reg-ver-cd-1").val()){
    	str += '输入的验证码错误哦\n';
        res = false;
    }
     if(!/^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/.test($("#userName").val())){
    	str += "输入的手机号错误哦\n";
        res = false;
    }  
    if($("#reg-vld-pwd-2").val()!=$("#reg-vld-pwd-1").val()){
    	str += '两次密码输入不一致哦\n';
        res = false;
    }
	if(!(/^[0-9]+(.[0-9]{1,3})?$/.test($("#height").val()))){
        str += '输入的身高格式错误哦\n';
        res = false;
    }
    if(!(/^[0-9]+(.[0-9]{1,3})?$/.test($("#weight").val()))){
        str += '输入的体重格式错误哦\n';
        res = false;
    } 
    if(!$("#back").find('.cfm-item.active').length || !$("#shoulder_f").find('.cfm-item.active').length || !$("#shoulder_p").find('.cfm-item.active').length || !$("#belly").find('.cfm-item.active').length){
    	str += '您还没有选择后背/肩膀俯视/肩膀平视/肚子特征';
        res = false;
    }
    if(!res){
        alert(str);
        event.preventDefault();
        return;
    }
})

var wait=60;
function time() {
	console.log(wait);
	if (wait == 0) {
		$('#vCodebutton').removeAttr("disabled"); 
		$('#vCodebutton').removeClass("btn-dis");
		$('#vCodebutton').addClass("btn-info");
		$('#vCodebutton').val('免费获取验证码');
		wait = 60;
	} else {
		$('#vCodebutton').attr("disabled", true);
		$('#vCodebutton').val('重新发送(' + wait + ')');
		wait--;
		setTimeout(function() {
		time()
		},
		1000)
	}
}

function callServeResource(){
    AUI().use('aui-base', 'aui-io-request', 'node', function(A){
    	var button=A.one('#vCodebutton');
    	var msgBlock=A.one('#group-msg-block');
    	var messageNode=A.one('#message');
    	//check whether message node exists before, if exists, remove it
    	if(messageNode != null){
    		messageNode.remove();
    	}
    	var messageNode = A.Node.create('<div id="message"></div>');
    	var inputUserName = A.one("#userName").get("value");
        A.io.request('<%=resourceURL.toString()%>', {
               method: 'post',
               data: {
            	   <portlet:namespace />userName: inputUserName
               },
               on : {
        	       success : function() {
        	       		var resultArray = this.get('responseData');
        	       		var data = resultArray.split("|");
        	       		messageNode.removeClass('portlet-msg-success');
        	       		messageNode.removeClass('portlet-msg-error');
        	       		messageNode.appendTo(msgBlock);
        	       		if(data[0] == 'error'){
        	       			messageNode.addClass('portlet-msg-error');
        	       			messageNode.setHTML('手机号格式不正确！');
        	    	     	messageNode.appendTo(msgBlock);
        	    	     	return false;
        	    		}else if(data[0] == 'success'){
        	    			messageNode.addClass('portlet-msg-success');
        	    			messageNode.setHTML('短信验证码已经发送到您的手机上，请注意查收');
        	    			button.replaceClass('btn-info','btn-dis');
        	    			button.attr('disabled', 'disabled');
        	    			time();	
        	    			$("#reg-ver-cd-1").val(data[1]);
        	    		}
        	       }
               }
        });
    });
}   
</script>