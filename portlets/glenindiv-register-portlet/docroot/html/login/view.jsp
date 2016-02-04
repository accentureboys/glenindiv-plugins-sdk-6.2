<%@include file="/html/init.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	long viewPlid = PortalUtil.getPlidFromFriendlyURL(PortalUtil.getCompanyId(request), "/web/guest/register");
%>

<portlet:actionURL name="userLogin" var="userLoginURL" windowState="normal" />

<liferay-portlet:renderURL var="showRegisterPage" plid="<%=viewPlid %>" portletName="registerportlet_WAR_glenindivregisterloginportlet">
</liferay-portlet:renderURL>


<body>
	<form action="<%= userLoginURL %>" method="POST" id="login-form">
		<span id="group-msg-block"></span>
        <div class="login-form" >
        	<div class="form-item">
        		<input class="login-input userImg" type="text" name="<portlet:namespace/>userName" placeholder="手机号" required/>
        		<input class="login-input lockImg" type="password" name="<portlet:namespace/>userPwd" placeholder="密码" required/>
        		<button class="login-input-loginbtn" type="submit" id="button">登录</button>
        		<a class="login-a login-register" id="register" href="<%=showRegisterPage %>">注册</a>
        		<a class="login-a login-forget" href="">忘记密码？</a>
       		</div>
        </div>
	</form>
</body>