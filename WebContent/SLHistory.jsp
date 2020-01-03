<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page import="leave_system.entity.*"  %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>请假历史</title>
</head>
<style type="text/css">
#curSNo {
	font-size: 12px;
	text-align: right;
	vertical-align: middle;
	padding-bottom: 10px;
}
#bground #curSNo a {
	font-size: 12px;
	color: #00F;
	text-decoration: none;
}
#headTitle {
	margin-bottom: 20px;
} 
td {
	height: 20px; 
	width: 12.5%;
	text-align: center;
	vertical-align: middle;
}
#bground {
	height: 100%;
	width: 100%;
	margin-bottom: 15px;
}
#search {
	width: 100%;
	margin-bottom: 20px;
	display: none;
}
#hide {
	display: none;
}
.error {
	color: #F00;
	display: none;
}
#tips {
	font-size: 12px;
	color: #F00;
}
</style>
<body>
<div id="bground">  
<div id="curSNo"> 
<%
String SNo=(String) session.getAttribute("SNo"); 
session.setAttribute("SNo1",SNo); 
%>
当前帐号：${SNo} <%-- 如果setAttribute("SNo1","111");这种会导致${SNo1}无法获取值。此表达式等于session。getAttribute（）; --%>
<a href="login.jsp">注销</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="Sindex.jsp">返回主页</a>
</div>
<div id="type">
<center>
<h1><center>按类别查找请假历史</center></h1>
<form action="HistorySearch" method="post">
假条类型：
<select name="Types" size="2" multiple="multiple">
  <option value="全部">全部</option>
  <option value="事假">事假</option>
  <option value="公假">公假</option>
  <option value="补假">补假</option>
</select> 
<input name="Student" type="hidden" value="${SNo}"/>
<br/><br/> 
<input name="" type="submit" value="查看全部可更改假条" />
</form>
</center> 
</div>
<table width="100%" border="1">
  <tr>
  	<td>假条ID</td>
    <td>学号</td>
    <td>姓名</td>
    <td>请假类型</td>
    <td>开始日期</td>
    <td>结束日期</td> 
    <td>请假时间</td>
    <td>审核结果</td>
  </tr>
<%
List<Leave> table = (List<Leave>) session.getAttribute("result");
if(table!=null)
{
	for(int i=0;i<table.size();i++) 
	{
		Leave result=table.get(i);
%>
  <tr>
    <td><%= result.getID()%></td>
    <td><%= result.getSNo()%></td>
    <td><%= result.getSName()%></td>
    <td><%= result.getType()%></td>
    <td><%= result.getSDate()%></td>
    <td><%= result.getEDate()%></td> 
    <td><%= result.getTime()%></td>
    <td><%= result.getPON()%></td>
    <td> 
</td>
  </tr>
<%
	} 
} 
%>	
</table>
</div>
</body>
</html>