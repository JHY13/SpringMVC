package com.hs.web.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hs.web.dao.NoticeDao;
import com.hs.web.dao.NoticeFileDao;
import com.hs.web.dao.mybatis.MyBatisNoticeDao;
import com.hs.web.dao.mybatis.MyBatisNoticeFileDao;
import com.hs.web.entities.Notice;
import com.hs.web.entities.NoticeFile;
import com.hs.web.model.NoticeModel;

//컨트롤러다라고 알려주는것
@Controller
public class CustomerController {
	
	@Autowired
	private NoticeDao noticeDao;
	private NoticeFileDao noticeFileDao;
	public CustomerController() {
		/*noticeDao = new MyBatisNoticeDao();
		noticeFileDao = new MyBatisNoticeFileDao();*/
	}
	
	
	@RequestMapping("/customer/notice")
	public String notice(Integer p, String t, String q, Model model) {
		
	
		int page = 1;
		String field = "TITLE";
		String query = "";

		if (p != null && p != 0)
			page = p;

		if (t != null && !t.equals(""))
			field = t;

		if (q != null)
			query = q;
		// 매핑해주는 다오 실행해서 겟리스트로 값 가져
//		NoticeDao noticeDao = new MyBatisNoticeDao();
		noticeDao.getList(page, field, query);

		// 리스트 모델로 리스트로 이름정함
		List<NoticeModel> list;
		// 리스트 값들을 생성
	/*	list = new MyBatisNoticeDao().getList(page, field, query);*/
		list = noticeDao.getList(page, field, query);
		int count = noticeDao.getCount(field, query);

		model.addAttribute("list", list);
		model.addAttribute("count", count);

		//뷰정보를 주는곳
		return "/WEB-INF/views/customer/notice.jsp";
	}
	
	@RequestMapping("/customer/notice-detail")
	public String noticeDetail(String code, Model model) {
		/*String _code = request.getParameter("code");*/
	
//		NoticeDao noticeDao = new MyBatisNoticeDao();// 분리:재사용,분업화 (무슨 데이타베이스인지 명시하기위해서 Oracle이라고 써준다)
//		NoticeFileDao noticeFileDao = new MyBatisNoticeFileDao();
		
		Notice notice;
		List<NoticeFile> noticeFiles;
		
		/*0보고 들어갔다가 1이 들어가게끔하는것 원래 request뒤에있었음*/
		int hitUp = noticeDao.hitUp(code);
		
		notice = noticeDao.get(code);
				
		noticeFiles = noticeFileDao.getList(code);
		
		//모델 출력할 데이타
		model.addAttribute("n",notice);
		model.addAttribute("files", noticeFiles);
		model.addAttribute("prev", noticeDao.getPrev(code));
		model.addAttribute("next", noticeDao.getNext(code));
		
		return "/WEB-INF/views/customer/notice-detail.jsp";
	}

	public void noticeReg() {

	}

	public void noticeEdit() {

	}
}
