package com.ezen.aa.sawon;

public class JobDTO 
{
	String name;
	String ipsaday;
	String nowday;
	int kibon;
	
	public JobDTO() {
	}
	
	public String getName() {
		return name;
	}
	public int getKibon() {
		return kibon;
	}

	public void setKibon(int kibon) {
		this.kibon = kibon;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getIpsaday() {
		return ipsaday;
	}
	public void setIpsaday(String ipsaday) {
		this.ipsaday = ipsaday;
	}
	public String getNowday() {
		return nowday;
	}
	public void setNowday(String nowday) {
		this.nowday = nowday;
	}
	
	
}
