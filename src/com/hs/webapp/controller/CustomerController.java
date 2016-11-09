package com.hs.webapp.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//컨트롤러다라고 알려주는것
@Controller
public class CustomerController {
	
	@RequestMapping("/customer/notice")
	public String notice(String t, String q) {
		return "/WEB-INF/views/customer/notice.jsp";
	}

	public void noticeDetail() {

	}

	public void noticeReg() {

	}

	public void noticeEdit() {

	}
}
