package leave_system.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import leave_system.entity.Leave;
import leave_system.entity.Teacher;

public interface PONService {
	public Teacher TCheck(String tea);
	public List<Leave> LeavesCheck(@Param("SNos")String SNos);
	public List<Leave> PLeavesCheck(@Param("SNos")String SNos);
	public List<Leave> PLeaveInfo(@Param("SNos")String SNos,@Param("ID") String ID);
	public Leave LeaveInfo(@Param("ID") String ID);
	public void PON(Leave ask);
	public void PPON(@Param("PON")String PON,@Param("ID")String ID,@Param("SNos")String SNos);
}
