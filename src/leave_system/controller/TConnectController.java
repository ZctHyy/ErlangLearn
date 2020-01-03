package leave_system.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.Teacher;
import leave_system.service.impl.TConnectService_Impl;

@Controller
public class TConnectController {
	@Autowired
	private TConnectService_Impl tConnectService_Impl;
	@RequestMapping("TConnect")
	public String BeginSearch(String SNo,HttpServletRequest request)
	{ 
		List<Teacher> result= tConnectService_Impl.BeginSearch();
		request.setAttribute("SNo", SNo); 
		request.setAttribute("result", result);
		return "TConnect";
	}
	@RequestMapping("CollegeSearch")
	public String CollegeSearch(String SNo,String College,HttpServletRequest request)
	{
		List<Teacher> result1= tConnectService_Impl.BeginSearch();
		List<Teacher> result= tConnectService_Impl.CollegeSearch(College);
		if(result.size()==0)
		{
			Teacher no=new Teacher();
			no.setTNo("无数据");
			no.setTName("无数据");
			no.setCollege("无数据");
			no.setJob("无数据");
			no.setGrade("无数据");
			no.setContact("无数据");
			result.add(no);
		}
		request.setAttribute("SNo", SNo); 
		request.setAttribute("result", result1);
		request.setAttribute("Cresult", result);
		return "TConnect";
	}
	@RequestMapping("UTN")
	public String UTN(String TNo,String SNo,HttpServletRequest request)
	{
		List<Teacher> result1= tConnectService_Impl.BeginSearch();
		List<Teacher> result= tConnectService_Impl.UTN(TNo);
		if(result.size()==0)
		{
			Teacher no=new Teacher();
			no.setTNo(TNo);
			no.setTName("无数据");
			no.setCollege("无数据");
			no.setJob("无数据");
			no.setGrade("无数据");
			no.setContact("无数据");
			result.add(no);
		}
		request.setAttribute("result", result1);
		request.setAttribute("SNo", SNo); 
		request.setAttribute("Cresult", result);
		return "TConnect";
	}
	@RequestMapping("NTU")
	public String NTU(String TName,String SNo,HttpServletRequest request)
	{
		List<Teacher> result1= tConnectService_Impl.BeginSearch();
		List<Teacher> result= tConnectService_Impl.NTU(TName);
		if(result.size()==0)
		{
			Teacher no=new Teacher();
			no.setTNo("无数据");
			no.setTName(TName);
			no.setCollege("无数据");
			no.setJob("无数据");
			no.setGrade("无数据");
			no.setContact("无数据");
			result.add(no); 
		} 
		request.setAttribute("result", result1);
		request.setAttribute("SNo", SNo); 
		request.setAttribute("Cresult", result);
		return "TConnect";
	}
}
