package leave_system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import leave_system.dao.LeaveSearchDao;
import leave_system.entity.Leave;
import leave_system.service.LeaveSearchService;

@Service
public class LeaveSearchService_Impl implements LeaveSearchService {
	@Autowired
	private LeaveSearchDao leaveSearchDao;
	@Override
	public Leave SearchLeave(String ID,String Student) {
		// TODO Auto-generated method stub
		return leaveSearchDao.SearchLeave(ID,Student);
	}
	@Override 
	public List<Leave> TypeSearchLeave(List<String> Type,String Student) {
		// TODO Auto-generated method stub
		return leaveSearchDao.TypeSearchLeave(Type,Student);
	}
 
}
