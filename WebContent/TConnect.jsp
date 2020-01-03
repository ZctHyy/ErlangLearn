<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page import="leave_system.entity.*"  %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教师联系方式</title>
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
#ChoiceCollege {
	display: none;
}
#NameSearch {
	display: none;
}
#UTN {
	display: none;
}
#NTU {
	display: none;
}
</style>
</head>
<script type="text/JavaScript">
function choiceC()
{
	document.getElementById("ChoiceCollege").style.display="block";
	document.getElementById("NameSearch").style.display="none";
}
function choiceN()
{
	document.getElementById("ChoiceCollege").style.display="none";
	document.getElementById("NameSearch").style.display="block";
}
function FUTN()
{
	document.getElementById("UTN").style.display="block";
	document.getElementById("NTU").style.display="none";
}
function FNTU()
{
	document.getElementById("UTN").style.display="none";
	document.getElementById("NTU").style.display="block";
}
</script>
<body>
<div id="bground">  
<div id="curSNo"> 
<%
List<Teacher> Cresult=(List<Teacher>)request.getAttribute("Cresult");
List<Teacher> result=(List<Teacher>) request.getAttribute("result");
String SNo=(String) request.getAttribute("SNo"); 
session.setAttribute("SNo1",SNo); 
%>
当前帐号：${SNo} <%-- 如果setAttribute("SNo1","111");这种会导致${SNo1}无法获取值。此表达式等于session。getAttribute（）; --%>
<a href="login.jsp">注销</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="Sindex.jsp">返回主页</a>
</div>
<center><h1>教师联系方式查看</h1></center>
<center>
  <label>
    <input type="radio" name="ChoiceType" value="单选" id="ChoiceType_0" onclick="choiceC()"/>
    按学院查看</label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <label>
    <input type="radio" name="ChoiceType" value="单选" id="ChoiceType_1" onclick="choiceN()"/>
    按名查看</label>
</center>
  <br /> 
<div id="ChoiceCollege">
<center>
  <form action="CollegeSearch" method="post">
学院名称：
  <select name="College">
  <%
  for(int i=0;i<result.size();i++)
  {
	Teacher t=result.get(i); 
  %>
  	<option value="<%=t.getCollege() %>"><%=t.getCollege()%></option>
  <%
  }
  %>
  </select>
<br/><br/>
<input name="SNo" type="hidden" value="${SNo}"/>
<input name="" type="submit" value="查看" />
</form>
</center>
</div>

<div id="NameSearch">
<center>
  <label>
    <input type="radio" name="UN" value="NtoU" id="UampN_0" onclick="FNTU()"/>
    姓名转用户名</label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <label>
    <input type="radio" name="UN" value="UtoN" id="UampN_1" onclick="FUTN()" />
    用户名转姓名</label>
</center>
<br /> 
<form action="NTU" method="post" id="NTU">
<center>
请输入教师姓名：<input name="TName" type="text" />
<input name="SNo" type="hidden" value="${SNo}"/>
<br/><br/>
<input name="" type="submit" value="提交" />
</center>
</form> 
<form action="UTN" method="post" id="UTN">
<center>
请输入教师用户名：<input name="TNo" type="text" />
<input name="SNo" type="hidden" value="${SNo}"/>
<br/><br/>
<input name="" type="submit" value="提交" />
</center>
</form> 
</div> 
<div>
<table width="100%" border="1">
  <tr>
    <td>用户名</td>
    <td>教师名</td>
    <td>所属学院</td>
    <td>职位</td>
    <td>负责年级</td>
    <td>联系方式</td>
  </tr>
<%
if(Cresult!=null)
{
	for(int j=0;j<Cresult.size();j++)
	{
		Teacher t=Cresult.get(j);
%>
  <tr>
    <td><%=t.getTNo() %></td>
    <td><%=t.getTName() %></td>
    <td><%=t.getCollege() %></td>
    <td><%=t.getJob() %></td>
    <td><%=t.getGrade() %></td>
    <td><%=t.getContact() %></td> 
  </tr>
<% 
	}
}
%>
</table>
</div>
</div>
</body>
</html>
