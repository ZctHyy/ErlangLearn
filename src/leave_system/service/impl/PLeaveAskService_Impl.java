package leave_system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.PLeaveAskDao;
import leave_system.entity.Leave;
import leave_system.entity.Student;
import leave_system.service.PLeaveAskService;

@Service
public class PLeaveAskService_Impl implements PLeaveAskService {
	@Autowired
	private PLeaveAskDao pleaveAskDao;
	@Override
	public Student CheckStudent(String SNo) {
		// TODO Auto-generated method stub
		return pleaveAskDao.CheckStudent(SNo);
	}
	
	public boolean CheckStudentList(String SNo)
	{
		if(pleaveAskDao.CheckStudentList(SNo)!=null)
		{ 
			return true;
		}
		else
		{
			return false;
		}
	}

	@Override
	public Student SInfo(String SNo) {
		// TODO Auto-generated method stub
		return pleaveAskDao.SInfo(SNo);
	}

	@Override
	public void PAsking(Leave leave) {
		// TODO Auto-generated method stub
		pleaveAskDao.PAsking(leave);
	}

	@Override
	public boolean IDCheck(String ID) {
		// TODO Auto-generated method stub
		if(pleaveAskDao.IDCheck(ID)==null)
		{
			return false;
		}
		else
		{
			return true;
		}
		
	}

	@Override
	public Leave CheckLeave(Leave ask) {
		// TODO Auto-generated method stub
		return pleaveAskDao.CheckLeave(ask);
	}
}
