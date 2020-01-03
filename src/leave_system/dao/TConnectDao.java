package leave_system.dao;

import java.util.List;

import leave_system.entity.Teacher;

public interface TConnectDao {
	public List<Teacher> BeginSearch();
	public List<Teacher> CollegeSearch(String College);
	public List<Teacher> UTN(String TNo);
	public List<Teacher> NTU(String TName);
}
