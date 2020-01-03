package leave_system.service;

import leave_system.entity.Check;
import leave_system.entity.Student;
import leave_system.entity.Teacher;

public interface LoginService {
	public Student SLogin(Student user);
	public Teacher TLogin(Teacher user);
	public Check CLogin(Check user);
	public Teacher Tinfo(Teacher user);
}
