package leave_system.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.Leave;
import leave_system.service.impl.RMessageService_Impl;

@Controller
public class RMessageController {
	@Autowired
	private RMessageService_Impl rMessageService_Impl;
	@RequestMapping("AllRMessage")
	public String AllRMessage(String TNo,HttpSession session) throws ParseException
	{
		List<Leave> result=new ArrayList<Leave>();
		List<Leave> result0=rMessageService_Impl.All_TNo_ID(TNo);
		if(result0!=null)
		{
			for(int i=0;i<result0.size();i++)
			{
				String ID=result0.get(i).getID();
				String SNo=result0.get(i).getSNo();
				Leave r=rMessageService_Impl.LeaveInfo(ID,SNo); 
				SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd" );
			    Date date= new Date();
			    String now = sdf.format(date);
			    Date dnow = sdf.parse(now);
			    String start=r.getSDate();
			    Date dstart=sdf.parse(start);
			    String end=r.getEDate();
			    Date dend=sdf.parse(end);
			    if(dnow.after(dstart)&dnow.before(dend))
			    {
			    	result.add(r);
			    }
			}  
			session.setAttribute("check", "have");
		}
		else
		{
			Leave rLeave=new Leave();
			rLeave.setSNo("无数据");
			rLeave.setSName("无数据");
			rLeave.setCollege("无数据");
			rLeave.setMajor("无数据");
			rLeave.setClasses("无数据");
			rLeave.setSDate("无数据");
			rLeave.setEDate("无数据");
			rLeave.setTime("无数据");
			rLeave.setReason("无数据");
			rLeave.setType("无数据");
			result.add(rLeave);
			session.setAttribute("check", "none");
		}
		session.setAttribute("result", result);
		session.setAttribute("TNo", TNo);
		return "RMessage";
		
	}
	@RequestMapping("RMessage")
	public String RMessage(String TNo,HttpSession session,Model model) throws ParseException
	{
		List<Leave> result=new ArrayList<Leave>();
		List<Leave> result0=rMessageService_Impl.TNo_ID(TNo);
		if(result0!=null)
		{
			for(int i=0;i<result0.size();i++)
			{
				String ID=result0.get(i).getID();
				String SNo=result0.get(i).getSNo();
				Leave r=rMessageService_Impl.LeaveInfo(ID,SNo); 
				SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd" );
			    Date date= new Date();
			    String now = sdf.format(date);
			    Date dnow = sdf.parse(now);
			    String start=r.getSDate();
			    Date dstart=sdf.parse(start);
			    String end=r.getEDate();
			    Date dend=sdf.parse(end);
			    if(dnow.after(dstart)&dnow.before(dend))
			    {
			    	result.add(r);
			    }
			}  
			session.setAttribute("check", "have");
		}
		else
		{
			Leave rLeave=new Leave();
			rLeave.setSNo("无数据");
			rLeave.setSName("无数据");
			rLeave.setCollege("无数据");
			rLeave.setMajor("无数据");
			rLeave.setClasses("无数据");
			rLeave.setSDate("无数据");
			rLeave.setEDate("无数据");
			rLeave.setTime("无数据");
			rLeave.setReason("无数据");
			rLeave.setType("无数据");
			result.add(rLeave);
			session.setAttribute("check", "none");
		}
		session.setAttribute("result", result);
		session.setAttribute("TNo", TNo);
		return "RMessage";
	}
	@RequestMapping("alreadyRead")
	public String alreadyRead(String SNo,String TNo,String ID,HttpSession session) throws ParseException
	{
		session.setAttribute("TNo", TNo);
		rMessageService_Impl.alreadyRead(ID, SNo, TNo);
		List<Leave> result=new ArrayList<Leave>();
		List<Leave> result0=rMessageService_Impl.TNo_ID(TNo);
		if(result0!=null)
		{
			for(int i=0;i<result0.size();i++)
			{
				String ID1=result0.get(i).getID();
				String SNo1=result0.get(i).getSNo();
				Leave r=rMessageService_Impl.LeaveInfo(ID1,SNo1); 
				SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd" );
			    Date date= new Date();
			    String now = sdf.format(date);
			    Date dnow = sdf.parse(now);
			    String start=r.getSDate();
			    Date dstart=sdf.parse(start);
			    String end=r.getEDate();
			    Date dend=sdf.parse(end);
			    if(dnow.after(dstart)&dnow.before(dend))
			    {
			    	result.add(r);
			    }
			}  
			session.setAttribute("check", "have");
		}
		else
		{
			Leave rLeave=new Leave();
			rLeave.setSNo("无数据");
			rLeave.setSName("无数据");
			rLeave.setCollege("无数据");
			rLeave.setMajor("无数据");
			rLeave.setClasses("无数据");
			rLeave.setSDate("无数据");
			rLeave.setEDate("无数据");
			rLeave.setTime("无数据");
			rLeave.setReason("无数据");
			rLeave.setType("无数据");
			result.add(rLeave);
			session.setAttribute("check", "none");
		}
		session.setAttribute("result", result);
		session.setAttribute("TNo", TNo);
		return "RMessage";
	}
}
