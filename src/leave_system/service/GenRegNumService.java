package leave_system.service;

import org.apache.ibatis.annotations.Param;

import leave_system.entity.CRegNum;
import leave_system.entity.SRegNum;
import leave_system.entity.Teacher;

public interface GenRegNumService {
	public Teacher Tinfo(String TNo);
	public void CGen(CRegNum crn); 
	public  void SGen(SRegNum srn);
	public boolean CGenCheck(@Param("RegNum")String RegNum,@Param("College")String College);
	public boolean SGenCheck(@Param("RegNum")String RegNum,@Param("College")String College);
}
