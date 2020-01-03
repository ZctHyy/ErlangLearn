package leave_system.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.Check;
import leave_system.entity.Student;
import leave_system.entity.Teacher; 
import leave_system.service.impl.LoginService_Impl;

@Controller 
public class LoginController {
	@Autowired 
	private LoginService_Impl loginService_Impl;
	@RequestMapping("Login")
	public String Login(HttpSession session,Model model,String UserName,String Password,String Type)//������У�飬һ��ǰ�˲��漰������֤����JS
	{
		String result="";
		if(Type.equals("Student")) 
		{ 
			Student user=new Student();
			user.setSNo(UserName);
			user.setPassword(Password); 
			if(loginService_Impl.SLogin(user)!=null)
			{
				session.setAttribute("SNo1", UserName);
				model.addAttribute("SNo1",UserName);
				result="Sindex";
			}
			else if(UserName==null||Password==null||UserName.equals("")||Password.equals(""))
			{
				if(UserName==null||UserName=="")
				{ 
					model.addAttribute("username","�������û���");
					result="login";
				}
				if(Password==null||Password=="")
				{
					model.addAttribute("password","����������");
					result="login";
				}
			}
			else
			{
				model.addAttribute("fail","�û��˻���������ѧ����");
				result="login";
			}
		}
		if(Type.equals("Teacher"))
		{
			Teacher user=new Teacher();
			user.setTNo(UserName);
			user.setPassword(Password);
			if(loginService_Impl.TLogin(user)!=null)
			{
				Teacher tinfo=loginService_Impl.Tinfo(user);
				session.setAttribute("TNo1", tinfo.getTNo());
				model.addAttribute("TNo1",tinfo.getTNo());
				session.setAttribute("TJob", tinfo.getJob());
				model.addAttribute("TJob",tinfo.getJob());
				if(tinfo.getJob().equals("����Ա"))
				{
					result="Tindex";
				}
				else
				{
					result="Tindex1";
				}
				
			}
			else if(UserName==null||Password==null||UserName.equals("")||Password.equals(""))
			{
				if(UserName==null||UserName=="")
				{ 
					model.addAttribute("username","�������û���");
					result="login";
				}
				if(Password==null||Password=="")
				{
					model.addAttribute("password","����������");
					result="login";
				}
			}
			else
			{
				model.addAttribute("fail","�û��˻���������ѧ����");
				result="login";
			}
		}
		if(Type.equals("Check"))
		{
			Check user=new Check();
			user.setCNo(UserName);
			user.setPassword(Password);
			if(loginService_Impl.CLogin(user)!=null)
			{
				result="SReg";
			}
			else if(UserName==null||Password==null||UserName.equals("")||Password.equals(""))
			{
				if(UserName==null||UserName=="")
				{  
					model.addAttribute("username","�������û���");
					result="login";
				}
				if(Password==null||Password=="")
				{
					model.addAttribute("password","����������");
					result="login";
				}
			}
			else
			{
				model.addAttribute("fail","�û��˻���������ѧ����");
				result="login";
			}
		}
		return result;
	}
}
