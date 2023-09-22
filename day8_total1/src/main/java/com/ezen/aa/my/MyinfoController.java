package com.ezen.aa.my;

import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyinfoController 
{
	//입력 이름,주민번호
	//출력 이름 성별 나이
	//DB에 저장된걸로 출력(DB에는 이름 성별 나이가 저장됨)
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value="/myinfoinputgo")
	public String my()
	{
		return "myinfoinput";
	}
	
	@RequestMapping(value="/myinfosave",method=RequestMethod.POST)
	public String my1(HttpServletRequest request)
	{
		String name = request.getParameter("name");
		String jumin = request.getParameter("jumin");
		LocalDate ld = LocalDate.now();
		int birthyear = Integer.parseInt(jumin.substring(0,2));
		int su = Integer.parseInt(jumin.substring(7, 8));
        int age;
        if (su == 1 || su == 2) 
        { 
            age = ld.getYear() - (birthyear + 1900) + 1;
        } 
        else if (su == 3 || su == 4) 
        {
            age = ld.getYear() - (birthyear + 2000) + 1;
        } 
        else 
        {
            age = 0;
        }
		String sb = jumin.substring(7,8);
		String gender="";
		if(sb.equals("1") || sb.equals("3"))
		{
			 gender="남자";
		}
		else if(sb.equals("2") || sb.equals("4"))
		{
			 gender="여자";
		}
		else
		{
			gender="외계인";
		}
		MyinfoService ms = sqlsession.getMapper(MyinfoService.class);
		MyinfoDTO dto = new MyinfoDTO(name, gender, age);
		ms.myinfoinsert(dto);
		return "main";
	}
	
	@RequestMapping(value="/myinfooutgo")
	public String my2(Model mo)
	{
		MyinfoService ms = sqlsession.getMapper(MyinfoService.class);
	 	ArrayList<MyinfoDTO> list = ms.myinfoout();
	 	mo.addAttribute("list", list);
		return "myinfoout";
	}
	
	@RequestMapping(value="/age30")
	public String my3(Model mo)
	{
		MyinfoService ms = sqlsession.getMapper(MyinfoService.class);
		ArrayList<MyinfoDTO> list = ms.myinfoout2();
		mo.addAttribute("list", list);
		return "myinfoout";
	}
}
