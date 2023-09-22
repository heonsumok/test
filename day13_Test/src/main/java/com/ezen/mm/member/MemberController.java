package com.ezen.mm.member;

import java.time.LocalDate;
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

import com.ezen.mm.score.PageDTO;



@Controller
public class MemberController 
{
	@Autowired
	SqlSession sqlsession;
	
	ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
	
	@RequestMapping(value="/memberinputgo")
	public String memberinput()
	{
		return "memberinput";
	}
	
	@RequestMapping(value="/membersave",method=RequestMethod.POST)
	public String membersave(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		String jumin = request.getParameter("jumin");
		String hobby=request.getParameter("hobby");
		String content = request.getParameter("content");
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
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ms.memberinsert(id,pw,name,tel,address,jumin,hobby,content,gender,age);
		return "main";
	}
	
	@RequestMapping(value="/memberoutgo")
	public String memberout(HttpServletRequest request,Model mo)
	{
		
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ArrayList<MemberDTO> list = ms.memberout();
		mo.addAttribute("list", list);
		return "memberout";
		
		
	}
	
	@RequestMapping(value="/memberdetail")
	public String memberdetail(HttpServletRequest request,Model mo)
	{
		String id = request.getParameter("id");
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ArrayList<MemberDTO> list1 = ms.memberdetail(id);
		mo.addAttribute("list1", list1);
		return "memberdetail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idcheck")
	public String ko9(String id)
	{
		MemberService ss = sqlsession.getMapper(MemberService.class);
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
	
	@RequestMapping(value="/memberdelete")
	public String memberdelete(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ms.memberdelete(id);
		return "redirect:memberoutgo";
	}
	
	@RequestMapping(value="/membermodify1")
	public String membermodify1(HttpServletRequest request,Model mo)
	{
		String id = request.getParameter("id");
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ArrayList<MemberDTO> list2 = ms.membermodify1(id);
		mo.addAttribute("list2", list2);
		return "membermodifyview";
	}
	
	@RequestMapping(value="/membermodify2",method=RequestMethod.POST)
	public String membermodify2(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		String jumin = request.getParameter("jumin");
		String hobby = request.getParameter("hobby");
		String content = request.getParameter("content");
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
		MemberService ms = sqlsession.getMapper(MemberService.class);
		ms.membermodify2(id, pw, name, tel, address, jumin, hobby,content,gender, age);
		return "redirect:memberoutgo";
	}
	
	@RequestMapping(value="/logingo")
	public String login()
	{
		return "login";
	}
	
	@RequestMapping(value="/loginsave",method=RequestMethod.POST)
	public String loginsave(HttpServletRequest request)
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
	public String logout(HttpServletRequest request)
	{
		HttpSession hs = request.getSession();
		hs.removeAttribute("member");
		hs.setAttribute("loginstate",false);
		return "redirect:main";
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
	
	@RequestMapping(value="/membernotice")
    public String ko16(HttpServletRequest request, PageDTO dto,Model mo) {
       String nowPage=request.getParameter("nowPage");
       String cntPerPage=request.getParameter("cntPerPage");
       MemberService notice = sqlsession.getMapper(MemberService.class);
       //전체레코드수구하기
       int total=notice.cntnotice();
       if(nowPage==null && cntPerPage == null) {
          nowPage="1";
          cntPerPage="3";
       }
       else if(nowPage==null) {
          nowPage="1";
       }
       else if(cntPerPage==null) {
          cntPerPage="3";
       }      
       dto=new PageDTO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
       mo.addAttribute("paging",dto);
       mo.addAttribute("list",notice.selectnotice(dto));
       return "memberout";
    }
}
