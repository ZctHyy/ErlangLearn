package leave_system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.TConnectDao;
import leave_system.entity.Student;
import leave_system.entity.Teacher;
import leave_system.service.TConnectService;

@Service
public class TConnectService_Impl implements TConnectService{
	@Autowired
	private TConnectDao tConnectDao;

	@Override
	public List<Teacher> BeginSearch() {
		// TODO Auto-generated method stub
		return tConnectDao.BeginSearch();
	}

	@Override
	public List<Teacher> CollegeSearch(String College) {
		// TODO Auto-generated method stub
		return tConnectDao.CollegeSearch(College);
	}

	@Override
	public List<Teacher> UTN(String TNo) {
		// TODO Auto-generated method stub
		return tConnectDao.UTN(TNo);
	}

	@Override
	public List<Teacher> NTU(String TName) {
		// TODO Auto-generated method stub
		return tConnectDao.NTU(TName);
	}
	
}
