package mbti;

import java.util.Date;

public class MbtiDTO {
	private int num;
	private String id;
	private String mbti;
	private Date regdate;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMbti() {
		return mbti;
	}
	public void setMbti(String mbti) {
		this.mbti = mbti;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "MbtiDTO [num=" + num + ", id=" + id + ", mbti=" + mbti + ", regdate=" + regdate + "]";
	}
	
	
}
