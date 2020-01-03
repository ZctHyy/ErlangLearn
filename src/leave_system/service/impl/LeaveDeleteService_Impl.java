package leave_system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.LeaveDeleteDao;
import leave_system.entity.Leave;
import leave_system.service.LeaveDeleteService;

@Service
public class LeaveDeleteService_Impl implements LeaveDeleteService {
	@Autowired
	private LeaveDeleteDao leaveDeleteDao;
	@Override
	public void DeleteLeave(Leave leave) {
		// TODO Auto-generated method stub
		leaveDeleteDao.DeleteLeave(leave);
	}

	@Override
	public Leave DLeaveCheck(Leave leave) {
		// TODO Auto-generated method stub
		return leaveDeleteDao.DLeaveCheck(leave);
	}

}
