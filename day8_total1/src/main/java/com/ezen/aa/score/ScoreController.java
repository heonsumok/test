package com.ezen.aa.score;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ScoreController 
{
	@Autowired
	SqlSession sqlsession;//DB에 저장하기 위함
	
	@RequestMapping(value="/scoreinputgo")
	public String kk()
	{
		return "scoreinput";
	}
	
	@RequestMapping(value="/scoresave")
	public String kk1(HttpServletRequest request)
	{
		int bunho = Integer.parseInt(request.getParameter("bunho"));
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int mat = Integer.parseInt(request.getParameter("mat"));
		ScoreService ss = sqlsession.getMapper(ScoreService.class);
		ss.scoreinsert(bunho, name, kor, eng, mat);
		return "main";
	}
	
	@RequestMapping(value="/scoreoutgo")
	public String kk2(Model mo)
	{
		ScoreService ss = sqlsession.getMapper(ScoreService.class);
		ArrayList<ScoreDTO> list = ss.scoreout();
		mo.addAttribute("list", list);
		return "scoreout";
	}
}
