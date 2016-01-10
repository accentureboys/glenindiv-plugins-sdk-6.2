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
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class RegisterPortlet
 */
public class RegisterPortlet extends MVCPortlet {
	
	VerifyCodeService vcs = new VerifyCodeService();
	
	@Override
	public void doView(RenderRequest renderRequest,
			RenderResponse renderResponse) throws IOException, PortletException {
		// TODO Auto-generated method stub
		String imgSrc = vcs.createCode();
		String verifyCode = vcs.getCode();
		renderRequest.setAttribute("verifyCode", verifyCode);
		renderRequest.setAttribute("imgSrc", imgSrc);
		super.doView(renderRequest, renderResponse);
	}
	
	@Override
	public void serveResource(ResourceRequest request, ResourceResponse response)
			throws IOException {
		String newImgSrc = vcs.createCode();
		String verifyCode = vcs.getCode();
		response.getWriter().append(newImgSrc+"|"+verifyCode);
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
