package com.goodjava.secondHomepage.MyController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goodjava.secondHomepage.Dto.BDto;
import com.goodjava.secondHomepage.Dto.pageMaker;
import com.goodjava.secondHomepage.service.BoardService;
import com.goodjava.secondHomepage.service.GoodMemberService;

@Controller
public class BoardController {
	
	@Autowired 
	private BoardService bService;
	
	@Autowired
	private GoodMemberService GMService;
	
//	@RequestMapping("boardList.do")
//	public ModelAndView boardList(@RequestParam HashMap<String, Object> params, HttpSession session) {
//		System.out.println("boardList()");
//		ModelAndView mav = new ModelAndView();
//		
//		session.setAttribute("member", GMService.getGMMember((String)session.getAttribute("GMId")));
//		//session.setAttribute("boardList", bService.AllList());
//		mav.addObject("boardList", bService.AllList());
//		mav.setViewName("board/boardList");
//		return mav;
//	}
	
	@RequestMapping("boardList.do")
	public ModelAndView boardList(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("boardList()");
		ModelAndView mav = new ModelAndView();
		pageMaker pagemaker = new pageMaker();
		
		int cpagenum = 0,ccontentnum=0;
		if(params.get("pagenum")==null || params.get("contentnum")==null) {
			String pagenum = String.valueOf(session.getAttribute("pagenum"));
			String contentnum = String.valueOf(session.getAttribute("contentnum"));
			cpagenum = Integer.parseInt(pagenum);
			ccontentnum = Integer.parseInt(contentnum);
		} else {
			String pagenum = String.valueOf(params.get("pagenum"));
			String contentnum = String.valueOf(params.get("contentnum"));
			cpagenum = Integer.parseInt(pagenum);
			ccontentnum = Integer.parseInt(contentnum);
		}
		
		pagemaker.setTotalcount(bService.pagingcount());//전체 게시글 개수를 지정한다
		pagemaker.setPagenum(cpagenum);
		pagemaker.setContentnum(ccontentnum);//한 페이지에 몇개씩 게시글을 보여줄지 지정한다
		pagemaker.setCurrentblock(cpagenum);//현재 페이지 블록이 몇번인지 현재 페이지 번호를 통해서 지정한다
		pagemaker.setLastblock(pagemaker.getTotalcount());//마지막 블록 번호를 전체 게시글 수를 통해서 정한다
		
		pagemaker.prevnext(cpagenum);//현재 페이지 번호로 화살표를 나타낼지 정한다
		pagemaker.setStartPage(pagemaker.getCurrentblock());//시작 페이지를 페이지 블록 번호로 정한다
		pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());
		//마지막 페이지를 마지막 페이지 블록과 현재 페이지 블록 번호로 정한다.
		
		session.setAttribute("page", pagemaker);
		if(session.getAttribute("GMId") != null) {
			System.out.println("session.getAttribute(\"GMId\")="+session.getAttribute("GMId"));
			session.setAttribute("member", GMService.getGMMember((String)session.getAttribute("GMId")));
		} else {
			System.out.println("session.getAttribute(\"GMId\")="+session.getAttribute("GMId"));
			session.setAttribute("member", GMService.getGMMember((String)params.get("GMId")));
		}
		//session.setAttribute("boardList", bService.AllList());
		mav.addObject("boardList", bService.AllList(pagemaker.getPagenum()*10, pagemaker.getContentnum()));
		mav.setViewName("board/boardList");
		return mav;
	}
	
	@RequestMapping("content_view.do")
	public ModelAndView content_view(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("content_view()");
		bService.upHit(params);
		String commentId = (String)params.get("bId");
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> contentparams=bService.selectOne(commentId);
		mav.addObject("bDto", contentparams);
		if (((String) contentparams.get("BNAME")).equals((String) params.get("bName"))) {
			session.setAttribute("member", GMService.getGMMember((String)params.get("bName")));
			mav.addObject("commentboard", bService.commentList(commentId));
			mav.setViewName("board/contentView");
		} else {
			session.setAttribute("bName", (String) params.get("bName"));
			mav.addObject("commentboard", bService.commentList(commentId));
			mav.setViewName("board/otherUsersContentView");
		}
		return mav;
	}
	
	@RequestMapping("delete.do")
	public ModelAndView delete(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("delete()");
		ModelAndView mav = new ModelAndView();
		String bName = (String)params.get("bName");
		//String adminId =(String)session.getAttribute("amdinId");
		if(bService.delete(((String)params.get("bId")))){
			bService.commentAllDel(((String)params.get("bId")));
			mav.setViewName("redirect:boardList.do");
		} else {
			mav.setViewName("redirect:content_view.do");
		}
		return mav;
	}
	
	@RequestMapping("write.do")
	public ModelAndView write(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("write()");
		ModelAndView mav = new ModelAndView();

		session.setAttribute("member", GMService.getGMMember((String)session.getAttribute("GMId")));
		mav.setViewName("board/writeboard");
		return mav;
	}
	
	@RequestMapping("writeOk.do")
	public ModelAndView writeOk(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("writeOk()");
		ModelAndView mav = new ModelAndView();
		if(bService.insert(params)) {
			session.setAttribute("GMId", (String)params.get("bName"));
			mav.setViewName("redirect:boardList.do");
		} else {
			mav.setViewName("redirect:write.do");
		}
		return mav;
	}
	
	@RequestMapping("modify.do")
	public ModelAndView modify(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("modify()");
		ModelAndView mav = new ModelAndView();
		//session.setAttribute("GMId", (String)params.get("bName"));
		if(session.getAttribute("bId")==null) {
			mav.addObject("bdto", bService.selectOne(((String)params.get("bId"))));
		} else {
			mav.addObject("bdto", bService.selectOne(((String)session.getAttribute("bId"))));
		}
		mav.setViewName("board/modify");
		return mav;
	}
	
	@RequestMapping("modifyOk.do")
	public ModelAndView modifyOk(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("modifyOk()");
		ModelAndView mav = new ModelAndView();
		if(bService.modify(params)) {
			session.setAttribute("GMId", (String)params.get("bName"));
			mav.setViewName("redirect:boardList.do");
		} else {
			//mav.addObject("params", params);
			session.setAttribute("bId", params.get("bId"));
			mav.setViewName("redirect:modify.do");
		}
		return mav;
	}
		
	@RequestMapping("reply.do")
	public ModelAndView reply(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("reply()");
		ModelAndView mav = new ModelAndView();
		String bName = null;
		String bId = null;
		
		if(params.get("bId")!=null && params.get("bName")!=null) {
			bId= (String)params.get("bId");
			bName = (String)params.get("bName");
		} else {
			bId = (String)session.getAttribute("bId");
			bName = (String)session.getAttribute("bName");
		}
		
		mav.addObject("bdto", bService.selectOne(bId));
		session.setAttribute("member", GMService.getGMMember(bName));
		mav.setViewName("board/reply");
		return mav;
	}
	
	@RequestMapping("replyOk.do")
	public ModelAndView replyOk(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("replyOk()");
		ModelAndView mav = new ModelAndView();
		if(bService.reply(params)) {
			session.setAttribute("GMId", (String)params.get("GMId"));
			mav.setViewName("redirect:boardList.do");
		} else {
			session.setAttribute("bId", params.get("bId"));
			session.setAttribute("bName", params.get("bName"));
			mav.setViewName("redirect:reply.do");
		}
		return mav;
	}
	
	@RequestMapping("comment.do")
	public ModelAndView comment(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("comment()");
		ModelAndView mav = new ModelAndView();
		
		String commentId = (String)params.get("commentId"); //bId
		String commentName = (String)params.get("commentName"); //GMId
		bService.insertComment(params);
		
		HashMap<String, Object> contentparams=bService.selectOne(commentId);
		mav.addObject("bDto", contentparams);
		mav.addObject("commentboard", bService.commentList(commentId));
		session.setAttribute("member", GMService.getGMMember(commentName));
		System.out.println("BNAME="+((String)contentparams.get("BNAME"))+", GMId="+commentName);
		if(((String)contentparams.get("BNAME")).equals(commentName)) {
			mav.setViewName("board/contentView");
		} else {
			mav.setViewName("board/otherUsersContentView");
		}
		return mav;
	}
	
	@RequestMapping("commentDel.do")
	public ModelAndView commentDel(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("commentDel()");
		ModelAndView mav = new ModelAndView();
		System.out.println("params="+params);
		String commentId = (String)params.get("commentId"); //bId
		String commentName = (String)params.get("commentName"); //GMId
		
		bService.commentDel(params);
		HashMap<String, Object> contentparams=bService.selectOne(commentId);
		mav.addObject("commentboard", bService.commentList(commentId));
		mav.addObject("bDto", contentparams);
		session.setAttribute("member", GMService.getGMMember(commentName));
		if(((String)contentparams.get("BNAME")).equals(commentName)) {
			mav.setViewName("board/contentView");
		} else {
			mav.setViewName("board/otherUsersContentView");
		}
		return mav;
	}
	
//----------------------------------------admin-----------------------------------------------------------------
	
	@RequestMapping("adminboardList.do")
	public ModelAndView adminboardList(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("adminboardList()");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("adminboardList", bService.adminAllList());
		if(((String)session.getAttribute("GMId")).equals("admin")) {
			session.setAttribute("member", GMService.getGMMember((String)session.getAttribute("GMId")));
			mav.setViewName("admin/adminboardList");
		} else {
			session.setAttribute("member", GMService.getGMMember((String)session.getAttribute("GMId")));
			mav.setViewName("admin/nomalAdminboardList");
		}
		return mav;
	} 
	
	@RequestMapping("admincontent_view.do")
	public ModelAndView admincontent_view(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("admincontent_view()");
		ModelAndView mav = new ModelAndView();
		bService.adminupHit((String)params.get("adminId"));
		System.out.println("params="+params);
		HashMap<String, Object> contentparams=bService.adminselectOne(((String)params.get("adminId")));
		mav.addObject("adminDto", contentparams);
		if (((String)params.get("adminName")).equals("admin")) {
			session.setAttribute("member", GMService.getGMMember((String)params.get("adminName")));
			mav.setViewName("admin/admincontentView");
		} else {
			session.setAttribute("member", GMService.getGMMember((String)params.get("adminName")));
			mav.setViewName("admin/adminotherUsersContentView");
		}
		
		return mav;
	}
	
	@RequestMapping("admindelete.do")
	public ModelAndView admindelete(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("admindelete()");
		ModelAndView mav = new ModelAndView();
		String adminId =(String)params.get("adminId");
		String adminName = (String)params.get("adminName");
		if(bService.admindelete(adminId)){
			mav.setViewName("redirect:adminboardList.do");
		} else {
			mav.setViewName("redirect:admincontent_view.do");
		}
		return mav;
	}
	
	@RequestMapping("adminwrite.do")
	public ModelAndView adminwrite(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("adminwrite()");
		ModelAndView mav = new ModelAndView();
		session.setAttribute("member", GMService.getGMMember((String)session.getAttribute("GMId")));
		mav.setViewName("admin/adminwriteboard");
		return mav;
	}
	
	@RequestMapping("adminwriteOk.do")
	public ModelAndView adminwriteOk(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("adminwriteOk()");
		ModelAndView mav = new ModelAndView();
		if(bService.admininsert(params)) {
			session.setAttribute("member", GMService.getGMMember((String)params.get("adminName")));
			mav.setViewName("redirect:adminboardList.do");
		} else {
			session.setAttribute("member", GMService.getGMMember((String)params.get("adminName")));
			mav.setViewName("redirect:adminwrite.do");
		}
		return mav;
	}
	
	@RequestMapping("adminmodify.do")
	public ModelAndView adminmodify(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("adminmodify()");
		ModelAndView mav = new ModelAndView();
		//session.setAttribute("GMId", (String)params.get("bName"));
		if(session.getAttribute("adminId")==null) {
			mav.addObject("admindto", bService.adminselectOne(((String)params.get("adminId"))));
		} else {
			mav.addObject("admindto", bService.adminselectOne(((String)session.getAttribute("adminId"))));
		}
		mav.setViewName("admin/adminmodify");
		return mav;
	}
	
	@RequestMapping("adminmodifyOk.do")
	public ModelAndView adminmodifyOk(@RequestParam HashMap<String, Object> params, HttpSession session) {
		System.out.println("adminmodifyOk()");
		ModelAndView mav = new ModelAndView();
		if(bService.adminmodify(params)) {
			session.setAttribute("GMId", (String)params.get("adminName"));
			mav.setViewName("redirect:adminboardList.do");
		} else {
			//mav.addObject("params", params);
			session.setAttribute("adminId", params.get("adminId"));
			mav.setViewName("redirect:adminmodify.do");
		}
		return mav;
	}
}
	

