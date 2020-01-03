package leave_system.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.Leave;
import leave_system.entity.Teacher;
import leave_system.service.impl.GenRegNumService_Impl;

@Controller
public class GenRegNumController {
	@Autowired
	private GenRegNumService_Impl genRegNumService_Impl;
	@RequestMapping("GenRegNum")
	public String GenRegNum(HttpSession session,String Num,String TNo,String Type)
	{
		Teacher tinfo=genRegNumService_Impl.Tinfo(TNo);
		int n=Integer.valueOf(Num);
		String[] result=new String[n];
		for(int i=0;i<n;i++)
		{
			String r=RID(Type);
			if(Type.equals("纪检部"))
			{
				while(genRegNumService_Impl.CGenCheck(r, tinfo.getCollege()))
				{
					r=RID(Type);
				}
				result[i]=r;
			}
			else
			{
				while(genRegNumService_Impl.SGenCheck(r, tinfo.getCollege()))
				{
					r=RID(Type);
				}
				result[i]=r;
			}
		}
		session.setAttribute("result", result);
		session.setAttribute("TNo1", TNo);
		return "GenRegNumResult";
	}
	public String RID(String Type)//生成ID
	{
		String ID="";
		String r="zxcvbnmlkjhgfdsaqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
		if(Type.equals("学生干部"))
		{
			ID="S";
		}
		else
		{
			ID="C";
		}
		Random r1=new Random();
		StringBuffer stb=new StringBuffer();
		for(int i=0;i<5;i++)
		{
			int num=r1.nextInt(62);
			stb.append(r.charAt(num));
		}
		return ID+stb.toString();
	}
}
