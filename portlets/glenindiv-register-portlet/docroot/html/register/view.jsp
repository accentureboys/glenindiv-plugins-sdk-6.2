<%@include file="/html/init.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<portlet:actionURL name="registerUser" var="registerUserURL" windowState="normal" />

<liferay-ui:error key="all-required" message="所有选项均为必填项！" />
<liferay-ui:error key="password-not-match" message="两次密码不一致！" />
<liferay-ui:error key="mobile-format-not-correct" message="手机号格式不正确！" />
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
	<div class="am-g-fixed am-u-md-10 am-u-sm-centered">
          <form action="<%= registerUserURL %>" method="POST" class="am-form" id="register-form" data-am-validator>

              <div class="form-up" >
                      <div class="form-item">
                          <label class="register-label" for=""><span class="register-must">*</span>用户名</label>
                          <input class="register-input" type="text" name="<portlet:namespace/>userName" id="userName" required placeholder="请手机号"/>
                      
                      <portlet:resourceURL var="resourceURL"/>
                      
                      </div>
                      	  <label class="register-label" for=""><span class="register-must">*</span></label>
                      	  <input class="register-input" type="button" value="免费获取验证码" onclick="callServeResource()">
                      <div class="form-item">
                      	
                      </div>
                      
                      <div class="form-item">
                          <label class="register-label" for=""><span class="register-must">*</span>姓名</label>
                          <input class="register-input" minlength="2" type="text" name="<portlet:namespace/>name" required/>
                      </div>
        
                      <div class="form-item">
                      	<label class="register-label" for=""><span class="register-must">*</span>性别</label>
                      	<div class="register-radios">
                              <div class="am-radio">
                                  <label>
                                      <input type="radio" name="<portlet:namespace/>gender" value="1" checked>
                                      男
                                  </label>
                              </div>
                              <div class="am-radio">
                                  <label>
                                      <input type="radio" name="<portlet:namespace/>gender" value="0">
                                      女
                                  </label>
                              </div>
                      	</div>
                      </div>
                      
                      <div class="form-item">
                          <label class="register-label" for=""><span class="register-must">*</span>请设置密码</label>
                          <input class="register-input" minlength="6" id="reg-vld-pwd-1" name="<portlet:namespace/>pwd" type="password" placeholder="请输入至少6位密码" required/>
                      </div>

                      <div class="form-item">
                          <label class="register-label" for=""><span class="register-must">*</span>请确认密码</label>
                          <input class="register-input" id="reg-vld-pwd-2" name="<portlet:namespace/>repeat_pwd" type="password"  placeholder="请与上面输入的值一致" data-equal-to="#reg-vld-pwd-1" required/>
                      </div>            

                      <div class="form-item">
                          <label class="register-label" for=""><span class="register-must">*</span>您的净身高</label>
                          <input class="register-input"  type="text" name="<portlet:namespace/>height" required/><span class="body">cm</span>
                       </div>
                       
                       <div class="form-item">
                          <label class="register-label" for=""><span class="register-must">*</span>您的净体重</label>
                          <input class="register-input"  type="text" name="<portlet:namespace/>weight" required/><span class="body">kg</span>
                       </div>	
						
              </div>
         <!--button group -->
              <div class="register-btn am-cf">
                  <input type="submit" class="am-btn am-btn-primary am-btn-sm register-btn-item" value="提交"/>
                  <button class="am-btn am-btn-default am-btn-sm register-btn-item">重置</button>
              </div>

          </form>
      </div>
  </main>
</body>

<script type="text/javascript">
function callServeResource(){
    AUI().use('aui-io-request', function(A){
 
        A.io.request('<%=resourceURL.toString()%>', {
               method: 'post',
               data: {
            	   <portlet:namespace />userName: $('#userName').val()
               },
               on : {
        	       success : function() {
        	       alert("test");
        	       var data = this.get('responseData');
        	       alert(data);
        	       }
               }
        });
 
    });
}
</script>