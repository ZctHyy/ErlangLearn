package leave_system.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.Leave;
import leave_system.service.impl.LeaveAskService_Impl;

@Controller
public class MessageTController {
	@Autowired
	private LeaveAskService_Impl  leaveAskService_Impl;
	@RequestMapping("MessageT")
	public String MessageT(String ID,String TNo,String SNo,HttpSession session,Model model)
	{
		boolean check=true;
		String[] TNos=TNo.split(",");
		session.setAttribute("SNo", SNo);
		for(int i=0;i<TNos.length;i++)
		{
			if(!leaveAskService_Impl.TNoCheck(TNos[i]))
			{
				model.addAttribute("fail",TNos[i]+"不存在");
				session.setAttribute("result","fail");
				return "MessageTResult";
			}
		} 
		if(check)
		{
			for(int i=0;i<TNos.length;i++)
			{
				Leave ask1=new Leave();
				ask1.setTNo(TNos[i]); 
				ask1.setID(ID); 
				ask1.setSNo(SNo);
				String already=leaveAskService_Impl.TIDCheck(TNo, ID, SNo);
				if(already==null)
				{
					leaveAskService_Impl.TID(ask1);
				}
				else
				{
					model.addAttribute("already","已通知老师");
					return "MessageTResult";
				}
			} 
		}
		return "MessageTResult";
	}
}
