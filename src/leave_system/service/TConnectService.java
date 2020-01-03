package leave_system.service;

import java.util.List;

import leave_system.entity.Teacher;

public interface TConnectService {
	public List<Teacher> BeginSearch();
	public List<Teacher> CollegeSearch(String College);
	public List<Teacher> UTN(String TNo);
	public List<Teacher> NTU(String TName);
}
