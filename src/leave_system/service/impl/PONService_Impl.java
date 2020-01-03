package leave_system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.PONDao;
import leave_system.entity.Leave;
import leave_system.entity.Teacher;
import leave_system.service.PONService;

@Service
public class PONService_Impl implements PONService {
	@Autowired
	private PONDao pONDao;
	@Override
	public Teacher TCheck(String tea) {
		// TODO Auto-generated method stub
		return pONDao.TCheck(tea);
	}

	@Override
	public List<Leave> LeavesCheck(String SNos) {
		// TODO Auto-generated method stub
		return pONDao.LeavesCheck(SNos);
	}

	@Override
	public List<Leave> PLeavesCheck(String SNos) {
		// TODO Auto-generated method stub
		return pONDao.PLeavesCheck(SNos);
	}
	
	@Override
	public void PON(Leave ask) {
		// TODO Auto-generated method stub
		pONDao.PON(ask);
	}

	@Override
	public Leave LeaveInfo(String ID) {
		// TODO Auto-generated method stub
		return pONDao.LeaveInfo(ID);
	}

	@Override
	public List<Leave> PLeaveInfo(String SNos, String ID) {
		// TODO Auto-generated method stub
		return  pONDao.PLeaveInfo(SNos,ID);
	}

	@Override
	public void PPON(String PON, String ID, String SNos) {
		// TODO Auto-generated method stub
		pONDao.PPON(PON, ID, SNos);
	}

}
