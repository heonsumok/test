package com.ezen.koko1;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController 
{
	@Autowired
	SqlSession sqlsession;
	
	static String image_path="C:\\study\\spring\\day7_iddouble\\src\\main\\webapp\\image";
	
	@RequestMapping(value = "/")
	public String ko(HttpServletRequest request)
	{
		HttpSession hs = request.getSession();
		hs.setAttribute("loginstate",false);
		return "main";
	}
	
	@RequestMapping(value = "/main")
	public String ko1()
	{
		return "main";
	}
	
	@RequestMapping(value = "/input")
	public String ko2()
	{
		return "myinput";
	}
	
	@RequestMapping(value = "/save",method=RequestMethod.POST)
	public String ko3(MultipartHttpServletRequest multi) throws IllegalStateException, IOException
	{
		String id = multi.getParameter("id");
		String pw = multi.getParameter("pw");
		String name = multi.getParameter("name");
		String address = multi.getParameter("address");
		MultipartFile mf = multi.getFile("image");
		String fname = mf.getOriginalFilename();
		Service ss = sqlsession.getMapper(Service.class);
		mf.transferTo(new File(image_path+"\\"+fname));
		ss.insert(id, pw, name, address, fname);
		return "main";
	}
	
	@RequestMapping(value = "/out")
	public String ko4(HttpServletRequest request,Model mo)//ModelAndView¹æ½Ä
	{
		HttpSession hs = request.getSession();
		if((Boolean)hs.getAttribute("loginstate"))
		{
		Service ss = sqlsession.getMapper(Service.class);
		ArrayList<MyinfoDTO> list = ss.out();
		mo.addAttribute("list", list);
			return "myout";
		}
		else 
		{
			return "error";
		}
	}
	
	@RequestMapping(value = "/map")
	public String ko5()
	{
		return "map";
	}
	
	@RequestMapping(value = "/logingo")
	public String ko6()
	{
		return "login";
	}
	
	@RequestMapping(value = "/login",method= RequestMethod.POST)
	public String ko7(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		Service ss = sqlsession.getMapper(Service.class);
		MyinfoDTO dto = ss.loginselect(id, pw);
		if(dto!=null)
		{
			HttpSession hs = request.getSession();
			hs.setAttribute("member",dto);
			hs.setAttribute("loginstate",true);
			hs.setMaxInactiveInterval(300);
			return "redirect:main";
		}
		else
		{
			return "redirect:logingo";
		}
	}
	
	@RequestMapping(value = "/logout")
	public String ko8(HttpServletRequest request)
	{
		HttpSession hs = request.getSession();
		hs.removeAttribute("member");
		hs.setAttribute("loginstate", false);
		return "redirect:main";
	}
	@ResponseBody
	@RequestMapping(value = "/idcheck")
	public String ko9(String id)
	{
		Service ss = sqlsession.getMapper(Service.class);
		int count = ss.idcheck(id);
		System.out.println(count);
		String bb = null;
		if(count==0)
		{
			bb="ok";
		}
		else
		{
			bb="no";
		}
		return bb;
	}
	
	@RequestMapping(value = "/sinput")
	public String ko10()
	{
		return "scoreinput";
	}
	
	@RequestMapping(value = "/save1",method=RequestMethod.POST)
	public String ko11(HttpServletRequest request)
	{
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		int tot = kor+eng+mat;
		double avg = tot/3;
		String hak = "";
		if(avg>=90) hak="A";
		else if(avg>=80) hak="B";
		else if(avg>=70) hak="C";
		else if(avg>=60) hak="D";
		else hak="F";
		Service ss = sqlsession.getMapper(Service.class);
		ss.scoreinsert(name, kor, eng, mat, tot, avg, hak);
		return "main";
	}
	
	@RequestMapping(value = "/sout")
	public String ko11(Model mo)
	{
		Service ss = sqlsession.getMapper(Service.class);
		ArrayList<ScoreDTO> list = ss.scoreout();
		mo.addAttribute("list", list);		
		return "scoreout";
	}
}
