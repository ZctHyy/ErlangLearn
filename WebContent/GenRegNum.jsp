<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>生成注册码</title>
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
</div>
<h1><center>生成验证码</center></h1>
<center>
<form action="GenNum" method="post">
生成类型：
<select name="Type">
  <option value="学生干部">学生干部</option>
  <option value="纪检部">纪检部</option>
</select>
<br/><br/>
生成数量:
<input name="Num" type="text" />
<br/><br/>
<input type="hidden" value="${TNo1 }" name="TNo"/>
<input name="" type="submit" value="提交" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="" type="reset" value="重置" />
</form>
</center>
</div>
</body>
</html>