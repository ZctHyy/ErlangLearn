<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>通知教师</title>
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
String ID=request.getParameter("ID");
String SNo=request.getParameter("SNo");
String SDate=request.getParameter("SDate"); 
String EDate=request.getParameter("EDate");  
String Time="";
int count=Integer.parseInt(request.getParameter("count"));
String[] TNoS=new String[count];
String TNo="";
if(count!=0)
{
	for(int i=0;i<count;i++)
	{
		TNoS[i]=request.getParameter("TNo"+i);
		TNo=TNo+TNoS[i]+",";
	}
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
    <td>开始日期</td>
    <td>结束日期</td>
    <td>请假时间</td>
  </tr>
  <tr>
    <td><%=SNo %></td>
  	<td><%=SDate %></td>
  	<td><%=EDate %></td>
    <td><%=Time %></td>
    
  </tr>
</table>
<p>通知教师名单:<%=TNo %></p>
<form action="Leave/Ask" method="post">
<input name="SNo" type="hidden" value="<%=SNo %>" />
<input name="ID" type="hidden" value="<%=ID %>" />
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