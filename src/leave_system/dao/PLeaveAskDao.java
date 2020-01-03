package leave_system.dao;

import leave_system.entity.Leave;
import leave_system.entity.Student;

public interface PLeaveAskDao {
	public Student CheckStudent(String SNo);
	public Student CheckStudentList(String SNo);
	public Student SInfo(String SNo);
	public void PAsking(Leave leave);
	public Leave CheckLeave(Leave ask);
	public String IDCheck(String ID);
}
