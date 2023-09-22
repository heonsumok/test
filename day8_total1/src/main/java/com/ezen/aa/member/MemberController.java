package com.ezen.aa.member;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MemberController 
{
	@Autowired
	SqlSession sqlsession;
	
	ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
	
	static String image_path = "C:\\study\\spring\\day8_total1\\src\\main\\webapp\\image";
	
	@RequestMapping(value="/memberinputgo")
	public String m()
	{
		return "memberinput";
	}
	
	@RequestMapping(value="/membersave")
	public String m1(MultipartHttpServletRequest multi) throws IllegalStateException, IOException
	{
		String id = multi.getParameter("id");
		String pw = multi.getParameter("pw");
		String name = multi.getParameter("name");
		String tel = multi.getParameter("tel");
		String address = multi.getParameter("address");
		MultipartFile mf = multi.getFile("image");
		String fname = mf.getOriginalFilename();
		MemberService ms = sqlsession.getMapper(MemberService.class);
		mf.transferTo(new File(image_path+"\\"+fname));
		ms.minsert(id, pw, name, tel, address, fname);
		return "main";
	}
	
	@RequestMapping(value="/memberoutgo")
	public String m2(HttpServletRequest request,Model mo)
	{
		HttpSession hs = request.getSession();
		if((Boolean)hs.getAttribute("loginstate"))
		{	
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ArrayList<MemberDTO> list = ms.mout();
		mo.addAttribute("list", list);
		return "memberout";
		}
		else
		{
			return "error";
		}
	}
	
	@RequestMapping(value="/memberdelete")
	public String m3(HttpServletRequest request)
	{
		String name = request.getParameter("name");
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ms.mdelete(name);
		return "redirect:memberoutgo";
	}
	
	@RequestMapping(value="/membermodify1")
	public String m4(HttpServletRequest request,Model mo)
	{
		String id = request.getParameter("id");
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ArrayList<MemberDTO> list = ms.mmodify1(id);
		mo.addAttribute("list", list);
		return "membermodifyview";
	}
	
	@RequestMapping(value="/membermodify2",method=RequestMethod.POST)
	public String m5(MultipartHttpServletRequest multi) throws IllegalStateException, IOException 
	{
		String id = multi.getParameter("id");
		String pw = multi.getParameter("pw");
		String name = multi.getParameter("name");
		System.out.println("¾ÆÀÌµð"+id);
		String tel = multi.getParameter("tel");
		String address = multi.getParameter("address");
		MultipartFile mf = multi.getFile("image");
		String fname = mf.getOriginalFilename();
		mf.transferTo(new File(image_path+"\\"+fname));
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ms.mmodify2(id, pw,name,tel, address, fname);
		return "redirect:memberoutgo";
	}
	
	@RequestMapping(value="/logingo")
	public String m6()
	{
		return "login";
	}
	
	@RequestMapping(value="/loginsave",method=RequestMethod.POST)
	public String m7(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberService ms = sqlsession.getMapper(MemberService.class);
		MemberDTO dto = ms.loginselect(id, pw);
		if(dto!=null)
		{
			HttpSession hs = request.getSession();
			hs.setAttribute("member", dto);
			hs.setAttribute("loginstate",true);
			hs.setMaxInactiveInterval(300);
			return "redirect:main";
		}
		else
		{
			return "redirect:logingo";
		}
	}
	
	@RequestMapping(value="/logout")
	public String m8(HttpServletRequest request)
	{
		HttpSession hs = request.getSession();
		hs.removeAttribute("member");
		hs.setAttribute("loginstate",false);
		return "redirect:main";
	}
	
	@ResponseBody
	@RequestMapping(value="/idcheck")
	public String m9(String id)
	{
		MemberService ms = sqlsession.getMapper(MemberService.class);
		int count = ms.idcheck(id);
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
	
	@RequestMapping(value="/membersearchgo")
	public String m10()
	{
		return "membersearch";
	}
	
	@RequestMapping(value="/membersearch2",method=RequestMethod.POST)
	public String m11(HttpServletRequest request,Model mo)
	{
		String item = request.getParameter("item");
		String value = request.getParameter("value");
		MemberService ms = sqlsession.getMapper(MemberService.class);
		if(item.equals("name"))
		{
			list = ms.membersearchname(value);
		}
		else if(item.equals("id"))
		{
			list = ms.membersearchid(value);
		}
		mo.addAttribute("list",list);
		return "memberout";
	}
	
	
}
