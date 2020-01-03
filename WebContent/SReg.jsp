<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生注册</title>
</head>  
 <style type="text/css">    
.error {
	font-weight: bold; 
	color: #F00; 
	display:none;
}    
.error1 {
	font-weight: bold; 
	color: #F00; 
}    
</style>     
<body> 
<script type="text/JavaScript">
function checkInput()
{
	var result="success";
	var repassword=document.sreg.RePassword;
	var password=document.sreg.Password;
	var name=document.sreg.SName;
	var sno = document.sreg.SNo;  
	document.getElementById("already").style.display="none";
	document.getElementById("fail").style.display="none";
//在这里我认为： name 代表的name 为 txtUser 的文本框 
	if(sno.value.length==0)
	{ 
		document.getElementById("SNoE").style.display="block";
		result="fail"; 
	} 
	else
	{
		document.getElementById("SNoE").style.display="none";
	}
	if(name.value.length==0)
	{ 
		document.getElementById("SNameE").style.display="block";
		result="fail"; 
	}
	else
	{
		document.getElementById("SNameE").style.display="none";
	}
	if(password.value.length==0)
	{ 
		document.getElementById("PWE").style.display="block";
		document.getElementById("PWE1").style.display="none";
		result="fail"; 
	}
	else if(password.value.length<6)
	{
		document.getElementById("PWE").style.display="none";
		document.getElementById("PWE1").style.display="block";
		result="fail"; 
	}
	else
	{
		document.getElementById("PWE").style.display="none";
		document.getElementById("PWE1").style.display="none";
	} 
	if(repassword.value!=password.value)
	{
		document.getElementById("RPWE").style.display="block";
		result="fail"; 
	}
	else 
	{
		document.getElementById("RPWE").style.display="none";
	}
	if(result=="success")
	{ 
		var mf=document.getElementById("submit");
		mf.type="submit";
	}
}  
</script>  
<div>   
<div>       
<h1><center>学生注册</center></h1>     
</div>       
<div>
<form action="http://localhost:8080/Leave_System/Reg/Student" method="post" name="sreg">    
<center>   
学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号： 
<input name="SNo" type="text"/><br/>
<span class="error" id="SNoE">请输入学号</span><br/>
姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名： 
<input name="SName" type="text" /><br/>
<span class="error" id="SNameE">请输入姓名</span><br/>
密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：
<input name="Password" type="password" /><br/>
<span class="error" id="PWE">请输入密码</span><br/> 
<span class="error" id="PWE1">密码长度请大于6个字符</span><br/>
确认密码：
<input name="RePassword" type="password" /><br/>
<span class="error" id="RPWE">两次密码不一致</span><br/>
所属学院：<input name="College" type="text" /><br/><br/>
所属专业：<input name="Major" type="text" /><br/><br/>
所属班级：<input name="Classes" type="text" /><br/>
<span class="error1" id="fail">${fail}</span> 
<span class="error1" id="already">${already}</span> 
<br/> 
<input name="" type="button" value="注册" id="submit" onclick="checkInput()"/>
<input name="" type="reset" value="重置" />
</center> 
</form>
</div>
</div>
</body>
</html>
