package leave_system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import leave_system.entity.Leave;

public interface RMessageDao {
	public List<Leave> TNo_ID(String TNo);
	public List<Leave> All_TNo_ID(String TNo);
	public Leave LeaveInfo(@Param("ID")String ID,@Param("SNo")String SNo);
	public void alreadyRead(@Param("ID")String ID,@Param("SNo")String SNo,@Param("TNo") String TNo);
}
