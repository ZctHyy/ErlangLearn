package leave_system.service;

import leave_system.entity.Leave;
import leave_system.entity.Student;

public interface PLeaveAskService {
	public Student CheckStudent(String SNo);
	public boolean CheckStudentList(String SNo);
	public Student SInfo(String SNo);
	public void PAsking(Leave leave);
	public boolean IDCheck(String ID);
	public Leave CheckLeave(Leave ask);
}
