<%@ page contentType="text/html; charset=ISO-8859-1" language="java" import="java.sql.*,db.*" errorPage="" pageEncoding="UTF-8"%>
<% int cc=Integer.valueOf(request.getParameter("cc")); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es"><head>

</head>
<body  style="margin:50px 100px 30px 30px;" >
<%if(cc==1){%>
<img src="../img/torta.jpg" width="203" height="200" />
<%}if(cc==2){%>
<img src="../img/barras.jpg" width="203" height="200" />
<%}if(cc==3){%>
<img src="../img/lineal.jpg" width="203" height="200" />
<%}if(cc==4){%>
<img src="../img/area.jpg" width="203" height="200" />
<%}%>
</body></html>
