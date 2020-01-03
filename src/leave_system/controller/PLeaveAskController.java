package leave_system.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.Leave;
import leave_system.entity.Student;
import leave_system.service.impl.PLeaveAskService_Impl;

@Controller
public class PLeaveAskController {
	@Autowired
	private PLeaveAskService_Impl pleaveAskService_Impl;
	@RequestMapping("CheckStudent")
	public String CheckStudent(String SNo,HttpServletRequest request,HttpSession session)
	{
		session.setAttribute("SNo", SNo);
		Student stu=pleaveAskService_Impl.CheckStudent(SNo);
		if(stu.getJob().equals("学生"))
		{
			return "PLFail";  
		} 
		else 
		{
			return "PLeave";
		}
	}
	@RequestMapping("PLeaveAsk")
	public String PLeaveAsk(HttpServletRequest request,Model model,Leave ask,String TimeType)
	{
		String SNo=ask.getSNo();
		request.setAttribute("SNo",SNo);
		if(TimeType.equals("课程"))
		{
			ask.setSDate(ask.getEDate());
			ask.setStudent(SNo);
		}
		Leave result=pleaveAskService_Impl.CheckLeave(ask);
		if(result==null) 
		{
			String ID=RID(ask);
			ask.setType("公假");
			while(pleaveAskService_Impl.IDCheck(ID)) 
			{ 
				ID=RID(ask); 
			} 
			String[] TNos=ask.getTNo().split(",");//此处是学生学号集
			for(int i=0;i<TNos.length;i++)
			{
				if(!pleaveAskService_Impl.CheckStudentList(TNos[i]))
				{
					model.addAttribute("fail",TNos+"不存在");
					request.setAttribute("result","fail");
					return "LeaveResult";
				}
			}
			for(int i=0;i<TNos.length;i++)
			{
				Student info=pleaveAskService_Impl.SInfo(TNos[i]);
				ask.setSNo(TNos[i]);
				ask.setSName(info.getSName());
				ask.setCollege(info.getCollege());
				ask.setMajor(info.getMajor());
				ask.setClasses(info.getClasses());
				ask.setID(ID);
				if(TimeType.equals("课程"))
				{
					ask.setSDate(ask.getEDate()); 
				}
				ask.setPON("等待通过");
				SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd" );
			    Date date= new Date();
			    String upload = sdf.format(date);
			    ask.setLoadDate(upload);
				pleaveAskService_Impl.PAsking(ask);
			}
			request.setAttribute("result","success");
			return "LeaveResult";
		}  
		else 
		{
			model.addAttribute("already","已存在相同时间的请假条");
			request.setAttribute("result","fail");
			return "LeaveResult";
		}
	}
	public String RID(Leave ask)//生成ID
	{
		String ID="B";
		String r="zxcvbnmlkjhgfdsaqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
		Random r1=new Random();
		StringBuffer stb=new StringBuffer();
		for(int i=0;i<8;i++)
		{
			int num=r1.nextInt(62);
			stb.append(r.charAt(num));
		}
		return ID+stb.toString();
	}
}
