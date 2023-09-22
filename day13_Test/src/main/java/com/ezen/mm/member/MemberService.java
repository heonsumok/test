package com.ezen.mm.member;

import java.util.ArrayList;

import com.ezen.mm.score.PageDTO;


public interface MemberService 
{
	public void memberinsert(String id,String pw,String name,String tel,
			String address,String jumin,String hobby,String content,
			String gender,int age);
	public ArrayList<MemberDTO> memberout();
	public ArrayList<MemberDTO> memberdetail(String id);
	public int idcheck(String id);
	public void memberdelete(String did);
	public ArrayList<MemberDTO> membermodify1(String mid);
	public void membermodify2(String id,String pw,String name,String tel,
			String address,String jumin,String hobby,String content,
			String gender,int age);
	public MemberDTO loginselect(String id,String pw);
	public ArrayList<MemberDTO> membersearchname(String value);
	public ArrayList<MemberDTO> membersearchid(String value);
	public int cntnotice();
	public ArrayList<MemberDTO> selectnotice(PageDTO dto);
}
