<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="leave_system.entity.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>修改密码</title>
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
.error {
	color: #F00;
	display: none;
} 
.error1 {
	color: #F00;
} 
</style>
<script type="text/JavaScript">
function check()
{
	var c="success";
	var contact=document.getElementById("Contact").value;
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
	if(contact==null||contact=="")
	{
		document.getElementById("nonecontact").style.display="block";	
		c="fail";
	}
	else
	{
		document.getElementById("nonecontact").style.display="none";	
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
<body>
<%String Contact=(String) session.getAttribute("Contact");
%>
<div id="bg">
<div id="curSNo"> 
当前帐号：${TNo1} <%-- 如果setAttribute("SNo1","111");这种会导致${SNo1}无法获取值。此表达式等于session。getAttribute（）; --%>
<a href="login.jsp">注销</a>
</div>
<div>
<center><h1>修改密码</h1></center>
<form action="" method="post">
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
联系方式：<input value="<%=Contact %>" name="Contact" type="text" id="Contact">
<br/>
<span class="error" id="nonecontact">请输入新联系方式</span>
<br/>
<input type="hidden" name="TNo" value="${TNo1}"/>
<input id="sub" name="" value="修改密码" type="button" onclick="check()" />
</center>
</form>
</div>
</div>
</body>
</html>