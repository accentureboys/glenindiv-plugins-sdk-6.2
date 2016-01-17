package com.liferay.glenindiv.register.portlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class RegisterPortlet
 */
public class RegisterPortlet extends MVCPortlet {
	
	//设置唯一的apikey值
    private static String apikey = "54ab286a4a8ec11573608ae2ed822bbe";
	
	VerifyCodeService vcs = new VerifyCodeService();
 
	JavaSmsApi javaSmsApi = new JavaSmsApi();
	
	Validator validator = new Validator();
    
	@Override
	public void serveResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse)
			throws IOException, PortletException {
		String mobile = ParamUtil.getString(resourceRequest, "userName");
		if(!validator.isMobile(mobile)){
			SessionErrors.add(resourceRequest, "mobile-format-not-correct");
			_log.error("User input incorrect telephone number format.");
			resourceResponse.getWriter().append("error");
		}else{
			String imgString = vcs.createCode();
			String verifyCode = vcs.getCode();
			String text = "【GLENINDIV】开启专属人生，您的验证码是" + verifyCode;
			//Automatic apply mode to send SMS verification code
			javaSmsApi.sendSms(apikey, text, mobile);
			_log.info("----------verification code has been sent------------");
			resourceResponse.getWriter().append("success");	
		}
        super.serveResource(resourceRequest, resourceResponse);
	} 
	
	protected void include(String path, RenderRequest renderRequest,
			RenderResponse renderResponse) throws IOException, PortletException {

		PortletRequestDispatcher portletRequestDispatcher = getPortletContext()
				.getRequestDispatcher(path);

		if (portletRequestDispatcher == null) {
			_log.error(path + " is not a valid include");
		} else {
			portletRequestDispatcher.include(renderRequest, renderResponse);
		}
	}
	 
	protected String editTemplate;
	protected String viewTemplate;
	
	private static Log _log = LogFactoryUtil.getLog(RegisterPortlet.class);
}
