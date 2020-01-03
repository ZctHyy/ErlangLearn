package leave_system.entity;

public class Run {
	private String SNo;//统计SNo的数据，方便之后使用，增加数据库容量但是减少服务器cpu操作量
	private String SName;
	private String Major;
	private String College;
	private String Classes;
	private String Type;//登记人类型
	private String Date;
	private String Time;//课程或者计算出天数。select框和不可修改input框之间转换
	private String Record;  
	private String RecordDate;
	public String getSNo() {
		return SNo;
	}
	public void setSNo(String sNo) {
		SNo = sNo;
	}
	public String getSName() {
		return SName;
	}
	public void setSName(String sName) {
		SName = sName;
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
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public String getTime() {
		return Time;
	}
	public void setTime(String time) {
		Time = time;
	}
	public String getRecord() {
		return Record;
	}
	public void setRecord(String record) {
		Record = record;
	}
	public String getRecordDate() {
		return RecordDate;
	}
	public void setRecordDate(String recordDate) {
		RecordDate = recordDate; 
	}
	
}
