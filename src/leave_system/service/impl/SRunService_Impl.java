package leave_system.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.SRunDao;
import leave_system.entity.Run;
import leave_system.service.SRunService;
@Service
public class SRunService_Impl implements SRunService {
	@Autowired
	private SRunDao sRunDao;
	@Override
	public Run Check(Run srun) {
		// TODO Auto-generated method stub
		return sRunDao.Check(srun);
	}

	@Override
	public void SRun(Run srun) {
		// TODO Auto-generated method stub 
		sRunDao.SRun(srun);
	}

}
