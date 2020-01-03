package leave_system.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.Leave;
import leave_system.service.impl.LeaveSearchService_Impl;

@Controller
public class LeaveSearchController {
@Autowired
private LeaveSearchService_Impl leaveSearchService_Impl;
	@RequestMapping("LSearch")
	public String LeaveSearch(HttpSession session,String ID,String Student,Model model)
	{ 
		Leave result=leaveSearchService_Impl.SearchLeave(ID,Student);
		List<Leave> result1=new ArrayList();
		result1.add(result);
		session.setAttribute("result", result1);
		return "SLSearch";
	}
	/*@RequestMapping("IDSearch")
	public String IDSearch(HttpSession session,String ID,String Student,Model model)
	{ 
		Leave result=leaveSearchService_Impl.SearchLeave(ID,Student);
		List<Leave> result1=new ArrayList();
		result1.add(result);
		session.setAttribute("result", result1);
		return "SChange";
	}
	@RequestMapping("TypeSearch")
	public String TypeSearch(HttpSession session,String[] Types,String Student,Model model)
	{
		boolean tall=false;
		List<String> Type=new ArrayList(); 
		if(Types==null)
		{
			Type.add("事假");
			Type.add("公假");
			Type.add("补假");
		}
		else
		{
			for(int i=0;i<Types.length;i++)
			{
				if(Types[i].equals("全部"))
				{
					tall=true;
					break;
				}
			}
			if(!tall)
			{
				for(int i=0;i<Types.length;i++)
				{
						Type.add(Types[i]);
				}
			}
			else 
			{
				Type.add("事假");
				Type.add("公假");
				Type.add("补假");
			}
		} 
		System.out.println(Student);
		List<Leave> result=leaveSearchService_Impl.TypeSearchLeave(Type,Student);
		System.out.println(result.size());
		session.setAttribute("result", result);
		return "SChange";
	}*/
	@RequestMapping("HistorySearch")
	public String HistorySearch(HttpSession session,String[] Types,String Student,Model model)
	{
		boolean tall=false;
		List<String> Type=new ArrayList();
		if(Types==null)
		{
			Type.add("事假");
			Type.add("公假");
			Type.add("补假");
		}
		else
		{
			for(int i=0;i<Types.length;i++)
			{
				if(Types[i].equals("全部"))
				{
					tall=true;
					break;
				}
			}
			if(!tall)
			{
				for(int i=0;i<Types.length;i++)
				{
						Type.add(Types[i]);
				}
			}
			else 
			{
				Type.add("事假");
				Type.add("公假");
				Type.add("补假");
			} 
		} 
		System.out.println(Student);
		List<Leave> result=leaveSearchService_Impl.TypeSearchLeave(Type,Student);
		System.out.println(result.size());
		session.setAttribute("result", result);
		return "SLHistory"; 
	}
}
