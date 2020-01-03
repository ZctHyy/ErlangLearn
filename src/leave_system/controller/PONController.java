package leave_system.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import leave_system.entity.Leave;
import leave_system.entity.Teacher;
import leave_system.service.impl.PONService_Impl;

@Controller
public class PONController {
	@Autowired
	private PONService_Impl pONService_Impl;
	@RequestMapping("ACPON")
	public String ACPON(String TNo,Model model,HttpSession session)
	{
		Teacher t=pONService_Impl.TCheck(TNo);
		String grade=t.getGrade();
		List<Leave> result=pONService_Impl.LeavesCheck(grade+"%");
		session.setAttribute("TNo1", TNo);
		session.setAttribute("result", result);
		return "ACPON";
	}
	@RequestMapping("ACPON1")
	public String ACPON1(String ID,String TNo,Model model,HttpSession session)
	{
		Leave result=pONService_Impl.LeaveInfo(ID);
		session.setAttribute("TNo1", TNo);
		session.setAttribute("result", result);
		return "ACPON1";
	}
	@RequestMapping("ACPON2")
	public String ACPON2(String PON,String TNo,String ID,Model model,HttpSession session)
	{
		Leave lea=new Leave();
		lea.setID(ID);
		lea.setTNo(TNo);
		lea.setPON(PON);
		pONService_Impl.PON(lea);
		session.setAttribute("TNo1", TNo);
		return "ACPONResult";
	}
	
	@RequestMapping("BPON")
	public String BPON(String TNo,Model model,HttpSession session)
	{
		Teacher t=pONService_Impl.TCheck(TNo);
		String grade=t.getGrade();
		List<Leave> result=pONService_Impl.PLeavesCheck(grade+"%");
		session.setAttribute("TNo1", TNo);
		session.setAttribute("result", result);
		return "BPON";
	}
	@RequestMapping("BPON1")
	public String BPON1(String ID,String TNo,Model model,HttpSession session)
	{
		Teacher t=pONService_Impl.TCheck(TNo);
		String grade=t.getGrade();
		List<Leave> result=pONService_Impl.PLeaveInfo(grade,ID);
		session.setAttribute("TNo1", TNo);
		session.setAttribute("result", result);
		return "ACPON1";
	}
	
	@RequestMapping("BPON2")
	public String BPON2(String PON,String TNo,String ID,Model model,HttpSession session)
	{
		Teacher t=pONService_Impl.TCheck(TNo);
		String grade=t.getGrade();
		pONService_Impl.PPON(PON,ID,grade);
		session.setAttribute("TNo1", TNo);
		return "BPONResult";
	}
}

