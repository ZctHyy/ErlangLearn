package leave_system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.RMessageDao;
import leave_system.entity.Leave;
import leave_system.service.RMessageService;

@Service
public class RMessageService_Impl implements RMessageService {
	@Autowired
	private RMessageDao rMessageDao;
	@Override
	public List<Leave> TNo_ID(String TNo) {
		// TODO Auto-generated method stub
		return rMessageDao.TNo_ID(TNo);
	}
 
	@Override
	public Leave LeaveInfo(String ID,String SNo) {
		// TODO Auto-generated method stub 
		return rMessageDao.LeaveInfo(ID,SNo);
	}

	@Override
	public void alreadyRead(String ID, String SNo,String TNo) {
		// TODO Auto-generated method stub
		rMessageDao.alreadyRead(ID, SNo,TNo);
	}

	@Override
	public List<Leave> All_TNo_ID(String TNo) {
		// TODO Auto-generated method stub
		return rMessageDao.All_TNo_ID(TNo);
	}

}
