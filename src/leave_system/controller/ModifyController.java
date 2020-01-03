package leave_system.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.Teacher;
import leave_system.service.impl.ModifyService_Impl;

@Controller
public class ModifyController {
	@Autowired
	private ModifyService_Impl modifyService_Impl;
	@RequestMapping("SModify")
	public String SModify(HttpSession session,Model model,String SNo,String Password,String OldPassword)
	{
		String oldpassword=modifyService_Impl.SCheck(SNo);
		if(oldpassword!=OldPassword)
		{
			model.addAttribute("NS", "Ô­ÃÜÂë´íÎó");
		}
		else
		{
			modifyService_Impl.SModify(Password, SNo);
			model.addAttribute("Success", "ÐÞ¸Ä³É¹¦");
		}
		session.setAttribute("SNo", SNo);  
		return "SModify";
	}
	@RequestMapping("TINIT")
	public String TINIT(String TNo,HttpSession session)
	{
		Teacher info=modifyService_Impl.TINIT(TNo);
		session.setAttribute("Contact", info.getContact());
		session.setAttribute("TNo1", TNo);
		return "TModify";
	}
	@RequestMapping("TModify")
	public String TModify(HttpSession session,Model model,String TNo,String Password,String OldPassword,String Contact)
	{
		String oldpassword=modifyService_Impl.TCheck(TNo);
		if(oldpassword!=OldPassword)
		{
			model.addAttribute("NS", "Ô­ÃÜÂë´íÎó");
			Teacher info=modifyService_Impl.TINIT(TNo);
			session.setAttribute("Contact", info.getContact());
			session.setAttribute("TNo1", TNo);
			return "TModift";
		}
		else 
		{
			Teacher t=new Teacher();
			t.setPassword(Password);
			t.setContact(Contact);
			modifyService_Impl.TModify(t);
		}
		session.setAttribute("TNo1", TNo);  
		return "TModifyResult"; 
	}
}
