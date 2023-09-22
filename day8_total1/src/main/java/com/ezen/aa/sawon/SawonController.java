package com.ezen.aa.sawon;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SawonController 
{
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value="/sawoninputgo")
	public String sa()
	{
		return "sawoninput";
	}
	
	@RequestMapping(value="/sawonsave",method=RequestMethod.POST)
	public String sa1(HttpServletRequest request)
	{
		int bunho = Integer.parseInt(request.getParameter("bunho"));
		String name = request.getParameter("name");
		int ho = Integer.parseInt(request.getParameter("ho"));
		int fa = Integer.parseInt(request.getParameter("fa"));
		String jik = request.getParameter("jik");
		SawonService ss = sqlsession.getMapper(SawonService.class);
		ss.sawoninsert(bunho, name, ho, fa, jik);
		return "main";
	}
	
	@RequestMapping(value="/sawonoutgo")
	public String sa2(Model mo)
	{
		SawonService ss = sqlsession.getMapper(SawonService.class);
		ArrayList<SawonDTO> list = ss.sawonout();
		mo.addAttribute("list", list);
		return "sawonout";
	}
	
	@RequestMapping(value="/jobingo")
	public String sa3()
	{
		return "jobin";
	}
	
	@RequestMapping(value="/jobsave",method=RequestMethod.POST)
	public String sa4(HttpServletRequest request)
	{
		String name = request.getParameter("name");
		String ipsaday = request.getParameter("ipsaday");
		String nowday = request.getParameter("nowday");
		SawonService ss = sqlsession.getMapper(SawonService.class);
		ss.jobinsert(name, ipsaday, nowday);
		return "main";
	}
	
	@RequestMapping(value="/joboutgo")
	public String sa4(Model mo)
	{
		SawonService ss = sqlsession.getMapper(SawonService.class);
		ArrayList<JobDTO> list = ss.jobout();
		mo.addAttribute("list", list);
		return "jobout";
	}
}
