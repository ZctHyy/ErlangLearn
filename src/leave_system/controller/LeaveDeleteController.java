package leave_system.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.Leave;
import leave_system.service.impl.LeaveDeleteService_Impl;

@Controller
public class LeaveDeleteController {
	@Autowired 
	private LeaveDeleteService_Impl leaveDeleteService_Impl;
	@RequestMapping("DeleteLeave")
	public String DeleteLeave(HttpServletRequest request,Leave leave,Model model)
	{
		
		Leave check=leaveDeleteService_Impl.DLeaveCheck(leave);
		if(check.getPON().equals("等待通过"))
		{
			request.setAttribute("result", "success");
			request.setAttribute("SNo", check.getSNo());
			leaveDeleteService_Impl.DeleteLeave(leave);
			return "SChangeResult";
		}
		else
		{
			request.setAttribute("SNo", check.getSNo());
			request.setAttribute("result", "fail");
			model.addAttribute("already", "假条已审核");
			return "SChangeResult";
		}
	}
}
