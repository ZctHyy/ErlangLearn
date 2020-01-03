<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生首页</title>
<style type="text/css">
#bg {
	margin: 0px;
	padding: 0px;
	height: 100%;
	width: 100%;
	color: black;
	text-align: center;
} 
#bg #title ul {
	list-style-type: none; 
	margin: 0px;
	padding: 0px;
}
#bg #title ul li {
	text-align: center;
	vertical-align: middle;
	margin: 0px;
	padding: 0px;
	float: left;
	list-style-type: none;
	height: 34px;
	width: 115px;
}
#bg #title ul li a {
	font-family: Roboto;
	color: #000;
	text-decoration: none;
	text-align: center;
	vertical-align: middle;
	height: 34px;
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-bottom-style: solid;
	border-top-color: #0FF;
	border-right-color: #0FF;
	border-bottom-color: #0FF;
	border-left-color: #0FF;
}
#title1 {
	display: none;
}
#bg #title ul li:hover #title1 {
	display: block;
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
</head>
<body>
<div id="bg">
<div id="curSNo"> 
<% 
String SNo1=(String) session.getAttribute("SNo1");
session.setAttribute("SNo",SNo1);
%>
当前帐号：${SNo1} <%-- 如果setAttribute("SNo1","111");这种会导致${SNo1}无法获取值。此表达式等于session。getAttribute（）; --%>
<a href="login.jsp">注销</a>
</div>

<div id="title">  
<center><h1>校园在线请假系统学生版</h1></center>
<ul>
  <li><a>请假</a>
  <div id="title1">  
    <ul>
      <li><a href="SLeave.jsp">在线请假</a></li>
      <li><a href="CheckStudent?SNo=${SNo}">在线公假</a></li>
    </ul>
  </div>
  </li> 
  <li><a href="SChange.jsp">更改假条</a></li>
  <li><a href="SLSearch.jsp">查看假条</a></li>
  <li><a href="SLHistory.jsp">请假历史</a></li>
  <li><a href="TConnect?SNo=${SNo}">联系老师</a></li>  
  <li><a href="SModify.jsp">修改资料</a></li>
  <li><a href="SWorker.jsp">我是学生干部</a></li>
</ul> 
</div>
</div>

</body>
</html>
