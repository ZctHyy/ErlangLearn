package leave_system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.LeaveChangeDao;
import leave_system.entity.Leave;
import leave_system.service.LeaveChangeService;

@Service
public class LeaveChangeService_Impl implements LeaveChangeService {
	@Autowired
	private LeaveChangeDao leaveChangeDao;
	@Override
	public void ChangeLeave(Leave leave) {
		// TODO Auto-generated method stub
		leaveChangeDao.ChangeLeave(leave);
	}
	@Override
	public Leave SearchLeave(String ID, String Student) {
		// TODO Auto-generated method stub
		return leaveChangeDao.SearchLeave(ID, Student);
	}
	@Override
	public List<Leave> TypeSearchLeave(List<String> Type, String Student) {
		// TODO Auto-generated method stub
		return leaveChangeDao.TypeSearchLeave(Type, Student);
	}

}
