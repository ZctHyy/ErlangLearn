package leave_system.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
 
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.Leave;
import leave_system.entity.Student;
import leave_system.service.impl.LeaveAskService_Impl;

@Controller
@RequestMapping("Leave")
public class LeaveAskController {
	@Autowired
	private LeaveAskService_Impl leaveAskService_Impl;
	@RequestMapping("Ask")
	public String leaveAsk(HttpServletRequest request,Model model,Leave ask,String TimeType,String TZ)
	{
		String SNo=ask.getSNo();
		request.setAttribute("SNo",SNo);
		if(TimeType.equals("课程"))
		{
			ask.setSDate(ask.getEDate());
		}

		Leave result=leaveAskService_Impl.CheckLeave(ask);
		if(result==null) 
		{
			String ID=RID(ask);
			while(leaveAskService_Impl.IDCheck(ID))
			{ 
				ID=RID(ask); 
			} 
			Student info=leaveAskService_Impl.SInfo(SNo);
			ask.setSName(info.getSName());
			ask.setCollege(info.getCollege());
			ask.setMajor(info.getMajor());
			ask.setClasses(info.getClasses());
			ask.setID(ID);
			if(TimeType.equals("课程"))
			{
				ask.setSDate(ask.getEDate()); 
			}
			if(TZ.equals("是"))
			{
				Leave ask1=new Leave();
				String[] TNos=ask.getTNo().split(",");
				for(int i=0;i<TNos.length;i++)
				{
					if(!leaveAskService_Impl.TNoCheck(TNos[i]))
					{
						model.addAttribute("fail",TNos[i]+"不存在");
						request.setAttribute("result","fail");
						return "LeaveResult";
					}
				} 
				for(int i=0;i<TNos.length;i++)
				{
					ask1.setTNo(TNos[i]); 
					ask1.setID(ID); 
					ask1.setSNo(SNo);
					leaveAskService_Impl.TID(ask1);
				} 
			}
			ask.setPON("等待通过");
			ask.setStudent(ask.getSNo());
			SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd" );
		    Date date= new Date();
		    String upload = sdf.format(date);
		    ask.setLoadDate(upload);
			leaveAskService_Impl.Asking(ask);
			System.out.println(ask.getSNo());
			System.out.println(ask.getClasses());
			System.out.println(ask.getSName());
			result=leaveAskService_Impl.CheckLeave(ask);
			if(result!=null) 
			{
				request.setAttribute("result","success");
				return "LeaveResult";
			}
			else 
			{ 
				model.addAttribute("fail","系统错误请联系管理员");
				request.setAttribute("result","fail");
				return "LeaveResult"; 
			}
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
		String ID="";
		String r="zxcvbnmlkjhgfdsaqwertyuiopQWERTYUIOPASDFGHJKLZXCVBNM1234567890";
		if(ask.getType().equals("事假"))
		{
			ID="A";
		}
		if(ask.getType().equals("补假"))
		{
			ID="C";
		}
		
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
