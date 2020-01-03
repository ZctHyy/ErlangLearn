package leave_system.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.SRegNum;
import leave_system.entity.Student;
import leave_system.service.impl.SRegNumService_Impl;

@Controller
public class SRegController {
	@Autowired
	private SRegNumService_Impl sRegNumService_Impl;
	@RequestMapping("SRN")
	public String SRegNum(HttpSession session,Model model,String SNo,String RegNum,String Job,String JobDes)
	{
		Student stu=sRegNumService_Impl.SInfor(SNo);
		String College=stu.getCollege();
		SRegNum srn=sRegNumService_Impl.SRN(RegNum,College);
		session.setAttribute("SNo",SNo);
		if(srn!=null)
		{
			if(srn.getUsed().equals("Yes"))
			{
				model.addAttribute("fail","该注册码已被使用");
				return "SWorker";
			}
			else
			{
				if(srn.getCollege().equals(College))
				{ 
					sRegNumService_Impl.SRegUpdate(RegNum);
					Student stu1=new Student();
					stu1.setSNo(SNo);
					stu1.setJob(Job);
					stu1.setJobDes(JobDes);
					sRegNumService_Impl.SUpdate(stu1);
					return "SWorkerResult"; 
				}
				else
				{
					model.addAttribute("fail","该注册码非本学院");
					return "SWorker";
				}
			}
		}
		else
		{
			model.addAttribute("fail","注册码无效");
			return "SWorker";
		}
	}
	
}
