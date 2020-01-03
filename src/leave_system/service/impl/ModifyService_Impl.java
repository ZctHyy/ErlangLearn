package leave_system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.ModifyDao;
import leave_system.entity.Teacher;
import leave_system.service.ModifyService;

@Service
public class ModifyService_Impl implements ModifyService {
	@Autowired
	private ModifyDao modifyDao;
	@Override
	public String SCheck(String SNo) {
		// TODO Auto-generated method stub
		return modifyDao.SCheck(SNo);
	}

	@Override
	public void SModify(String Password, String SNo) {
		// TODO Auto-generated method stub
		modifyDao.SModify(Password, SNo);
	}

	@Override
	public Teacher TINIT(String TNo) {
		// TODO Auto-generated method stub
		return modifyDao.TINIT(TNo);
	}

	@Override
	public String TCheck(String TNo) {
		// TODO Auto-generated method stub
		return modifyDao.TCheck(TNo);
	}

	@Override
	public void TModify(Teacher t) {
		// TODO Auto-generated method stub
		modifyDao.TModify(t);
	}

}
