<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="leave_system.entity.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>未审批公假</title>
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
List<Leave> r1=(List<Leave>)session.getAttribute("result");
%>
当前帐号：${TNo1} <%-- 如果setAttribute("SNo1","111");这种会导致${SNo1}无法获取值。此表达式等于session。getAttribute（）; --%>
<a href="login.jsp">注销</a>
</div>
<h1><center>未审批事公假</center></h1>
<table width="100%" border="1">
  <tr>
    <td>学号</td>
    <td>姓名</td>
    <td>专业</td>
    <td>班级</td>
    <td>类型</td>
    <td>开始日期</td>
    <td>结束日期</td>
    <td>请假时间</td>
    <td>原因</td>
    <td>上交日期</td>
    <td>申请人</td>
  </tr>
<%
	String ID=r1.get(0).getID();
	for(int i=0;i<r1.size();i++)
	{
		Leave r=r1.get(i);
%>
  <tr>
    <td><%=r.getSNo() %></td>
    <td><%=r.getSName() %></td>
    <td><%=r.getMajor() %></td>
    <td><%=r.getClasses() %></td>
    <td><%=r.getType() %></td>
    <td><%=r.getSDate() %></td>
    <td><%=r.getEDate() %></td>
    <td><%=r.getTime() %></td>
    <td><%=r.getReason() %></td>
    <td><%=r.getLoadDate() %></td>
    <td><%=r.getStudent() %></td>
    <td>
</tr>
<% 
}
%>
</table>
<center>
<form action="BPON2" method="post">
	<p>假条ID：<%=ID %></p>
    <select name="PON">
  		<option value="同意">同意</option>
 		<option value="拒绝">拒绝</option>
	</select>
	 <input name="TNo" type="hidden" value="${TNo1}">
    <input name="ID" type="hidden" value="<%=ID %>">
	<input name="" type="submit" value="审核">
</form>
</center>
</div>
</body>
</html>