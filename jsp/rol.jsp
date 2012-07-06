<%
String rol = String.valueOf(request.getParameter("rol"));
session.setAttribute("roles",rol);
response.sendRedirect("landing_page.jsp");
%>