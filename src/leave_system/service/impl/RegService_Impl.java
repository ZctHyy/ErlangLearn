package leave_system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.RegDao;
import leave_system.entity.CRegNum;
import leave_system.entity.Check;
import leave_system.entity.Student;
import leave_system.entity.TRegNum;
import leave_system.entity.Teacher;
import leave_system.service.RegService;

@Service 
public class RegService_Impl implements RegService {
	@Autowired
	private RegDao regDao;
	@Override
	public void SReg(Student user) {
		// TODO Auto-generated method stub
		regDao.SReg(user);
	}

	@Override
	public Student SCheck(Student user) {
		// TODO Auto-generated method stub
		return regDao.SCheck(user);
	}

	@Override
	public void TReg(Teacher user) {
		// TODO Auto-generated method stub
		regDao.TReg(user);
	}

	@Override
	public Teacher TCheck(Teacher user) {
		// TODO Auto-generated method stub
		return regDao.TCheck(user);
	}

	@Override
	public TRegNum TRN(TRegNum trn) {
		// TODO Auto-generated method stub
		return regDao.TRN(trn);
	}

	@Override
	public Integer TNameCheck(Teacher user) {
		// TODO Auto-generated method stub
		return regDao.TNameCheck(user);
	}
	
	@Override
	public void TRNUpdate(TRegNum trn) {
		// TODO Auto-generated method stub
		regDao.TRNUpdate(trn);
	}
	
	@Override
	public void CReg(Check user) {
		// TODO Auto-generated method stub
		regDao.CReg(user);
	}
 
	@Override
	public Check CCheck(Check user) {
		// TODO Auto-generated method stub
		return regDao.CCheck(user);
	}

	@Override
	public Student CInfo(Student user) {
		// TODO Auto-generated method stub
		return regDao.CInfo(user);
	}

	@Override
	public CRegNum CRN(CRegNum crn) {
		// TODO Auto-generated method stub
		return regDao.CRN(crn);
	}

	@Override
	public void CRNUpdate(CRegNum crn) {
		// TODO Auto-generated method stub
		regDao.CRNUpdate(crn);
	}



}
