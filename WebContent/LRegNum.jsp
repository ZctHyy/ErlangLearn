<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="leave_system.entity.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>查看注册码</title>
</head>
<style type="text/css">
#bg {
	margin: 0px; 
	padding: 0px;
	height: 100%;
	width: 100%;
	color: black;
	text-align: center;
} 
#curSNo {
	font-size: 12px;
	text-align: right;
	vertical-align: middle;
	padding-bottom: 10px; 
}
#bg #curSNo a {
	font-size: 12px;
	color: #00F;
	text-decoration: none;
}
</style>
<body>
<div id="bg">
<div id="curSNo"> 
<% 
String TNo1=(String) session.getAttribute("TNo1");
session.setAttribute("TNo",TNo1);
%>
当前帐号：${TNo1} <%-- 如果setAttribute("SNo1","111");这种会导致${SNo1}无法获取值。此表达式等于session。getAttribute（）; --%>
<a href="login.jsp">注销</a>
<a href="Tindex.jsp">返回主页</a>
</div>
<h1><center>查看注册码</center></h1>
<form action="LRegNum" method="post">
<center>
查看类型：<select name="Type">
  <option value="学生干部">学生干部</option>
  <option value="纪检部">纪检部</option>
</select>
<br/><br/>
是否可用：<select name="Used">
  <option value="No">是</option>
  <option value="Yes">否</option>
  <option value="全部">全部</option>
</select>
<br/><br/>
<input type="hidden" value="${TNo1 }" name="TNo"/>
<input name="" type="submit" value="查看" />
</center>
</form>

</div>
</body>
</html>