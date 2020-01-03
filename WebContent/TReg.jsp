<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教师注册</title>
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
#tgrade { 
	display: none;
} 
#treg {
	display: none; 
}
</style>
</head>
<body>
<script type="text/JavaScript">
 function checkInput() 
 {
	var contact=document.getElementById("Contact");
	document.getElementById("fail").style.display="none";
	document.getElementById("already").style.display="none";
	document.getElementById("RNWrong").style.display="none";
	var result="success";
	var objS = document.getElementById("job");
    var val = objS.options[objS.selectedIndex].value;
	var sno=document.getElementById("TNo");
	var name=document.getElementById("TName");
	var password=document.getElementById("Password");
	var repassword=document.getElementById("RePassword");
	var grade=document.getElementById("Grade");
	var college=document.getElementById("College");
	var job=document.getElementById("job");	 
	var regnum=document.getElementById("RegNum");
	if(sno.value.length==0)
	{ 
		document.getElementById("SNoE").style.display="block";
		result="fail"; 
	} else
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
	if(contact.value.length==0)
	{
		document.getElementById("ContactE").style.display="block";
		result="fail"; 
	}
	else
	{
		document.getElementById("ContactE").style.display="none";
	}
	if(val=="辅导员")
	{
		 if(regnum.value.length==0)
		{ 
			document.getElementById("RegNumE").style.display="block";
			document.getElementById("RegNumE1").style.display="none";
			result="fail"; 
		}
		else if(regnum.value.length!=6)
		{
			document.getElementById("RegNumE").style.display="none";
			document.getElementById("RegNumE1").style.display="block";
			result="fail";  
		} 
		else
		{
			document.getElementById("RegNumE").style.display="none";
			document.getElementById("RegNumE1").style.display="none";
		} 
	}
	if(result=="success")
	{ 
		var mf=document.getElementById("submit");
		mf.type="submit";
	}
 }
 function jobSelect(){
	var grade=document.getElementById("tgrade");
	var reg=document.getElementById("treg");
    var objS = document.getElementById("job");
    var val = objS.options[objS.selectedIndex].value;
    if(val=="辅导员")
	{
		reg.style.display="block";
		grade.style.display="block";
	}
	else
	{
		reg.style.display="none";
		grade.style.display="none";
	}
} 
</script>
<h1><center>教师注册</center></h1>
<form action="http://localhost:8080/Leave_System/Reg/Teacher" method="post">
用&nbsp;&nbsp;户&nbsp;&nbsp;名：<input name="TNo" id="TNo" type="text"><br/>
<span class="error" id="SNoE">请输入用户名</span><br/>
教&nbsp;&nbsp;师&nbsp;&nbsp;名：<input id="TName" name="TName" type="text"><br/>
<span class="error" id="SNameE">请输入教师名</span><br/>
密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：<input name="Password" type="password" id="Password"><br/>
<span class="error" id="PWE">请输入密码</span>
<span class="error" id="PWE1">密码长度请大于6个字符</span><br/>
确认密码：<input name="RePassword" id="RePassword" type="password"><br/>
<span class="error" id="RPWE">两次密码不一致</span><br/>
所属学院：<input name="College"  id="College" type="text"><br/><br/>
教师职务：
<select id="job" name="Job"   onchange="jobSelect()">
  <option value="教师" selected>教师</option>
  <option value="辅导员" >辅导员</option>
</select><br/><br/>
联系方式：<input name="Contact" id="Contact" type="text" /><br/>
<span class="error" id="ContactE">请输入联系方式</span><br/>
<div id="tgrade">
负责年级：<select name="Grade" id="Grade">
</select><br/><br/>
</div>
<div id="treg">
注&nbsp;&nbsp;册&nbsp;&nbsp;码：<input id="RegNum" name="RegNum" type="text"><br/>
<span class="error" id="RegNumE">请输入注册码</span>
<span class="error" id="RegNumE1">请输入正确注册码</span>
<span class="error1" id="RNWrong">${wrongRN}</span>
</div>
<span class="error1" id="fail">${fail}</span> 
<span class="error1" id="already">${already}</span> 
<br/> 
<input name="" type="button" value="注册" id="submit" onclick="checkInput()"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="" value="重置"type="reset">
</form>
</body> 
</html>