package com.hs.web.dao.mybatis;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hs.web.dao.NoticeDao;
import com.hs.web.entities.Notice;

public class Program {

	public static void main(String[] args) throws IOException, ClassNotFoundException, SQLException {
		//factory 부분
		String src = "com/hs/web/dao/mybatis/config.xml";
		InputStream is = Resources.getResourceAsStream(src);
		
		SqlSessionFactory ssf= new SqlSessionFactoryBuilder().build(is);
		
		/*-----------------------------------------------------------------*/
		
		//공장을 돌리라고하는 지시자 생성 dao부분
		SqlSession session = ssf.openSession();
		NoticeDao noticeDao = session.getMapper(NoticeDao.class);
		Notice n = noticeDao.get("981");
		
		
		System.out.println(n.getTitle());
	}

}
