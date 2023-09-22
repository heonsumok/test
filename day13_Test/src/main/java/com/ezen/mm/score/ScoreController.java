package com.ezen.mm.score;

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



@Controller
public class ScoreController 
{
	@Autowired
	SqlSession sqlsession;
	
	@RequestMapping(value = "/scoreinputgo")
	public String scoreinput()
	{
		return "scoreinput";
	}
	
	@RequestMapping(value = "/scoresave",method=RequestMethod.POST)
	public String scoresave(HttpServletRequest request)
	{
		int num = Integer.parseInt(request.getParameter("num"));
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
		ScoreService ss = sqlsession.getMapper(ScoreService.class);
		ss.scoreinsert(num, name, kor, eng, mat);
		return "main";
	}
	
	@RequestMapping(value = "/scoreoutgo")
	public String scoreout(HttpServletRequest request, Model mo)
	{
		
		ScoreService ss = sqlsession.getMapper(ScoreService.class);
		ArrayList<ScoreDTO> list = ss.scoreout();
		mo.addAttribute("list", list);		
		return "scoreout";
	}
	
	@RequestMapping(value="/scorenotice")
    public String scorenotice(HttpServletRequest request, PageDTO dto,Model mo) {
       String nowPage=request.getParameter("nowPage");
       String cntPerPage=request.getParameter("cntPerPage");
       ScoreService notice = sqlsession.getMapper(ScoreService.class);
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
       return "scoreout";
    }
}
