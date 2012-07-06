<%@ page language="java" import="java.sql.*,db.*" %>
<%
session.invalidate();
response.sendRedirect("login.jsp");
%>
