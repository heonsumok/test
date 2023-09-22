package com.ezen.mm.score;

import java.util.ArrayList;


public interface ScoreService 
{
	public void scoreinsert(int num,String name,int kor,int eng,int mat);
	public ArrayList<ScoreDTO> scoreout();
	public int cntnotice();
	public ArrayList<ScoreDTO> selectnotice(PageDTO dto);
}
