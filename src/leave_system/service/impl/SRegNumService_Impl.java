package leave_system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.SRegDao;
import leave_system.entity.SRegNum;
import leave_system.entity.Student; 
import leave_system.service.SRegNumService;

@Service
public class SRegNumService_Impl implements SRegNumService{
	@Autowired
	private SRegDao sregDao;
	@Override
	public Student SInfor(String SNo) {
		// TODO Auto-generated method stub
		return sregDao.SInfor(SNo);
	}

	@Override
	public SRegNum SRN(String sregnum,String College) {
		// TODO Auto-generated method stub
		return sregDao.SRN(sregnum,College);
	}

	@Override
	public void SRegUpdate(String RegNum) {
		// TODO Auto-generated method stub
		sregDao.SRegUpdate(RegNum);
	}
	
	public void SUpdate(Student stu)
	{
		sregDao.SUpdate(stu);
	}
}
