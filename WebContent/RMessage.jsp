<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="leave_system.entity.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>收到通知</title>
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
List<Leave> result=(List<Leave>)session.getAttribute("result");
String TNo=(String) session.getAttribute("TNo");
String check=(String) session.getAttribute("check");
%>
当前帐号：${TNo1} <%-- 如果setAttribute("SNo1","111");这种会导致${SNo1}无法获取值。此表达式等于session。getAttribute（）; --%>
<a href="login.jsp">注销</a>
</div>
<h1><center>收到通知</center></h1>
    <form action="AllRMessage" method="post">
    <input name="TNo" type="hidden" value="<%=TNo %>" /> 
    <input name="" value="查看所有日期内可看假条" type="submit" />
    </form>
<table width="100%" border="1">
  <tr>
    <td>学号</td>
    <td>姓名</td>
    <td>所属学院</td>
    <td>所在专业</td>
    <td>所属班级</td>
    <td>开始日期</td>
    <td>结束日期</td>
    <td>请假时间</td>
    <td>请假类型</td>
    <td>请假原因</td>
    <td>已读</td>
  </tr>
  <%for(int i=0;i<result.size();i++)
	  {
	  		Leave l=result.get(i);
  %>
  <tr>
    <td><%=l.getSNo() %></td>
    <td><%=l.getSName() %></td>
    <td><%=l.getCollege() %></td>
    <td><%=l.getMajor() %></td>
    <td><%=l.getClasses() %></td>
    <td><%=l.getSDate() %></td>
    <td><%=l.getEDate() %></td>
    <td><%=l.getTime() %></td>
    <td><%=l.getType() %></td>
    <td><%=l.getReason()%></td>
    <td><%
    	if(check.equals("none"))
    	{
    		%>
    		无数据
    		<%
    	}
    	else
    	{
    		%>
    		<form action="" method="post">
    			<input name="SNo" type="hidden" value="<%=l.getSNo() %>" />
    			<input name="TNo" type="hidden" value="<%=TNo %>" />
    			<input name="ID" type="hidden" value="<%=l.getID() %>" />
    			<input name="" value="已读" type="submit" />
    		</form>
    		<%
    	}
    %></td>
  </tr>
  <%} %>
</table>
</div>
</body>
</html>