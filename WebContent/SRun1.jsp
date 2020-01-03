<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="leave_system.entity.*"  %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线请假</title>
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
}
.error {
	color: #F00;
	display: none;
}
</style>
</head>
<body>
<%
String TNo=request.getParameter("TNo");
String Date=request.getParameter("Date"); 
String Time=request.getParameter("Time");
int count=Integer.parseInt(request.getParameter("count"));
String[] SNoS=new String[count];
String SNo="";
if(count!=0)
{
	for(int i=0;i<count;i++)
	{
		SNoS[i]=request.getParameter("TNo"+i);
		SNo=SNo+SNoS[i]+",";
	}
}
%>
<div id="bg">
<div id="curSNo"> 
<% 
String TNo1=(String) session.getAttribute("TNo1");
session.setAttribute("TNo",TNo1);
%>
当前帐号：${TNo1} <%-- 如果setAttribute("SNo1","111");这种会导致${SNo1}无法获取值。此表达式等于session。getAttribute（）; --%>
<a href="login.jsp">注销</a>
</div>
<H1><CENTER>登记逃课</CENTER></H1>
<table width="100%" border="1">
  <tr>
    <td>日期</td>
    <td>时间</td>
    <td>逃课名单</td>
  </tr>
  <tr>
    <td><%=Date%></td>
    <td><%=Time%></td>
    <td><%=SNo%></td>
  </tr>
</table>
<form action="SRun" method="post">
<input name="SNo" type="hidden" value="<%=SNo %>" />
<input name="TNo" type="hidden" value="<%=TNo1 %>" />
<input name="Date" type="hidden" value="<%=Date %>" />
<input name="Time" type="hidden" value="<%=Time %>" />
<input name="" value="提交" type="submit" />
</form>
</div>
</body>
</html>