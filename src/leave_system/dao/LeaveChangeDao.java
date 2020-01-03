package leave_system.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import leave_system.entity.Leave;

public interface LeaveChangeDao {
	public void ChangeLeave(Leave leave);
	public Leave SearchLeave(@Param("ID")String ID,@Param("Student")String Student);
	public List<Leave> TypeSearchLeave(@Param("list")List<String> Type,@Param("Student")String Student);
}
