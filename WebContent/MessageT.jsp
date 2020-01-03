<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page import="leave_system.entity.*"  %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>通知教师</title>
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
}
.error {
	color: #F00;
	display: none;
}
</style>
<script type="text/JavaScript">
var textNumber = 1;
var NO=0;
function check()
{
	for (var i = 0; i < textNumber; i++) {  
	        if(document.getElementById("VTNo"+i).value==null||document.getElementById("VTNo"+i).value=="")
	        {
	        	document.getElementById("ETZ").style.display="block";
	        	result="fail";
	        	break;
	        }
	        else
	        {
	        	document.getElementById("ETZ").style.display="none";
	        }
	    }  	
}
function addTextBox(afterElement) 
{
  var add=document.getElementById("tnos");
  // Increment the textbox number
  textNumber++;
    NO++;
  // Create the label
  var label = document.createElement("label");
  // Create the textbox
  var textField = document.createElement("input");
  textField.setAttribute("type","text");
  textField.setAttribute("name","TNo"+NO);
  textField.setAttribute("id","VTNo"+NO);
  label.setAttribute("id","TNo"+NO);
  textField.setAttribute("size","20");
  textField.setAttribute("maxsize","30");
  // Add the label's text
  label.appendChild(document.createTextNode("账号"+textNumber+":"));
  // Put the textbox inside
  label.appendChild(textField);
  // Add it all to the form
  add.insertBefore(label,afterElement); 

  document.getElementById("count").value = textNumber;
}


function removeTextBox() {
  if (textNumber > 1) { // If there's more than one text box
    // Remove the last one added 
	var n="TNo"+NO.toString();
 	var e=document.getElementById(n);
	var p=e.parentElement;
    p.removeChild(e);
    textNumber--; 
    NO--;
    document.getElementById("count").value =  textNumber;
  }
}
</script>
</head>
<body>
<div id="bground">  
<div id="curSNo"> 
<%String SNo=(String) request.getAttribute("SNo"); 
session.setAttribute("SNo1",SNo); 
String SDate=(String) request.getAttribute("SDate");
String EDate=(String) request.getAttribute("EDate");
String Time=(String) request.getAttribute("Time");
String ID=(String)request.getAttribute("ID");
%>
当前帐号：${SNo} <%-- 如果setAttribute("SNo1","111");这种会导致${SNo1}无法获取值。此表达式等于session。getAttribute（）; --%>
<a href="login.jsp">注销</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="Sindex.jsp">返回主页</a>
<div>
<table width="100%" border="1">
  <tr>
    <td>学号</td>
    <td>开始日期</td>
    <td>结束日期</td>
    <td>请假时间</td>
    <td>假条ID</td>
  </tr>
    <tr>
    <td><%=SNo %></td>
    <td><%=SDate %></td>
    <td><%=EDate %></td>
    <td><%=Time %></td>
    <td><%=ID %></td>
  </tr>
</table>
<center> 
<form action="MessageT" method="post">
<input id="count" name="count" type="hidden" value="" />
<input name="ID" type="hidden" value="<%=ID %>" />
<input name="SNo" type="hidden" value="<%=SNo %>" />
<div id="tnos">
<p>(请输入教师账号)</p>
<label id="TNo0">账号1:<input id="VTNo0" name="TNo0" type="text" /></label>
<p class="hide" id="btnos"> 
  <input type="button" value="添加" onClick="addTextBox(this.parentNode)" />
  <input type="button" value="删除" onClick="removeTextBox()" /> 
</p> 
<span class="error" id="ETZ">教师名单不能有空</span>
</div>
<input name="" value="通知教师" type="button"  onclick="check()"/>
</form>
</center>
</div>
</div>
</div>
</body>
</html>