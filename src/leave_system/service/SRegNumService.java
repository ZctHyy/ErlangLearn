package leave_system.service;

import leave_system.entity.SRegNum;
import leave_system.entity.Student;

public interface SRegNumService {
	public Student SInfor(String SNo);
	public SRegNum SRN(String sregnum,String College);
	public void SRegUpdate(String RegNum);
	public void SUpdate(Student stu);
}
