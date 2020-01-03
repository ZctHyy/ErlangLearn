package leave_system.entity;

public class CRegNum {
	private String RegNum;
	private String College;
	private String Used;
	private String TNo;
	
	public String getTNo() {
		return TNo;
	}
	public void setTNo(String tNo) {
		TNo = tNo;
	}
	public String getRegNum() {
		return RegNum;
	}
	public void setRegNum(String regNum) {
		RegNum = regNum;
	}
	public String getCollege() {
		return College;
	}
	public void setCollege(String college) {
		College = college;
	}
	public String getUsed() {
		return Used;
	}
	public void setUsed(String used) {
		Used = used;
	}
	public CRegNum(String regNum, String college) {
		super();
		RegNum = regNum;
		College = college;
	}
	public CRegNum() {}
}
