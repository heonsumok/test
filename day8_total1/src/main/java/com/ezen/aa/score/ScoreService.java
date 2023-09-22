package com.ezen.aa.score;

import java.util.ArrayList;

public interface ScoreService 
{
	public void scoreinsert(int bunho,String name,int kor,int eng,int mat);
	public ArrayList<ScoreDTO> scoreout();
}
