package leave_system.dao;

import leave_system.entity.Leave;

public interface LeaveDeleteDao {
	public void DeleteLeave(Leave leave);
	public Leave DLeaveCheck(Leave leave);
	
}
