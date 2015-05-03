<%@ page import = "pro.*" %>
<%
	String contextPath = request.getContextPath();
	String id = (String)session.getAttribute("id");
	if (id == null || id.equals("")) {
		id = "not";
		/* response.sendRedirect(contextPath+"/combinePage/homeMainPage.jsp"); */
	}
	MemberDao md = MemberDao.getInstance();
	String writer = md.getNick(id);
%>