package leave_system.dao;

import org.apache.ibatis.annotations.Param;

import leave_system.entity.CRegNum;
import leave_system.entity.SRegNum;
import leave_system.entity.Teacher;

public interface GenRegNumDao {
	public Teacher Tinfo(String TNo);
	public void CGen(CRegNum crn); 
	public  void SGen(SRegNum srn);
	public CRegNum CGenCheck(@Param("RegNum")String RegNum,@Param("College")String College);
	public SRegNum SGenCheck(@Param("RegNum")String RegNum,@Param("College")String College);
}
