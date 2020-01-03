package leave_system.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import leave_system.entity.Leave;

public interface LeaveSearchService {
	public Leave SearchLeave(@Param("Student")String ID,@Param("Student")String Student);
	public List<Leave> TypeSearchLeave(List<String> Type,String Student); 
}
 