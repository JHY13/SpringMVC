package com.hs.web.dao.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import com.hs.web.dao.NoticeFileDao;
import com.hs.web.entities.NoticeFile;
import com.hs.web.model.NoticeModel;

public class MyBatisNoticeFileDao implements NoticeFileDao {
	/*SqlSessionFactory ssf;
	
	public  MyBatisNoticeFileDao(){
		ssf = HsSessionFactoryBuilder.getSqlsessionFactory();
		
	}*/
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<NoticeFile> getList(String noticeCode) {
//		SqlSession session = ssf.openSession();
		NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);
		
		List<NoticeFile> list = noticeFileDao.getList(noticeCode);
//		session.close();
		
		return list;
	}
	



	@Override
	public int insert(NoticeFile noticefile) {
//		SqlSession session = ssf.openSession();
		NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);
		
		int result = noticeFileDao.insert(noticefile);
//		session.commit();
//		session.close();
		
		return result;
	}

	@Override
	public int update(NoticeFile noticefile) {
//		SqlSession session = ssf.openSession();
		NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);
		
		int result = noticeFileDao.update(noticefile);
//		sqlSession.commit();
//		sqlSession.close();
		
		return result;
	}

	@Override
	public int delete(String code) {
//		SqlSession session = ssf.openSession();
		NoticeFileDao noticeFileDao = sqlSession.getMapper(NoticeFileDao.class);
		
		int result = noticeFileDao.delete(code);
//		session.commit();
//		session.close();
		
		return result;
	}





	

}
