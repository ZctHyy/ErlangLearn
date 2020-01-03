package leave_system.dao;

import leave_system.entity.Teacher;

public interface ModifyDao {
	public String SCheck(String SNo);
	public void SModify(String Password,String SNo);
	public Teacher TINIT(String TNo);
	public String TCheck(String TNo);
	public void TModify(Teacher t);
}
