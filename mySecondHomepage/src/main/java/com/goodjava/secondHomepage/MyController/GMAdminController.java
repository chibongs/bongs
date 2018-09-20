package com.goodjava.secondHomepage.MyController;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goodjava.secondHomepage.service.GoodMemberService;

@Controller
public class GMAdminController {
	
	@Autowired 
	private GoodMemberService GMService;
	
	@RequestMapping("login.do")
	public String login(HttpSession session) {
		System.out.println("login()");
		if(session.getAttribute("error")==null) {
			session.setAttribute("error", "NoError");
		} else if(((String)session.getAttribute("error")).equals("error")) {
			session.setAttribute("error", "error");
		} else if(((String)session.getAttribute("error")).equals("logout")){
			session.setAttribute("error", "logout");
		} else {
			session.setAttribute("error", "NoError");
		}
//		return "Example";
		return "login";
	}
	
	@RequestMapping("signUp.do")
	public String signUp(Model model) {
		System.out.println("signUp()");
		return "signUp";
	}
	
	@RequestMapping(value="signUpConfig.do", method = RequestMethod.POST)
	public String signUpConfig(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("signUpConfig()");
		GMService.signUpMember(params);
		session.setAttribute("error", "noError");
		return "redirect:login.do";
	}

	@RequestMapping("loginOk.do")
	public ModelAndView loginOk(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("loginOk()");
		ModelAndView mav = new ModelAndView();
		if(GMService.searchGMId((String)params.get("GMId"),(String)params.get("GMPw"))&&!((String)params.get("GMId")).equals("admin")) {
			session.setAttribute("GMId", (String)params.get("GMId"));
			session.setAttribute("member", GMService.getGMMember((String)params.get("GMId")));
			mav.setViewName("redirect:main.do");
		}  else if(GMService.searchGMId((String)params.get("GMId"),(String)params.get("GMPw"))&&((String)params.get("GMId")).equals("admin")) {
			session.setAttribute("member", GMService.getGMMember((String)params.get("GMId")));
			session.setAttribute("GMId", (String)params.get("GMId"));
			mav.setViewName("redirect:supermain.do");
		} else {
			session.setAttribute("error", "error");
			mav.setViewName("redirect:login.do");
		}
		return mav;
	}
	
	@RequestMapping("main.do")
	public ModelAndView main(@RequestParam HashMap<String, Object> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("main()");
		String GMId = (String)session.getAttribute("GMId");
		if(GMId.equals("admin")) {
			mav.setViewName("redirect:supermain.do");
		} else {
			params = GMService.getGMMember(GMId);
			mav.addObject("params", params);
			mav.setViewName("main");
		}
		return mav;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		System.out.println("logout()");
		//session.invalidate();
		session.removeAttribute("GMId");
		session.setAttribute("error", "logout");
		return "redirect:login.do";
	}
	
	@RequestMapping("GMinfo.do")
	public ModelAndView GMinfo(@RequestParam HashMap<String, Object> params, HttpServletRequest request) {
		System.out.println("GMinfo()");
		ModelAndView mav = new ModelAndView();
		
		params = GMService.getGMMember(request.getParameter("GMId"));
		mav.addObject("params", params);
		mav.setViewName("GMinfo");
		return mav;
	}
	
	@RequestMapping("GMModify.do")
	public ModelAndView GMModify(@RequestParam HashMap<String, Object> params, HttpServletRequest request) {
		System.out.println("GMModify()");
		ModelAndView mav = new ModelAndView();
		
		params = GMService.getGMMember(request.getParameter("GMId"));
		mav.addObject("params", params);
		mav.setViewName("GMModify");
		return mav;
	} 
		
	@RequestMapping("GMPwModify.do")
	public ModelAndView GMPwModify(@RequestParam HashMap<String, Object> params, HttpServletRequest request) {
		System.out.println("GMPwModify()");
		ModelAndView mav = new ModelAndView();
		
		params = GMService.getGMMember(request.getParameter("GMId"));
		mav.addObject("params", params);
		mav.setViewName("GMPwModify");
		return mav;
	}
	
	@RequestMapping("GMModifyOk.do")
	public ModelAndView GMModifyOk(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("GMModifyOk()");
		ModelAndView mav = new ModelAndView();
		
		if(GMService.updateGM(params)) {
			session.setAttribute("GMId", (String)params.get("GMId"));
			mav.setViewName("redirect:main.do");
		} else {
			String GMId = (String)params.get("GMId");
			params = GMService.getGMMember(GMId);
			mav.addObject("params", params);
			mav.setViewName("GMModify"); 
		}
		return mav;
	}
	
	@RequestMapping("GMPwModifyOk.do")
	public ModelAndView GMPwModifyOk(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("GMPwModifyOk()");
		ModelAndView mav = new ModelAndView();
		if(GMService.updateGMPW(params)) {
			session.setAttribute("GMId", (String)params.get("GMId"));
			mav.setViewName("redirect:main.do");
		} else {
			String GMId = (String)params.get("GMId");
			params = GMService.getGMMember(GMId);
			mav.addObject("params", params);
			mav.setViewName("GMModify"); 
		}
		return mav;
	}
	
	@RequestMapping("byeGM.do")
	public ModelAndView byeGM(@RequestParam HashMap<String, Object> params, HttpServletRequest request) {
		System.out.println("byeGM()");
		ModelAndView mav = new ModelAndView();
		
		params = GMService.getGMMember(request.getParameter("GMId"));
		mav.addObject("params", params);
		mav.setViewName("byeGM");
		return mav;
	}

	@RequestMapping("byeGMOk.do")
	public ModelAndView byeGMOk(@RequestParam HashMap<String, Object> params, HttpServletRequest request, HttpSession session) {
		System.out.println("byeGMOk()");
		ModelAndView mav = new ModelAndView();
		String byeGM = request.getParameter("byeGM");

		
		if(byeGM.equals("byeGMNo")) {
			mav.setViewName("redirect:main.do");
		} else {
			session.setAttribute("error", "NoError");
			params = GMService.getGMMember(request.getParameter("GMId"));
			GMService.deleteGM(params);
			mav.setViewName("redirect:login.do");
		}
		return mav;
	}
	
//------------------------------------admin----------------------------------------------------------	
	
	@RequestMapping("supermain.do")
	public ModelAndView supermain(@RequestParam HashMap<String, Object> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("supermain()");
		String GMId = (String)session.getAttribute("GMId");
		
		params = GMService.getGMMember(GMId);
		mav.addObject("params", params);
		if(GMId.equals("admin")) {
			mav.setViewName("admin/supermain");
		} else {
			mav.setViewName("main");
		}
		return mav;
	}
	
	@RequestMapping("allGMinfo.do")
	public ModelAndView allGMinfo(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("allGMinfo()");
		ModelAndView mav = new ModelAndView();
		List<HashMap<String, Object>> members = GMService.allGMMember();
		
		mav.addObject("admin", GMService.getGMMember((String)params.get("GMId")));
		mav.addObject("members", members);
		mav.setViewName("admin/allGMinfo");
		return mav;
	}
	
}
