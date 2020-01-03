<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>修改假条</title>
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
var textNumber = 1;
var NO=1;
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
	var s=document.getElementById("sdate").value;
	var e=document.getElementById("edate").value;
 	var ec=document.getElementById("cedate").value;
 	var objS = document.getElementById("Ltype");
    var type = document.getElementById("Type").value;
	var TimeType=document.getElementsByName("TimeType");
	var DTime = document.getElementById("DTime").value;
	var CTime=document.getElementById("CTime").value;
	var reason=document.getElementById("Reason").value;//不能命名为reason
	var date = new Date();
	date=formatDate(date);
	var result="success";//当天时间与格式转换
/* 	var date1=new Date("2019-11-01");
	date1=formatDate(date1);
	alert(date1<date); */
	if(TZ[0].checked!=true&&TZ[1].checked!=true)
	{
		document.getElementById("ETZ1").style.display="block";
		result="fail";
	}
	else
	{
		document.getElementById("ETZ1").style.display="none";
	}
	if(TimeType[1].checked!=true&TimeType[0].checked!=true)
	{
		document.getElementById("Ety").style.display="block";
		result="fail";
	}
	else
	{
		document.getElementById("Ety").style.display="none";
	}
	if(TZ[0].checked==true)
	{
		for (var i = 0; i < count; i++) {  
	        if(document.getElementById("TNo"+i).value=="")
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
	if(reason=="")
	{
		document.getElementById("Ereason").style.display="block";
		result="fail";
	}
	else
	{
		document.getElementById("Ereason").style.display="none";
	}
	
if(type=="事假")
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
	if(type=="补假")
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
			alert(date1==""||date2=="");
			if(date1==""||date2=="")
			{
				document.getElementById("sdate3").style.display="block";
				result="fail";
			}
			else
			{
				document.getElementById("sdate3").style.display="none";
			}
			if(date1>date)
			{
				document.getElementById("sdate1").style.display="block";
				result="fail";
			}
			else
			{
				document.getElementById("sdate1").style.display="none";
			}
		}
		if(TimeType[0].checked==true)
		{
			var cedate=new Date(ec);
			cd=formatDate(cedate);
			if(cd<date)
			{
				document.getElementById("Ecdate1").style.display="block";
				result="fail";			
			}
			else
			{
				document.getElementById("Ecdate1").style.display="none";
			}
		}
	}
	if(TimeType[1].checked==true)
	{
		if(DTime=="")
		{
			document.getElementById("ETime").style.display="inline";
			result="fail";
		}
		else
		{
			document.getElementById("ETime").style.display="none";
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
	textNumber = 1;
	document.getElementById("count").value = textNumber;
	txt.style.display="inline";
	txt1.style.display="inline"; 
}
function show3()
{ 
	var txt = document.getElementById("tnos");
	var txt1 = document.getElementById("btnos");
	textNumber = 0;
	document.getElementById("count").value = textNumber; 
	txt.style.display="none";
	txt1.style.display="none";
} 
</script>
<script language="javascript" type="text/javascript" src="assets/My97DatePicker/WdatePicker.js"></script>
<body>
<%
	String SNo=(String) request.getParameter("SNo");
	String SName=(String) request.getParameter("SName");
	String Type=(String) request.getParameter("Type");
	String SDate=(String) request.getParameter("SDate");
	String EDate=(String) request.getParameter("EDate");
	String Time=(String) request.getParameter("Time");
	String PON=(String) request.getParameter("PON");
	String ID=(String) request.getParameter("ID");
	String Reason=(String) request.getParameter("Reason");
%>
<form action="" method="post">
	学号:<input name="SNo" type="text" value="<%=SNo %>" readonly>
    <br/>
              姓名:<input name="SName" type="text" value="<%=SName %>" readonly>
    <br/>
    I&nbsp;&nbsp;&nbsp;&nbsp;D:
    <input name="ID" type="text" value="<%=ID %>" readonly>
    <br/>
              假条类型:
    <input name="Type" type="text" value="<%=Type %>" readonly>
    <br/>
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
<span class="error1" id="sdate1">请选择正确的请假类型,补假日期不可以大于当天日期</span>
<span class="error1" id="sdate2">请选择正确的请假类型,事假日期不可以小于当天日期</span>
<span class="error1" id="sdate3">日期不可以为空</span>
</div> 
</div>
<div id="c" class="hide"> 
<label>请假时间:<input id="cedate" name="CEDate" onFocus="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" size="25"/></label>
<span class="error1" id="Ecdate1">请选择正确的请假类型,补假日期不可以大于当天日期</span>
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

<input class="hide" name="Time" type="text" readonly id="DTime"/>
<span class="error1" id="ETime">时间不可以为空</span>
<br/><br/>
请假原因:<textarea name="Reason" cols="30" rows="5" value="<%=Reason%>"></textarea>
<br/><br/> 
<input name="" type="button" id="submit" value="提交" onclick="Check()">
<input name="" type="reset" value="重置">
</form>
</body>
</html>