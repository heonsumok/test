package com.ezen.koko1;

import java.util.ArrayList;

public interface Service 
{
	public void insert(String id,String pw,String name,String address,String image);
	public ArrayList<MyinfoDTO> out();
	public MyinfoDTO loginselect(String id,String pw);
	public int idcheck(String id);
	public void scoreinsert(String name,int kor,int eng,int mat,int tot,double avg,String hak);
	public ArrayList<ScoreDTO> scoreout();
}
