package leave_system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.LeaveAskDao;
import leave_system.entity.Leave;
import leave_system.entity.Student;
import leave_system.service.LeaveAskService;

@Service
public class LeaveAskService_Impl implements LeaveAskService{
	@Autowired
	private LeaveAskDao leaveAskDao;
	public Leave CheckLeave(Leave ask)
	{
		return leaveAskDao.CheckLeave(ask);
	}
	public Student SInfo(String SNo)
	{
		return leaveAskDao.SInfo(SNo);
	} 
	public void Asking(Leave ask)
	{
		leaveAskDao.Asking(ask);
	}
	public void TID(Leave ask)
	{ 
		leaveAskDao.TID(ask);
	}
	@Override 
	public Boolean TNoCheck(String TNo) {
		// TODO Auto-generated method stub
		if(leaveAskDao.TNoCheck(TNo)!=null)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	@Override 
	public Boolean IDCheck(String ID) 
	{
		// TODO Auto-generated method stub
		if(leaveAskDao.IDCheck(ID)!=null)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	@Override
	public String TIDCheck(String TNo, String ID, String SNo) {
		// TODO Auto-generated method stub
		return leaveAskDao.TIDCheck(TNo, ID, SNo);
	}
}
