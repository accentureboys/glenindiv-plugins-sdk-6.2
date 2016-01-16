package com.liferay.glenindiv.register.portlet;

import java.io.IOException;

import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class RegisterPortlet
 */
public class RegisterPortlet extends MVCPortlet {
	
	VerifyCodeService vcs = new VerifyCodeService();
	
	@Override
	public void serveResource(ResourceRequest resourceRequest, ResourceResponse resourceResponse)
			throws IOException, PortletException {
		System.out.println("#############AJAX CALL####################");
		String userName = ParamUtil.getString(resourceRequest, "userName");
 
        System.out.println("The value of site parameter sent by AJAX  "+userName);
		String imgString = vcs.createCode();
		String verifyCode = vcs.getCode();
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
