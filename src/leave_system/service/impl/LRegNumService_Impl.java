package leave_system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.LRegNumDao;
import leave_system.entity.CRegNum;
import leave_system.entity.SRegNum;
import leave_system.entity.Teacher;
import leave_system.service.LRegNumService;

@Service
public class LRegNumService_Impl implements LRegNumService {
	@Autowired
	private LRegNumDao lRegNumDao;
	@Override
	public List<CRegNum> Cregnum(CRegNum crn) {
		// TODO Auto-generated method stub
		return lRegNumDao.Cregnum(crn);
	}

	@Override
	public List<SRegNum> Sregnum(SRegNum srn) {
		// TODO Auto-generated method stub
		return lRegNumDao.Sregnum(srn);
	}

	@Override
	public Teacher Tinfo(String TNo) {
		// TODO Auto-generated method stub
		return lRegNumDao.Tinfo(TNo);
	}

}
