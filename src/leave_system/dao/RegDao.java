package leave_system.dao;

import leave_system.entity.CRegNum;
import leave_system.entity.Check;
import leave_system.entity.Student;
import leave_system.entity.TRegNum;
import leave_system.entity.Teacher;

public interface RegDao {  
	public void SReg(Student user);
	public Student SCheck(Student user);
	
	public void TReg(Teacher user);
	public Teacher TCheck(Teacher user);
	public TRegNum TRN(TRegNum trn);
	public Integer TNameCheck(Teacher user);
	public void TRNUpdate(TRegNum trn);
	
	public void CReg(Check user); 
	public Student CInfo(Student user);
	public Check CCheck(Check user);
	public CRegNum CRN(CRegNum crn);
	public void CRNUpdate(CRegNum crn);
}
