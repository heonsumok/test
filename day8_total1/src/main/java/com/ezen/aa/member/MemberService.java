package com.ezen.aa.member;

import java.util.ArrayList;

public interface MemberService 
{
	public void minsert(String id,String pw,String name,String tel,String address,String image);
	public ArrayList<MemberDTO> mout();
	public void mdelete(String dname);
	public ArrayList<MemberDTO> mmodify1(String mid);
	public void mmodify2(String id,String pw,String name,String tel,String address,String image);
	public MemberDTO loginselect(String id,String pw);
	public int idcheck(String id);
	public ArrayList<MemberDTO> membersearchname(String value);
	public ArrayList<MemberDTO> membersearchid(String value);
}
