package leave_system.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.CRegNum;
import leave_system.entity.SRegNum;
import leave_system.entity.Teacher;
import leave_system.service.impl.LRegNumService_Impl;

@Controller
public class LRegNumController {
	@Autowired
	private LRegNumService_Impl lRegNumService_Impl;
	@RequestMapping("LRegNum")
	public String LRegNum(String TNo,String Type,String Used,HttpSession session)
	{
		Teacher t=lRegNumService_Impl.Tinfo(TNo);
		System.out.println(t.getCollege());
		if(Type.equals("学生干部"))
		{
			SRegNum srn=new SRegNum();
			srn.setCollege(t.getCollege());
			srn.setUsed(Used);
			List<SRegNum> result=lRegNumService_Impl.Sregnum(srn);
			session.setAttribute("result", result);
			session.setAttribute("TNo1",TNo);
			session.setAttribute("Type1",Type);
		}
		else
		{
			CRegNum srn=new CRegNum();
			srn.setCollege(t.getCollege());
			srn.setUsed(Used);
			List<CRegNum> result=lRegNumService_Impl.Cregnum(srn);
			session.setAttribute("result", result);
			session.setAttribute("TNo1",TNo);
			session.setAttribute("Type1",Type);
		}	
		return "LRegNumResult";
	}
}
