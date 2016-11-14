package com.hs.web.controller;



import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.hs.web.dao.NoticeDao;
import com.hs.web.dao.NoticeFileDao;
import com.hs.web.entities.Notice;
import com.hs.web.entities.NoticeFile;
import com.hs.web.model.NoticeModel;

//컨트롤러다라고 알려주는것
@Controller
@RequestMapping("/customer/*")
public class CustomerController {

	@Autowired
	private NoticeDao noticeDao;
	@Autowired
	private NoticeFileDao noticeFileDao;


	public CustomerController() {
		/*noticeDao = new MyBatisNoticeDao();
		noticeFileDao = new MyBatisNoticeFileDao();*/
	}


	@RequestMapping("notice")
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

		/*타일즈를 설정하면 리턴값을 이런식으로 보여줘야한다 ***ioc에 들어가기 때문에 풀 경로를 안써줘도된다 디스패처에서 Resolver해서 이렇게됨*/
		return "customer.notice";
		//뷰정보를 주는곳
		//		return "/WEB-INF/views/customer/notice.jsp";
	}

	@RequestMapping("notice-detail")
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

		return "customer.notice-detail";
	}

	@RequestMapping(value="notice-reg", method=RequestMethod.GET)
	public String noticeReg() {

		return "customer.notice-reg";
	}

	@RequestMapping(value="notice-reg", method=RequestMethod.POST)
	public String noticeReg(Notice notice, @RequestParam(value="file") MultipartFile[] files, HttpServletRequest request) {


		ServletContext ctx =  request.getServletContext();
		String path = ctx.getRealPath("/customer/upload");

		File f = new File(path);
		if(!f.exists())
			if(!f.mkdirs())
				System.out.println("예기치않은 이유로 폴더 생성에 실패하였습니다.");


		for(int i=0;  i< files.length; i++){
			MultipartFile file = files[i];

			String fname = file.getOriginalFilename();
			String fpath = path + File.separator + fname;
			System.out.print(path + File.separator + fname);

			InputStream fis;
			OutputStream fos;

			try {
				fis = file.getInputStream();
				fos = new FileOutputStream(fpath);

				int count = -1;

				byte[] buf = new byte[1024];
				while((count = fis.read(buf)) != -1)

					fos.write(buf,0,count);
				fis.close();
				fos.close();

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		notice.setWriter("Jang94");
		noticeDao.insert(notice);
		String code = noticeDao.getLastCode();

		for(int i=0; i< files.length; i++)
		{
			NoticeFile nf = new NoticeFile();
			nf.setNoticeCode(code);
			nf.setSrc(files[i].getOriginalFilename());

			noticeFileDao.insert(nf);

		}
		return "redirect:notice";
	}
	
	@RequestMapping(value="notice-edit", method=RequestMethod.GET)
	public String noticeEdit(String code, Model model) {
		Notice notice;
		List<NoticeFile> noticeFiles;
		
		notice = noticeDao.get(code);
		noticeFiles = noticeFileDao.getList(code);
		
		model.addAttribute("n", notice);
		model.addAttribute("files", noticeFiles);

		return "customer.notice-edit";
	}
	
	@RequestMapping(value="notice-edit", method=RequestMethod.POST)
	public String noticeEdit(Notice notice) {

		return "redirect:notice";
	}
	
	@RequestMapping(value="notice-file-del", method= RequestMethod.GET)
	public String noticeFileDel(String code, String ncode, HttpServletRequest request)
	{
	/*	ServletContext ctx =  request.getServletContext();
		String path = ctx.getRealPath("/customer/upload");

		File f = new File(path);
		if(!f.exists())
			if(!f.mkdirs())
				System.out.println("예기치않은 이유로 폴더 생성에 실패하였습니다.");
		List<NoticeFile> nfs = noticeFileDao.getList(ncode);
		NoticeFile nf = nfs.get(Integer.parseInt(code));
		String fpath = path + File.separator + nf.getSrc();
		
		File file = new File(fpath);
		file.delete();
		
		if(!file.exists())*/
			noticeFileDao.delete(code);
		
		return "redirect:notice-edit?code="+ncode;
	}
	
}
