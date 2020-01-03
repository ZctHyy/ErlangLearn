<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="leave_system.entity.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>查看验证码</title>
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
<a href="LRegNum.jsp?TNo=${TNo1 }">返回</a>
<a href="Tindex.jsp">返回主页</a>
</div>
<h1><center>查看注册码</center></h1>
<% 
String t=(String)session.getAttribute("Type1");
if(t.equals("学生干部"))
{
%>

	<table width='100%' border='1'>
  		<tr>
    		<td>注册码</td>
    		<td>所属学院</td>
    		<td>是否使用</td>
    		<td>申请人</td>
  		</tr>
<%
	List<SRegNum> result=(List<SRegNum>) session.getAttribute("result");	
	for(int i=0;i<result.size();i++)
	{
		SRegNum srn=result.get(i);
%>
		<tr>
    		<td><%=srn.getRegNum() %></td>
    		<td><%=srn.getCollege() %></td>
    		<td><%=srn.getUsed() %></td>
    		<td><%=srn.getTNo() %></td>
  		</tr>
<%
	}
	out.print("</table>");
}
else
{
	%>

	<table width='100%' border='1'>
  		<tr>
    		<td>注册码</td>
    		<td>所属学院</td>
    		<td>是否使用</td>
    		<td>申请人</td>
  		</tr>
<%
	List<CRegNum> result=(List<CRegNum>) session.getAttribute("result");	
	for(int i=0;i<result.size();i++)
	{
		CRegNum srn=result.get(i);
%>
	<tr>
		<td><%=srn.getRegNum() %></td>
		<td><%=srn.getCollege() %></td>
		<td><%=srn.getUsed() %></td>
		<td><%=srn.getTNo() %></td>
		</tr>
<%
	}
	out.print("</table>");
}
%>
</div>
</body>
</html>