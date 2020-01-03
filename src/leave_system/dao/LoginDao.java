package leave_system.dao;

import leave_system.entity.Check;
import leave_system.entity.Student;
import leave_system.entity.Teacher;

public interface LoginDao {
	public Student SLogin(Student user);
	public Teacher TLogin(Teacher user);
	public Check CLogin(Check user);
	public Teacher Tinfo(Teacher user);
}
