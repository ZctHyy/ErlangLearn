package leave_system.entity;

public class Leave 
{
	private String SNo;//统计SNo的数据，方便之后使用，增加数据库容量但是减少服务器cpu操作量
	private String SName;
	private String Major;
	private String College;
	private String Classes;
	private String Type;//公假，事假，补假
	private String SDate;
	private String EDate;
	private String Time;//课程或者计算出天数。select框和不可修改input框之间转换
	private String Reason;
	private String PON; 
	private String ID;//自动生成，A事假B公假C补假
	private String TNo;  
	private String Student;
	private String LoadDate;
	private String PCount;
	
/*	使用老师的账号。
	或者直接选辅导员，
	但都会有请假条给辅导员进行审批，
	任课老师收到的只会是已经完成同意请假的假条。*/
	
	public String getStudent() {
		return Student;
	}
	public String getPCount() {
		return PCount;
	}
	public void setPCount(String pCount) {
		PCount = pCount;
	}
	public void setStudent(String student) {
		Student = student;
	}
	public String getLoadDate() {
		return LoadDate;
	}
	public void setLoadDate(String loadDate) {
		LoadDate = loadDate;
	}
	public String getSNo() {
		return SNo;
	}
	public void setSNo(String sNo) {
		SNo = sNo;
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getTime() {
		return Time;
	}
	public void setTime(String time) {
		Time = time;
	}
	public String getTNo() {
		return TNo;
	}
	public void setTNo(String tNo) {
		TNo = tNo;
	}
	public String getReason() {
		return Reason;
	}
	public void setReason(String reason) {
		Reason = reason;
	}
	public String getPON() {
		return PON;
	}
	public void setPON(String pON) {
		PON = pON;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getMajor() {
		return Major;
	}
	public void setMajor(String major) {
		Major = major;
	}
	public String getCollege() {
		return College;
	}
	public void setCollege(String college) {
		College = college;
	}
	public String getClasses() {
		return Classes;
	}
	public void setClasses(String classes) {
		Classes = classes;
	}
	public String getSName() {
		return SName;
	}
	public void setSName(String sName) {
		SName = sName;
	}
	public String getSDate() {
		return SDate;
	}
	public void setSDate(String sDate) {
		SDate = sDate;
	}
	public String getEDate() {
		return EDate;
	}
	public void setEDate(String eDate) {
		EDate = eDate;
	}
	
}
