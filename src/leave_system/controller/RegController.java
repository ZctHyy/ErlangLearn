package leave_system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.CRegNum;
import leave_system.entity.Check;
import leave_system.entity.Student;
import leave_system.entity.TRegNum;
import leave_system.entity.Teacher;
import leave_system.service.impl.RegService_Impl;

@Controller
@RequestMapping("Reg")
public class RegController { 
	@Autowired  
	private RegService_Impl regService_Impl;
	@RequestMapping("Student") 
	public String SReg(Model model,Student user,String RePassword)
	{ 
		Student r=regService_Impl.SCheck(user);
		System.out.println(r!=null);
		if(r!=null)
		{
			model.addAttribute("already","���˻��ѱ�ע��");
			return "SReg";
		}
		else
		{
			user.setJob("ѧ��");
			user.setJobDes("��");
			regService_Impl.SReg(user);
			r=regService_Impl.SCheck(user);
			if(r!=null)
			{
					return "login"; 
			}
			else
			{
				model.addAttribute("fail","ע��ʧ������ϵ����Ա");
				return "SReg";
			}
		}
	}
	@RequestMapping("Teacher")
	public String TReg(Model model,Teacher user,String RegNum)
	{
		Teacher c=regService_Impl.TCheck(user);
		if(c!=null)
		{
			model.addAttribute("already","�˻��Ѵ���");
			return "TReg";
		}
		else
		{
			TRegNum trn=new TRegNum(RegNum,user.getCollege());
			if(user.getJob().equals("����Ա"))
			{ 
					TRegNum t=regService_Impl.TRN(trn);
					if(t!=null)
					{
						if(t.getUsed().equals("No"))
						{
							Integer count=regService_Impl.TNameCheck(user);
							int count1=count.intValue();
							if(count1!=0)
							{
								Teacher r=regService_Impl.TCheck(user);
							}
							else
							{
								user.setTName(user.getTName()+count1);
							}
							regService_Impl.TReg(user);
							regService_Impl.TRNUpdate(trn);
							Teacher r=regService_Impl.TCheck(user);
							if(r!=null)
							{
								if(count1!=0)
								{
									model.addAttribute("tip","���ڴ�����ͬ�����Ľ�ʦ���������ֺ󷽼������");
								}
								return "login";
							}
							else
							{
								model.addAttribute("fail","ע��ʧ������ϵ����Ա");
								return "TReg";
							}
						}
						else
						{
							model.addAttribute("wrongRN","ע�����ѱ�ʹ��");
							return "TReg";
						}
					}
					else
					{
						model.addAttribute("wrongRN","�����ڵ�ע����");
						return "TReg";
					}
			}
			else
			{
				regService_Impl.TReg(user);
				Teacher r=regService_Impl.TCheck(user);
				if(r!=null)
				{
					return "login";
				}
				else
				{
					model.addAttribute("fail","ע��ʧ������ϵ����Ա");
					return "TReg";
				}
			}	
		}
	}
	@RequestMapping("Check")
	public String CReg(Check user,Model model,String RegNum)
	{
		Student s=new Student();
		s.setSNo(user.getCNo());
		s=regService_Impl.CInfo(s);
		if(s!=null)
		{
			Check r=regService_Impl.CCheck(user);
			CRegNum crn=new CRegNum(RegNum,s.getCollege());
			if(r!=null)
			{
				model.addAttribute("already","���˺��Ѿ�ע��Ϊ�ͼ첿��Ա");
				return "CReg";
			}
			else
			{
				if(crn!=null)
				{
					if(crn.getUsed().equals("No"))
					{
						user.setPassword(s.getPassword());
						user.setCollege(s.getCollege());
						regService_Impl.CReg(user);
						regService_Impl.CRNUpdate(crn); 
						r=regService_Impl.CCheck(user);
						if(r!=null)
						{
							return "login";
						}
						else
						{
							model.addAttribute("fail","ע��ʧ������ϵ����Ա");
							return "CReg";
						}
					}
					else
					{
						model.addAttribute("wrongRN", "ע�����ѱ�ʹ��");
						return "CReg";
					}
				}
				else
				{
					model.addAttribute("wrongRN", "ע�������");
					return "CReg";
				}
			}
		} 
		else
		{
			model.addAttribute("failSNo","����ע��Ϊ��Уѧ��");
			return "CReg";
		}
	} 
}
