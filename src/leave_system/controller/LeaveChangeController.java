package leave_system.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.Leave;
import leave_system.service.impl.LeaveChangeService_Impl;
import leave_system.service.impl.LeaveDeleteService_Impl;

@Controller
public class LeaveChangeController {
	@Autowired 
	private LeaveDeleteService_Impl leaveDeleteService_Impl;
	private LeaveChangeService_Impl leaveChangeService_Impl;
	@RequestMapping("ChangeIDSearch")
	public String IDSearch(HttpSession session,String ID,String Student,Model model)
	{ 
		Leave result=leaveChangeService_Impl.SearchLeave(ID,Student);
		List<Leave> result1=new ArrayList();
		result1.add(result);
		session.setAttribute("result", result1);
		return "SChange";
	}
	@RequestMapping("ChangeTypeSearch")
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
		List<Leave> result=leaveChangeService_Impl.TypeSearchLeave(Type,Student);
		System.out.println(result.size());
		session.setAttribute("result", result);
		return "SChange";
	}
	@RequestMapping("LeaveChange")
	public String LeaveChange(HttpServletRequest request,Leave leave,Model model)
	{
		Leave check=leaveDeleteService_Impl.DLeaveCheck(leave);
		if(check.getPON().equals("等待通过"))
		{
			SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd" );
			Date date= new Date();
			String upload = sdf.format(date);
			leave.setLoadDate(upload);
			leaveChangeService_Impl.ChangeLeave(leave);
			return "SChangeResult";
		}
		else 
		{
			request.setAttribute("SNo", leave.getSNo());
			request.setAttribute("result", "fail");
			model.addAttribute("already", "假条已审核");
			return "SChangeResult";
		}
	}
}
