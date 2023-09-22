package com.ezen.aa.my;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

public interface MyinfoService 
{
	public void myinfoinsert(MyinfoDTO dto);
	public ArrayList<MyinfoDTO> myinfoout();
	public ArrayList<MyinfoDTO> myinfoout2();
}
