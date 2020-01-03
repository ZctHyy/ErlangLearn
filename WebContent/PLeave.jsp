<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>多人公假</title>
</head>
<style type="text/css">
#bg {
	margin: 0px;
	padding: 0px;
	height: 100%;
	width: 100%;
	color: black;
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
#data1 {
	padding: 0px;
	margin-left: 20px;
} 
#data0 {
	float: left;
	margin-right: 20px;
}
#reason {
	text-align: left;
	vertical-align: middle;
}
.hide {
	display: none;
}
.error1 {
	font-weight: bold;
	color: red;
	display:none;
}
</style>

<script type="text/JavaScript">
//判断空,原因是否空，时间是否正确，教师号N是否为空，请假时长是否为空
var textNumber = 0;
var NO=1;
var count =1;
document.getElementById("count").value = count;
function formatDate(date) {
    var myyear = date.getFullYear();
    var mymonth = date.getMonth() + 1;
    var myweekday = date.getDate();
 
    if (mymonth < 10) {
        mymonth = "0" + mymonth;
    }
    if (myweekday < 10) {
        myweekday = "0" + myweekday;
    }
    return (myyear + "-" + mymonth + "-" + myweekday);
}

function TimeChange()
{ 
	var txt1=document.getElementById("DTime");
	var s=document.getElementById("sdate").value;
	var e=document.getElementById("edate").value;
	ed = e.replace(/-/g,'/');
	sd = s.replace(/-/g, '/');
	// 创建日期对象
	var sdate = new Date(sd);
	var edate = new Date(ed);
	txt1.value= ((edate-sdate)/(24*60*60*1000))+1;
}

function Check()
{ 
	var TZ=document.getElementsByName("TZ");
	var count=document.getElementById("count").value;
	var s=document.getElementById("sdate").value;
	var e=document.getElementById("edate").value;
 	var ec=document.getElementById("cedate").value;
 	var objS = document.getElementById("Ltype");
    var type = "公假";
	var TimeType=document.getElementsByName("TimeType");
	var DTime = document.getElementById("DTime").value;
	var CTime=document.getElementById("CTime").value;
	var reason=document.getElementById("Lreason").value;//不能命名为reason
	var date = new Date();
	date=formatDate(date);
	var result="success";//当天时间与格式转换
	if(TimeType[1].checked!=true&TimeType[0].checked!=true)
	{
		document.getElementById("Ety").style.display="block";
		result="fail";
	}
	else
	{
		document.getElementById("Ety").style.display="none";
	}
	for(var i=0;i<count;i++) 
	{  
		if(document.getElementById("TNo"+i).value==null)
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
	if(reason=="")
	{
		document.getElementById("Ereason").style.display="block";
		result="fail";
	}
	else
	{
		document.getElementById("Ereason").style.display="none";
	}
	
	if(type=="公假")
	{
		if(TimeType[1].checked==true)
		{
			if(s==""||e=="")
			{
				document.getElementById("sdate3").style.display="block";
				result="fail";
			}
			else
			{
				document.getElementById("sdate3").style.display="none";
			}
			var date1=new Date(s);
			var date2=new Date(e);
			date1=formatDate(date1);
			date2=formatDate(date2);
			if(date1<date)
			{
				document.getElementById("sdate2").style.display="block";
				result="fail";
			}
			else
			{
				document.getElementById("sdate2").style.display="none";
			}
			if(date1>date2)
			{
				document.getElementById("edate1").style.display="block";
				result="fail";
			}
			else
			{
				document.getElementById("edate1").style.display="none";
			}
		}
		if(TimeType[0].checked==true)
		{
			var cedate=new Date(ec);
			cd=formatDate(cedate);
			if(cd<date)
			{
				document.getElementById("Ecdate2").style.display="block";
				result="fail";
			}
			else
			{
				document.getElementById("Ecdate2").style.display="none";
			}
		}
	}
	if(TimeType[0].checked==true)
	{
		if(CTime=="")
		{
			document.getElementById("ETime").style.display="inline";
			result="fail";
		}
		else
		{
			document.getElementById("ETime").style.display="none";
		}
	}
	if(result=="success")
	{
		document.getElementById("submit").type="submit";
	}
}
function addTextBox(afterElement) 
{
  var add=document.getElementById("tnos");
  // Increment the textbox number
  textNumber++;
  // Create the label
  var label = document.createElement("label");
  // Create the textbox
  var textField = document.createElement("input");
  textField.setAttribute("type","text");
  textField.setAttribute("name","TNo"+NO);
  textField.setAttribute("id","TNo"+NO);
  label.setAttribute("id","LTNo"+NO);
  textField.setAttribute("size","20");
  textField.setAttribute("maxsize","30");
  // Add the label's text
  label.appendChild(document.createTextNode("账号"+NO+":"));
  // Put the textbox inside
  label.appendChild(textField);
  // Add it all to the form
  add.insertBefore(label,afterElement);
  NO++;
  count++;
  document.getElementById("count").value = count;
}

function removeTextBox() {
  if (textNumber >= 1) { // If there's more than one text box
    // Remove the last one added 
	var n="LTNo"+textNumber.toString();
    var e=document.getElementById(n);
	var p=e.parentElement;
    p.removeChild(e);
    textNumber--;
    NO--;
    count--;
    document.getElementById("count").value = count;
  }
}

function show0()
{ 
	document.getElementById("d").style.display="none";
	document.getElementById("c").style.display="block";
	var txt = document.getElementById("DTime");
	var txt1 = document.getElementById("CTime");
	txt1.style.display="inline";
	txt.style.display="none";
}

function show1()
{
	document.getElementById("d").style.display="block";
	document.getElementById("c").style.display="none";
	var s=document.getElementById("sdate").value;
	var e=document.getElementById("edate").value;
	var txt = document.getElementById("CTime");
	var txt1 = document.getElementById("DTime");
	txt.style.display="none";	 
	txt1.style.display="inline";
	/* 	var sArr = s.split("-");
	var eArr = e.split("-");
	var sRDate = new Date(sArr[0], sArr[1]-1, sArr[2]);月份从0到11
	var eRDate = new Date(eArr[0], eArr[1]-1, eArr[2]);
	var days = (eRDate-sRDate)/(24*60*60*1000) */
}

function show2()
{ 
	var txt = document.getElementById("tnos");
	var txt1 = document.getElementById("btnos");
	textNumber = 0;
	document.getElementById("count").value = 1;
	txt.style.display="inline";
	txt1.style.display="inline"; 
}
function show3()
{ 
	var txt = document.getElementById("tnos");
	var txt1 = document.getElementById("btnos");
	textNumber = 0;
	document.getElementById("count").value = 1; 
	txt.style.display="none";
	txt1.style.display="none";
} 
</script>
<script language="javascript" type="text/javascript" src="assets/My97DatePicker/WdatePicker.js"></script>
<body>
<div id="bg">
<div id="curSNo"> 
当前帐号：${SNo}
<a href="login.jsp">注销</a>
</div>
<div id="headT"> 
<h1><center>在线请假</center></h1>
</div>
<div id="content">
<form action="PLeave1.jsp" method="post">
请假类型:<select name="Type" id="Ltype"> 
  <option value="公假">公假</option>
</select>
<br/><br/>
时长单位:
<label>
 <input type="radio" name="TimeType" value="课程" id="TimeType" onclick="show0()"/>
    课程</label>
   <label>
   <input type="radio" name="TimeType" value="天" id="TimeType" onclick="show1()"/>
     天</label>
<br/>
<span class="error1" id="Ety">请选择时长单位</span><br/>
<div id="d" class="hide">
<div id="data0">
<label>开始日期:<input id="sdate" name="SDate" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" size="25"/></label>
</div>
<div id="data1">
<label>结束日期:<input id="edate" name="EDate" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" size="25" onchange="TimeChange()"/></label>
<span class="error1" id="edate1">开始日期不可以大于结束日期</span>
<span class="error1" id="sdate2">请选择正确的请假类型,事假日期不可以小于当天日期</span>
<span class="error1" id="sdate3">日期不可以为空</span>
</div>
</div>
<div id="c" class="hide"> 
<label>请假时间:<input id="cedate" name="CEDate" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" size="25"/></label>
<span class="error1" id="Ecdate2">请选择正确的请假类型,事假日期不可以小于当天日期</span>
<span class="error1" id="Ecdate3">日期不可以为空</span>
</div>
<br/>

请假时长:
<select class="hide" name="Time" size="3" multiple="multiple" id="CTime">
  <option value="一">第一大节</option>
  <option value="二">第二大节</option>
  <option value="三">第三大节</option>
  <option value="四">第四大节</option>
  <option value="五">第五大节</option>
</select> 

<input class="hide" name="Time" type="text" readonly="readonly" id="DTime"/>
<span class="error1" id="ETime">时间不可以为空</span>
<br/><br/>
<div id="reason"> 
请假原因:<textarea id="Lreason" name="Reason" cols="50" rows="5"></textarea>
</div>
<br/>
<span class="error1" id="Ereason">请假原因不能为空</span>
<br/><br/>
<div id="tnos">
<p>(请输入学号)自己要请假的话也要填进去</p>
<span class="error1" id="ETZ">学生名单不能有空</span>
<label id="LTNo0">账号0:<input id="TNo0"  name="TNo0" type="text" /></label>
<p id="btnos"> 
  <input type="button" value="添加" onClick="addTextBox(this.parentNode)" />
  <input type="button" value="删除" onClick="removeTextBox()" /> 
</p> 
</div>
 <input type="hidden" name="count" id="count" value="1"  />   
 <input type="hidden" name="SNo"  value="${SNo}"/>   
<br/><br/>
<input name="" type="button" id="submit" value="提交" onclick="Check()">
<input name="" type="reset" value="重置">
</form>
</div>
</div>
</body>
</html>
</html>
