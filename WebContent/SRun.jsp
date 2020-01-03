<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="leave_system.entity.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>登记逃课</title>
</head>
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
  label.appendChild(document.createTextNode("学号"+textNumber+":"));
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
<script language="javascript" type="text/javascript" src="assets/My97DatePicker/WdatePicker.js"></script>
<body>
<div id="bg">
<div id="curSNo"> 
<% 
String TNo1=(String) session.getAttribute("TNo1");
session.setAttribute("TNo",TNo1);
%>
当前帐号：${TNo1} <%-- 如果setAttribute("SNo1","111");这种会导致${SNo1}无法获取值。此表达式等于session。getAttribute（）; --%>
<a href="login.jsp">注销</a>
</div>
<h1><center>登记逃课</center></h1>
<form action="SRun1.jsp" method="post">
<center>
<label>逃课日期:<input id="Date" name="Date" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" size="25"/></label>
<br/><br/>
逃课时间:<select name="Time">
  <option value="一">第一大节</option>
  <option value="二">第二大节</option>
  <option value="三">第三大节</option>
  <option value="四">第四大节</option>
  <option value="五">第五大节</option>
</select>
<div id="tnos">
<p>(请输入逃课名单)</p>
<label id="TNo0">学号1:<input id="VTNo0" name="TNo0" type="text" /></label>
<p id="btnos"> 
  <input type="button" value="添加" onClick="addTextBox(this.parentNode)" />
  <input type="button" value="删除" onClick="removeTextBox()" /> 
</p> 
<span class="error" id="ETZ">逃课名单不能有空</span>
</div>
<input value="" name="count" type="hidden" />
<input value="${TNo1 }" name="TNo" type="hidden" />
<input name="" value="登记逃课" type="button"  onclick="check()"/>
</center>
</form>
</div>
</body>
</html>