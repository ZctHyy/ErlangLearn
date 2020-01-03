<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="leave_system.entity.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>查看请假</title>
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
	display: none;
}
#hide {
	display: none;
}
.error {
	color: #F00;
	display: none;
}
#tips {
	font-size: 12px;
	color: #F00;
}
#type {
	display: none;
}
#time1 {
	display: none;
}
#bod {
	display: none;
	padding-left: 25%;
}
#back {
	font-family: Roboto;
	text-align: right;
	color: black;
	text-decoration: none;
}
#back a {
	font-family: Roboto;
	font-size: 12px;
	color: black;
	text-decoration: none;
}
body {
	font-family: Roboto;
	color: black;
}
#DOC {
	display: none;
}
#college {
	width: 25.5%;
}
#major {
	width:25.5%;
}
#class1 {
	width: 25.5%;
}
</style>
<script type="text/javascript">
 function Lchange()
 { 
	document.getElementById("change").action="SChange1.jsp";
	document.getElementById("changeL").type="submit";	 
 }
 function Ldelete()
 {
 	document.getElementById("change").action="DeleteLeave";
	document.getElementById("deleteL").type="submit";
 }
 function ct1()
 {
  	document.getElementById("search").style.display="block";
	document.getElementById("bod").style.display="none";	 
 }
 function ct2()
 {
	 	document.getElementById("search").style.display="none";
	document.getElementById("bod").style.display="block";
 }
 function Search(){
    var val = document.getElementById("sid").value;
	if(val.length<9)
	{
		document.getElementById("serror1").style.display="block";
		document.getElementById("serror2").style.display="none";	
	}
	else if(val.substr(0,1)!="A"&val.substr(0,1)!="B"&val.substr(0,1)!="C")
	{
		document.getElementById("serror1").style.display="none";
		document.getElementById("serror2").style.display="block";	
	}
	else
	{
		document.getElementById("serror1").style.display="none";
		document.getElementById("serror2").style.display="none";
		document.getElementById("sub").type="submit";
	}
 } 
function show0()
{ 
var txt = document.getElementById("time");
var SHOW = document.getElementById("DOC");
	txt.style.display="inline";
	SHOW.style.display="inline";
	txt.value="";
}
function hide0()
{
var txt = document.getElementById("time");
var txt1 = document.getElementById("time1");
	txt.value="全部, ";
	txt.style.display="none";
	txt1.style.display="none";
}

function show2()
{ 
var txt1 = document.getElementById("collegea");
var txt = document.getElementById("college");
txt1.value="";
	txt.style.display="inline";
}
function hide2()
{
	var txt1 = document.getElementById("collegea");
	var txt = document.getElementById("college");
	txt1.value="全部, "; 
	txt.style.display="none";	
}

function show3()
{ 
	var txt1 = document.getElementById("class1a");
var txt = document.getElementById("class1");
txt1.value="";
	txt.style.display="inline";
}
function hide3()
{
	var txt1 = document.getElementById("class1a");
var txt = document.getElementById("class1");
txt1.value="全部, "; 
	txt.style.display="none";	
}

function show4()
{ 
var show=document.getElementById("show");
var txt = document.getElementById("pre");
var txt1 = document.getElementById("class1");
var txt2 = document.getElementById("major");
var txt3 = document.getElementById("college");
var txt5 = document.getElementById("grade");
txt1.value="全部, ";
txt2.value="全部, ";
txt3.value="全部, ";
txt5.value="全部, ";
txt.value="";
show.style.display="none";
txt.style.display="inline";
}
function hide4()
{
	var show=document.getElementById("show");
	var txt = document.getElementById("pre");
	txt.value="全部, "; 
	txt.style.display="none";	
	show.style.display="inline";
}



function show6()
{ 
var txt1 = document.getElementById("majora");
var txt = document.getElementById("major");
txt1.value="";
txt.style.display="inline"; 
}
function hide6()
{
var txt1 = document.getElementById("majora");
var txt = document.getElementById("major");
txt1.value="全部, ";
txt.style.display="none";	
}

function set_class()
{  
	var objdbConn = new ActiveXObject("ADODB.Connection");    
	var strdsn = "Driver={SQL Server};SERVER=(local);UID=zcthyy;PWD=hyy5201314ILU;DATABASE=study";    
	objdbConn.Open(strdsn);      
	var c=document.getElementById("class1"); 
	var m=document.getElementById("major"); 
	var mv=m.value;
	var sql1="SELECT Name FROM Class where Major='"+mv+"'";
    if(mv=='0')
    {
    	c.options.length=0;
    	var ci=new Option();
    	ci.text ="请选择班级";
    	ci.value ="0";
    	c.options.add(ci); 
    } 
    var objrs = objdbConn.Execute(sql1);// 输入本地的表  
    var fdCount = objrs.Fields.Count;           
    if (!objrs.EOF)
    {    
    	  c.options.length=0;
    	  var c1=new Option();
      	  c1.text ="请选择班级";
      	  c1.value ="0";
      	  c.options.add(c1); 
      while (!objrs.EOF)
      {        
        for (i=0; i <fdCount; i++)  
        {   
  
        	var ci=new Option();
	    	ci.text = objrs.Fields(i).Value;
        	ci.value = ci.text ;
        	c.options.add(ci); 
        }         
        objrs.moveNext();        
      }   
    }    
    else  
    {
    		c.options.length=0;
        	var ci=new Option();
        	ci.text ="请选择班级";
        	ci.value ="0";
        	c.options.add(ci); 
    } 
    objrs.Close();                           
    objdbConn.Close();                      
}

function set_major()
{
	var objdbConn = new ActiveXObject("ADODB.Connection");    
	var strdsn = "Driver={SQL Server};SERVER=(local);UID=zcthyy;PWD=hyy5201314ILU;DATABASE=study";    
	objdbConn.Open(strdsn);      
	var cl=document.getElementById("class1"); 
	var c=document.getElementById("college"); 
	var m=document.getElementById("major"); 
	var cv=c.value;
	var sql="SELECT Name FROM Major where College='"+cv+"'";
    if(cv=='0')
    {
    	m.options.length=0;
    	cl.options.length=0;
    	var cl1=new Option();
		cl1.text = "请选择班级";
		cl1.value = "0"; 
		cl.options.add(cl1); 
    	var mi=new Option();
    	mi.text ="请选择专业";
    	mi.value ="0";
    	m.options.add(mi); 
    } 
    var objrs = objdbConn.Execute(sql);// 输入本地的表  
    var fdCount = objrs.Fields.Count;           
    if (!objrs.EOF)
    {         
    	cl.options.length=0;
    	var cl1=new Option();
		cl1.text = "请选择班级";
		cl1.value = "0"; 
		cl.options.add(cl1); 
		
    	m.options.length=0;
  	  	var m1=new Option();
		m1.text = "请选择专业";
		m1.value = "0"; 
		m.options.add(m1); 
      while (!objrs.EOF)
      {          
        for (i=0; i <fdCount; i++)  
        {     
        	var mi=new Option();
        	mi.text = objrs.Fields(i).Value;
        	mi.value = mi.text;
        	m.options.add(mi); 
        }           
        objrs.moveNext();    
      }  
    }   
    else  
    {
        	cl.options.length=0;
        	var cl1=new Option();
    		cl1.text = "请选择班级";
    		cl1.value = "0"; 
    		cl.options.add(cl1); 
    		m.options.length=0;
      	  	var m1=new Option();
    		m1.text = "请选择专业";
    		m1.value = "0"; 
    		m.options.add(m1); 
    } 
    objrs.Close();                           
    objdbConn.Close();                      
}
</script>
<body>
<h1><center>请选择统计类型</center></h1>
<div id="bg">
<div id="curSNo"> 
<% 
/* String TNo1=(String) session.getAttribute("TNo1");
session.setAttribute("TNo",TNo1);
Leave r=(Leave)session.getAttribute("result"); */
%>
当前帐号：${TNo1} <%-- 如果setAttribute("SNo1","111");这种会导致${SNo1}无法获取值。此表达式等于session。getAttribute（）; --%>
<a href="login.jsp">注销</a>
</div>
<div id="choose"> 
<center>
      <label>
        <input type="radio" name="ct" value="精确" onclick="ct1()"/>
        精确查找</label>
      <label>
        <input type="radio" name="ct" value="类型" onclick="ct2()" />
        类型查找</label>
      <br />
</center>
</div>
<div id="search">
<form action="ChangeIDSearch" method="post"> 
<center>
假条ID：<input name="ID" type="text" id="sid"/>
<input name="Student" type="hidden" value="" />
<br/>
<span id="serror1" class="error">请输入正确的假条ID</span>
<span id="serror2" class="error">请输入正确的假条ID>>A类型为事假，B类型为公假，C类型为补假</span>
<br/>
<input name="" type="button"  id="sub" value="提交" onclick="Search()"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input name="" type="reset" value="重新填写" />
</center>
</form>
</div>
<div id="bod">
<form action="lookleave" method="post">
假条状态：
<select name="PON">
  <option value="全部">全部</option>
  <option value="同意">同意</option>
  <option value="拒绝">拒绝</option>
  <option value="等待通过">等待通过</option>
  
</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
类型:
  <select name="status" >
  	<option value="公假">公假</option>
  	<option value="补假">补假</option>
  	<option value="事假">事假</option>
  	<option value="全部" >全部</option>
  </select>
<br/>


<div id="show">
学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;院:&nbsp;   
<input name="collegea" id="collegea" type="hidden" value="">
    <select name="college" id="college" onChange="set_major();">
    <option value="0">选择学院</option>
    </select>
   <label>
      <input type="radio" name="college1" value="全部" id="RadioGroup1_0" onclick="hide2()"/>
      全部</label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <label>
      <input type="radio" name="college1" value="" id="RadioGroup1_1" onclick="show2()"/>
      精确</label>
<br />

专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业:
<input name="majora" id="majora" type="hidden" value="">
 <select name="major" id="major" onChange="set_class();">
    <option value="0">选择专业</option>
    </select>
   <label>
      <input type="radio" name="major1" value="全部" id="RadioGroup1_0" onclick="hide6()"/>
      全部</label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <label> 
      <input type="radio" name="major1" value="" id="RadioGroup1_1" onclick="show6()"/>
      精确</label> 
<br />

班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级:
<input name="class1a" id="class1a"  type="hidden" value="">
    <select  name="class1" id="class1">
    <option value="0">选择班级</option>
    </select>
   <label>
      <input type="radio" name="class2" value="全部" id="RadioGroup1_0" onclick="hide3()"/>
      全部</label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <label>
      <input type="radio" name="class2" value="" id="RadioGroup1_1" onclick="show3()"/>
      精确</label>
<br />

</div>
个&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人:
<input name="pre" type="text" id="pre"/>    
   <label>
      <input type="radio" name="pre1" value="全部" id="RadioGroup1_0" onclick="hide4()"/>
      全部</label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <label>
      <input type="radio" name="pre1" value="" id="RadioGroup1_1" onclick="show4()"/>
      精确</label>
<br />
    <input name="user" type="hidden" value=""/>
  	<input name="UserName" type="hidden" value="">
    <input name="" type="submit" value="查询">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input name="" type="reset" value="重置">
</form>
</div>
</div>
</body>
</html>