<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page import="leave_system.entity.*"  %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>更改假条</title>
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
#type {
	display: none;
}
</style>
<script type="text/JavaScript">
 function Lchange()
 { 
	document.getElementById("change").action="SChange1.jsp";
	document.getElementById("changeL").type="submit";	 
 }
 function Ldelete()
 {
 	document.getElementById("change").action="DeleteLeave";
	document.getElementById("deleteL").type="submit";
 }
 function ct1()
 {
  	document.getElementById("search").style.display="block";
	document.getElementById("type").style.display="none";	 
 }
 function ct2()
 {
	 	document.getElementById("search").style.display="none";
	document.getElementById("type").style.display="block";
 }
 function Search(){
    var val = document.getElementById("sid").value;
	if(val.length<9)
	{
		document.getElementById("serror1").style.display="block";
		document.getElementById("serror2").style.display="none";	
	}
	else if(val.substr(0,1)!="A"&val.substr(0,1)!="B"&val.substr(0,1)!="C")
	{
		document.getElementById("serror1").style.display="none";
		document.getElementById("serror2").style.display="block";	
	}
	else
	{
		document.getElementById("serror1").style.display="none";
		document.getElementById("serror2").style.display="none";
		document.getElementById("sub").type="submit";
	}
 } 
</script>
</head>
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
<div id="headTitle">
<h1><center>假条更改</center></h1>
<center><span id="tips">（仅可以修改未审批假条）</span></center>
</div>
<div id="choose"> 
<center>
      <label>
        <input type="radio" name="ct" value="精确" onclick="ct1()"/>
        精确查找</label>
      <label>
        <input type="radio" name="ct" value="类型" onclick="ct2()" />
        类型查找</label>
      <br />
</center>
</div>
</div>
<div id="search">
<form action="ChangeIDSearch" method="post"> 
<center>
假条ID：<input name="ID" type="text" id="sid"/>
<input name="Student" type="hidden" value="<%= SNo%>" />
<br/>
<span id="serror1" class="error">请输入正确的假条ID</span>
<span id="serror2" class="error">请输入正确的假条ID>>A类型为事假，B类型为公假，C类型为补假</span>
<br/>
<input name="" type="button"  id="sub" value="提交" onclick="Search()"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="" type="reset" value="重新填写" />
</center>
</form>
</div>
<div id="type">
<center>
<form action="ChangeTypeSearch" method="post">
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
    <td>修改假条</td>
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
<form action="" method="post" id="change"><!-- 直接发送不请求后台 -->
	<input name="SNo" type="hidden" value="<%= result.getSNo()%>" />	
	<input name="SName" type="hidden" value="<%= result.getSName()%>" />
	<input name="Type" type="hidden" value="<%= result.getType()%>" />
	<input name="SDate" type="hidden" value="<%= result.getSDate()%>" />
	<input name="EDate" type="hidden" value="<%= result.getEDate()%>" />
	<input name="Time" type="hidden" value="<%= result.getTime()%>" />
	<input name="PON" type="hidden" value="<%= result.getPON()%>" />
	<input name="ID" type="hidden" value="<%= result.getID()%>" />
	<input name="Reason" type="hidden" value="<%=result.getReason()%>"/>
	<input onclick="Lchange()" id="changeL" name="" type="button" value="修改"/>
    <input onclick="Ldelete()" id="deleteL" name="" type="button" value="销假"/>
</form>
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