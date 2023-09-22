package com.ezen.aa.sawon;

import java.util.ArrayList;

public interface SawonService 
{
	public void sawoninsert(int bunho,String name,int ho,int fa,String jik);
	public ArrayList<SawonDTO> sawonout();
	public void jobinsert(String name,String ipsaday,String nowday);
	public ArrayList<JobDTO> jobout();
	
}
