<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录系统</title>    
<style type="text/css">   
#ChoiceType {       
	padding-bottom: 10px;        
	padding-top: 10px;         
}          
#ChoiceReg {     
	margin-top: 5px;     
	margin-bottom: 5px;          
	padding-top: 30px;     
	padding-bottom: 10px;  
	text-align: center;  
	white-space: normal;
	vertical-align: middle;  
}    
#Head {  
	padding: 10px;
} 
.error {
	font-weight: bold;
	color: #F00; 
}
.error1 {
	font-weight: bold; 
	color: #F00;
	display:none;
} 
</style>
<script type="text/JavaScript">
 function TypeSelect(){
    var objS = document.getElementById("Stype");
    var val = objS.options[objS.selectedIndex].value;
	if(val == "Check")
	{
		document.getElementById("tip").style.display="block";
	}
	else 
	{
		document.getElementById("tip").style.display="none";
	}
 } 
</script> 
</head>
<body>   
<div>  
<div id="Head"> 
<h1><center>欢迎登陆在线请假系统</center></h1>  
</div>  
<div>    
<form action="Login" method="post"> 
<div id="ChoiceType">
登陆类型：
<select name="Type" id="Stype" onchange="TypeSelect()">  
  <option value="Student">学生</option>  
  <option value="Teacher">教师</option>   
  <option value="Check">纪检部</option>  
</select>   
</div>     
<center>    
用户名：<input name="UserName" type="text" /><br/>
<span class="error">${username}</span><br><br/> 
密&nbsp;&nbsp;&nbsp;&nbsp;码： 
<input name="Password" type="password" /><br>
<span class="error">${password}</span>
<br/><br/>
</center>
<center>   
<input value="登录" name="" type="submit" />  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
<input value="重置" name="" type="reset" />   
<br/><span class="error">${fail}</span>   
<span class="error">${tip}</span><br>
	<h3 class="error1" id="tip">初始密码和学生账户登陆密码相同</h3> 
</center>   
</form>     
<div id="ChoiceReg">  
  <input name="input" value="学生注册" type="button" onclick="javascript:window.location.href='http://localhost:8080/Leave_System/SReg.jsp'" />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input name="" value="教师注册" type="button" onclick="javascript:window.location.href='http://localhost:8080/Leave_System/TReg.jsp'">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="" value="纪检部注册" type="button" onclick="javascript:window.location.href='http://localhost:8080/Leave_System/CReg.jsp'">
</div>
</div>  
</div>  
</body>  
</html> 
 