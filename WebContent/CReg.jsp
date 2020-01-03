<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>纪检部成员注册</title>
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
<script type="text/JavaScript">
function checkInput() 
{ 
	var result="success"; 
	var already=document.getElementById("already");
	var fail=document.getElementById("fail");
	document.getElementById("WrongSNo").style.display="none"
	already.style.display="none";
	fail.style.display="none";
	var regnum=document.getElementById("RegNum");
	var sno = document.getElementById("SNo");
//在这里我认为： name 代表的name 为 txtUser 的文本框 
	if(sno.value.length==0)
	{ 
		document.getElementById("SNoE").style.display="block";
	} 
	else
	{
		document.getElementById("SNoE").style.display="none";
	}
	
	if(regnum.value.length==0)
	{ 
		document.getElementById("PWE").style.display="block";
		document.getElementById("PWE1").style.display="none";
		result="fail"; 
	}
	else if(regnum.value.length!=6)
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
	if(result=="success")
	{ 
		var mf=document.getElementById("submit");
		mf.type="submit";
	}
}  
</script>  
<body>   
<h1><center>纪检部成员注册</center></h1>
<form action="http://localhost:8080/Leave_System/Reg/Check" method="post"> 
<h4>密码和学生账号的相同</h4>
<center> 
学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：
<input name="CNo" id="SNo" type="text"><br/>
<span class="error" id="SNoE">请输入学号</span>
<span class="error1" id="WrongSNo">${failSNo}</span> 
<br/>
注&nbsp;&nbsp;册&nbsp;&nbsp;码：<input name="RegNum" id="RegNum" type="text"><br/>
<span class="error" id="PWE">请输入注册码</span>
<span class="error" id="PWE1">请输入正确注册码</span>
<span class="error1" id="WrongRN">${wrongRN}</span>
<br/>
<span class="error1" id="already">${already}</span>
<span class="error1" id="fail">${fail}</span> 
<br/>
<input name="" type="button" value="注册" id="submit" onclick="checkInput()"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="" value="重置" type="reset">
</center>
</form>
</body> 
</html> 