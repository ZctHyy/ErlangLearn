package leave_system.dao;

import org.apache.ibatis.annotations.Param;

import leave_system.entity.SRegNum;
import leave_system.entity.Student;

public interface SRegDao {
	public Student SInfor(String SNo);
	public SRegNum SRN(@Param("RegNum")String RegNum,@Param("College")String College);
	public void SRegUpdate(String RegNum);
	public void SUpdate(Student stu);
}
