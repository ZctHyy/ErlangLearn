package leave_system.service;

import java.util.List;

import leave_system.entity.Leave;

public interface RMessageService {
	public List<Leave> TNo_ID(String TNo);
	public List<Leave> All_TNo_ID(String TNo);
	public Leave LeaveInfo(String ID,String SNo);
	public void alreadyRead(String ID,String SNo,String TNo);
}
