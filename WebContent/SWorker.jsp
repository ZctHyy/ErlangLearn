<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>我是学生干部</title>
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
.error {
	color: #F00;
	display: none;
}
.error1 {
	color: #F00;
}
</style>
</head>
<script type="text/JavaScript">
function check()
{
	var n=document.getElementById("num").value;
	if(n=="")
	{
		document.getElementById("empty").style.display="block";
	}
	else
	{
		document.getElementById("empty").style.display="none";
		document.getElementById("sub").type="submit";
	}
}
</script>
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
<center><h1>我是学生干部</h1></center>
<h3><center>请询问辅导员拿取注册码</center></h3>
<form action="SRN" method="post">
<center>
学生干部注册号：<input name="Regnum" id="num" type="text"/>
职位类型：<select name="Job">
  <option value="班干部">班干部</option>
  <option value="学生干部">学生干部</option>
</select>
职位描述：<input name="JobDes" type="text" size="15" maxlength="15" />
<input name="SNo" type="hidden" value="<%=SNo %>"/>
<br/>
<span class="error" id="empty">请输入注册码</span>
<span class="error1" id="fail">${fail}</span>
<br/> 
<input name="" value="提交" id="sub" type="button" onclick="check()" />
</center>
</form>
</div>
</body>
</html>