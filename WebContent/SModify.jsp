<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>修改密码</title>
</head>
<script type="text/JavaScript">
function check()
{
	var c="success";
	var p=document.getElementById("Password").value;	
	var rep=document.getElementById("RePassword").value;
	if(p==null||p=="")
	{
		document.getElementById("nonep").style.display="block";	
		c="fail";
	}
	else
	{
		document.getElementById("nonep").style.display="none";	
		c="success";
	}
	if(p!=rep)
	{
		document.getElementById("notsame").style.display="block";	
		c="fail";
	}
	else
	{
		document.getElementById("notsame").style.display="none";	
		c="success";
	}
	if(c!="success")
	{
		document.getElementById("sub").type="button";
	}
	else
	{
		document.getElementById("sub").type="submit";
	}
}
</script>
</script>
<style type="text/css">
.error {
	color: #F00;
	display: none;
} 
.error1 {
	color: #F00;
} 
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
<div>
<center><h1>修改密码</h1></center>
<form action="SModify" method="post">
<center>
原密码：<input name="OldPassword" type="text" /><br/>
<span class="error1">${NS}</span> 
<br/>
新密码：<input id="Password" name="Password" type="password" /><br/>
<span class="error" id="nonep">请输入新密码</span>
<br/>
确认新密码：<input id="RePassword" name="RePassword" type="password" onchange="check()" /><br/>
<span class="error" id="notsame">两次密码不一致</span>
<br/>
<input type="hidden" name="SNo" value="${SNo}"/>
<input id="sub" name="" value="修改密码" type="button" onclick="check()" />
<span class="error1">${Success}</span>  
</center>
</form>
</div>
</div>
</body>
</html>