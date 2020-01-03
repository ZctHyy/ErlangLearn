<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线请假</title>
<style type="text/css">
#rewrite {
	font-size: 12px;
	color: red;
	text-decoration: none;
	text-align: right;
	vertical-align: middle;
}
#re {
	font-size: 12px;
	color: red;
	text-decoration: none;
	text-align: right;
	vertical-align: middle;
}
</style>
</head>
<body>
<%
String SNo=request.getParameter("SNo");
String Type=request.getParameter("Type");
String TimeType=request.getParameter("TimeType");
String SDate=request.getParameter("SDate"); 
String EDate=request.getParameter("EDate");  
String CEDate=request.getParameter("CEDate"); 
String[] Times=request.getParameterValues("Time");
String Time="";
String Reason=request.getParameter("Reason");
String TZ=request.getParameter("TZ");
int count=Integer.parseInt(request.getParameter("count"));
String[] TNoS=new String[count];
String TNo="";
for(int i=0;i<Times.length;i++)
{
	Time=Time+Times[i];	
}
if(count!=0)
{
	for(int i=0;i<count;i++)
	{
		TNoS[i]=request.getParameter("TNo"+i);
		TNo=TNo+TNoS[i]+",";
	}
}
if(TimeType.equals("课程"))
{
	EDate=CEDate;	
}
%>
<div id="bg"> 
<div id="HT">
<center><h1>确认请假信息</h1></center>
</div>
<div id="re">
<a href="SLeave.jsp?SNo=<%=SNo %>" id="rewrite">重新填写</a>
</div>
<div id="T">
<table width="100%" border="1" align="center">
  <tr>
    <td>学生学号</td>
    <td>请假类型</td>
    <td>请假时间</td>
    <td>请假时长</td>
    <td>请假原因</td>
    <td>通知教师</td>
  </tr>
  <tr>
    <td><%=SNo %></td>
    <td><%=Type %></td>
    <%if(TimeType.equals("课程"))
    {
    %>
    	<td><%=EDate %></td>
    <%
    } 
    if(TimeType.equals("天"))
    {
    %>
    	<td><%=SDate%>~<%=EDate %></td>
    <%
    } 
    %>
    <%if(TimeType.equals("课程"))
    {
    	out.print("<td>第"+Time+"课程</td>");
    }
    else
    {
    	out.print("<td>"+Time+"天</td>");
    }
    %>
    <td><%=Reason %></td>
    <td><%=TZ %></td>
  </tr>
</table>
<%if(TZ.equals("是"))
{
%>
	<p>通知教师名单:<%=TNo %></p>
<%
}
%>
<form action="Leave/Ask" method="post">
<input name="SNo" type="hidden" value="<%=SNo %>" />
<input name="Type" type="hidden" value="<%=Type %>" />
<input name="EDate" type="hidden" value="<%=EDate %>" />
<input name="SDate" type="hidden" value="<%=SDate %>" />
<input name="Time" type="hidden" value="<%=Time %>" />
<input name="Reason" type="hidden" value="<%=Reason %>" />
<input name="TZ" type="hidden" value="<%=TZ %>" />
<input name="TimeType" type="hidden" value="<%=TimeType %>" />
<input name="TNo" type="hidden" value="<%=TNo %>" />

<br/>
<center>
<input name="" type="submit" value="提交" />
</center>
</form>
</div>
</div>
</body>
</html>