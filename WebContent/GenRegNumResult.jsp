<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="leave_system.entity.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>生成结果</title>
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
String[] result=(String[]) session.getAttribute("result");
%>
当前帐号：${TNo1} <%-- 如果setAttribute("SNo1","111");这种会导致${SNo1}无法获取值。此表达式等于session。getAttribute（）; --%>
<a href="login.jsp">注销</a>
</div> 
<center>
生成验证码:
<%
for(int i=0;i<result.length;i++)
{
	if(i==result.length-1)
	{
		out.print(result[i]);
	}
	else
	{
		out.print(result[i]+",");
	}
	
}
%>
</center>
<a href="Tindex。jsp">返回主页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="GenRegNum.jsp?TNo=${TNo1}">继续生成</a>
</div>
</body>
</html>