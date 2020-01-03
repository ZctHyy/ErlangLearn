<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改假条</title> 
<style type="text/css">
#success a {
	text-decoration: none;
	color: #000;
}
#fail a { 
	text-decoration: none;
	color: #000;
} 
</style>

</head>
<body>
<%
String SNo=(String) request.getAttribute("SNo");
session.setAttribute("SNo",SNo); 
session.setAttribute("SNo1",SNo);
String result =(String) request.getAttribute("result");
if(result.equals("success"))
{ 
%> 

<div id="success">
<center><h1>修改成功</h1>
<a href="http://localhost:8080/Leave_System/Sindex.jsp">跳转到首页</a>
</center>
</div>
<% 
} 
else 
{%>
<div id="fail">
<center><h1>修改失败</h1>
<p>${already}</p>
<a href="http://localhost:8080/Leave_System/Sindex.jsp">跳转到首页</a></center>
</div>
<%
}
%>
</body>
</html>