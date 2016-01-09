<%@include file="/html/init.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>

<portlet:actionURL name="registerUser" var="registerUserURL" windowState="normal" />

<liferay-ui:error key="all-required" message="所有选项均为必填项！" />
<liferay-ui:error key="password-not-match" message="两次密码不一致！" />
<liferay-ui:error key="email-format-not-correct" message="邮箱格式不正确！" />
<liferay-ui:error key="vercd-not-match" message="验证码不匹配！" />

<%
	String verifyCode = "";
	if(request.getAttribute("verifyCode") !=null){
		verifyCode = (String) request.getAttribute("verifyCode");
	}
%>

<body>
<!--main content start-->
  <main>
      <div class="am-g-fixed am-u-md-10 am-u-sm-centered">
          <form action="<%= registerUserURL %>" method="POST" class="am-form" id="register-form" data-am-validator>

              <div class="form-up" >
                  <h3>基本资料</h3>

                      <div class="form-item">
                          <label class="register-label" class="register-label" for="">用户名</label>
                          <input class="register-input" type="text" name="<portlet:namespace/>userName" required/>
                      </div>
                  <div class="form-item-block">
                      <div class="form-item">
                          <label  class="register-label" for="">姓</label>
                          <input class="register-input"  type="text" name="<portlet:namespace/>lastName" required/>
                      </div>
                      <div class="form-item">
                          <label class="register-label" for="">名</label>
                          <input class="register-input" type="text" name="<portlet:namespace/>firstName" required/>
                      </div>
                  </div>
                      <div class="form-item">
                      <label class="register-label" for="">性别</label>
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
                  <div class="form-item-block">
                      <div class="form-item">
                          <label class="register-label" for="">密码</label>
                          <input class="register-input" minlength="6" id="reg-vld-pwd-1" name="<portlet:namespace/>pwd" type="password" placeholder="请输入至少6位密码" required/>
                      </div>

                      <div class="form-item">
                          <label class="register-label" for="">密码确认</label>
                          <input class="register-input" id="reg-vld-pwd-2" name="<portlet:namespace/>repeat_pwd" type="password"  placeholder="请与上面输入的值一致" data-equal-to="#reg-vld-pwd-1" required/>
                      </div>
                  </div>

              </div>
              <hr/>
              <div class="form-down">
                  <h3>联系方式</h3>
                  <div class="form-down-container">
                          <div class="form-item">
                              <label class="register-label" class="register-label" for="">邮箱地址</label>
                              <input class="register-input"  type="text" name="<portlet:namespace/>emailAddress" required/>
                          </div>
                          <div class="form-item">
                              <label  class="register-label" for="">手机号码</label>
                              <input class="register-input"  type="text"  name="<portlet:namespace/>telphone" required/>
                          </div>

                          <div class="form-item">
                              <label class="register-label" for="">其他方式</label>
                              <input class="register-input" type="text"/>
                          </div>

						 <portlet:resourceURL var="getCaptcha" id="getCaptcha" />

						 <div class="form-item">
						 	<input id="reg-ver-cd-1" name="<portlet:namespace/>reg-ver-cd-1" value="<%=verifyCode%>" type="hidden"/>
						 	<label class="register-label" for="">验证码</label>
                          	<input class="register-input" id="reg-ver-cd-2" name="<portlet:namespace/>reg-ver-cd-2" type="text" maxlength="4" placeholder="请输入验证码" data-equal-to="#reg-ver-cd-1" required/>
							<img src="${imgSrc}" class="refreshCode" onclick="refreshCode();">
						<aui:script>
							var getCaptchaUrl = '${getCaptcha}';
						</aui:script>
					</div>

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
