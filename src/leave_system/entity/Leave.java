package leave_system.entity;

public class Leave 
{
	private String SNo;//ͳ��SNo�����ݣ�����֮��ʹ�ã��������ݿ��������Ǽ��ٷ�����cpu������
	private String SName;
	private String Major;
	private String College;
	private String Classes;
	private String Type;//���٣��¼٣�����
	private String SDate;
	private String EDate;
	private String Time;//�γ̻��߼����������select��Ͳ����޸�input��֮��ת��
	private String Reason;
	private String PON; 
	private String ID;//�Զ����ɣ�A�¼�B����C����
	private String TNo;  
	private String Student;
	private String LoadDate;
	private String PCount;
	
/*	ʹ����ʦ���˺š�
	����ֱ��ѡ����Ա��
	�������������������Ա����������
	�ο���ʦ�յ���ֻ�����Ѿ����ͬ����ٵļ�����*/
	
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
