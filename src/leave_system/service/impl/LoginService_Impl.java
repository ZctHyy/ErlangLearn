package leave_system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.LoginDao;
import leave_system.entity.Check;
import leave_system.entity.Student;
import leave_system.entity.Teacher;
import leave_system.service.LoginService;

@Service
public class LoginService_Impl implements LoginService {
	@Autowired
	private LoginDao loginDao;

	@Override
	public Student SLogin(Student user) {
		// TODO Auto-generated method stub
		return loginDao.SLogin(user);
	} 

	@Override
	public Teacher TLogin(Teacher user) {
		// TODO Auto-generated method stub
		return loginDao.TLogin(user);
	}

	@Override
	public Check CLogin(Check user) {
		// TODO Auto-generated method stub
		return loginDao.CLogin(user);
	}

	@Override
	public Teacher Tinfo(Teacher user) {
		// TODO Auto-generated method stub
		return loginDao.Tinfo(user);
	}
	
	

}
