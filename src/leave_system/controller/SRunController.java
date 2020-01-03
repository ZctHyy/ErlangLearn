package leave_system.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.Run;
import leave_system.service.impl.LeaveAskService_Impl;
import leave_system.service.impl.SRunService_Impl;

@Controller
public class SRunController {
	@Autowired
	private LeaveAskService_Impl leaveAskService_Impl;
	private SRunService_Impl sRunService_Impl;
	@RequestMapping("SRun")
	public String SRun(String TNo,String SNo,String Date,String Time,HttpSession session,Model model)
	{
		session.setAttribute("TNo1", TNo);
		String[] SNos=SNo.split(",");
		for(int i=0;i<SNos.length;i++)
		{
			if(leaveAskService_Impl.SInfo(SNos[i])==null)
			{
				session.setAttribute("result", "fail");
				model.addAttribute("fail",SNos[i]+"不存在");
				return "SRunResult";
			}
		}
		for(int i=0;i<SNos.length;i++)
		{
				Run srun=new Run();
				srun.setSNo(SNos[i]);
				srun.setDate(Date);
				srun.setTime(Time);
				if(sRunService_Impl.Check(srun)!=null)
				{
					session.setAttribute("result", "fail");
					model.addAttribute("fail",SNos[i]+"逃课情况已登记");
					return "SRunResult";
				}
		}
		for(int i=0;i<SNos.length;i++)
		{
				Run srun=new Run();
				srun.setSNo(SNos[i]);
				srun.setDate(Date);
				srun.setTime(Time);
				SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd" );
			    Date date= new Date();
			    String upload = sdf.format(date);
			    srun.setRecordDate(upload);
			    srun.setRecord(TNo);
			    sRunService_Impl.SRun(srun);
		}
		session.setAttribute("result", "success");
		return "SRunResult";
	}
}
