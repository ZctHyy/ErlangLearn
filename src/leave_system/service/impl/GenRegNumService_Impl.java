package leave_system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.GenRegNumDao;
import leave_system.entity.CRegNum;
import leave_system.entity.SRegNum;
import leave_system.entity.Teacher;
import leave_system.service.GenRegNumService;
@Service
public class GenRegNumService_Impl implements GenRegNumService {
	@Autowired
	private GenRegNumDao genRegNumDao;
	@Override
	public void CGen(CRegNum crn) {
		// TODO Auto-generated method stub
		genRegNumDao.CGen(crn);
	}

	@Override
	public void SGen(SRegNum srn) {
		// TODO Auto-generated method stub
		genRegNumDao.SGen(srn);
	}

	@Override
	public boolean CGenCheck(String RegNum, String College) {
		// TODO Auto-generated method stub
		CRegNum crn=genRegNumDao.CGenCheck(RegNum, College);
		if(crn!=null)
		{ 
			return true;  
		}
		else
		{
			return false;
		}
	}

	@Override
	public boolean SGenCheck(String RegNum, String College) {
		// TODO Auto-generated method stub
		if(genRegNumDao.SGenCheck(RegNum, College)!=null)
		{ 
			return true;  
		}
		else
		{
			return false;
		}
	}

	@Override
	public Teacher Tinfo(String TNo) {
		// TODO Auto-generated method stub
		return genRegNumDao.Tinfo(TNo);
	}

}
