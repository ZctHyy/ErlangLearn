package leave_system.service;

import leave_system.entity.Leave;

public interface LeaveDeleteService {
	public void DeleteLeave(Leave leave);
	public Leave DLeaveCheck(Leave leave);
}
