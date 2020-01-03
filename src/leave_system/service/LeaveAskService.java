package leave_system.service;

import org.apache.ibatis.annotations.Param;

import leave_system.entity.Leave;
import leave_system.entity.Student;

public interface LeaveAskService {
	public Leave CheckLeave(Leave ask);
	public Student SInfo(String SNo);
	public void Asking(Leave ask);
	public void TID(Leave ask);
	public Boolean TNoCheck(String TNo);
	public Boolean IDCheck(String ID);
	public String TIDCheck(@Param("TNo")String TNo,@Param("ID")String ID,@Param("SNo") String SNo);
}
