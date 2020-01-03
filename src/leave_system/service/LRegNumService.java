package leave_system.service;

import java.util.List;

import leave_system.entity.CRegNum;
import leave_system.entity.SRegNum;
import leave_system.entity.Teacher;

public interface LRegNumService {
	public List<CRegNum> Cregnum(CRegNum crn);
	public List<SRegNum> Sregnum(SRegNum srn);
	public Teacher Tinfo(String TNo);
}
