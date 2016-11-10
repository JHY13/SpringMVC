package com.hs.web.dao.mybatis;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class HsSessionFactoryBuilder extends HttpServlet {
	   static String src ="com/hs/web/dao/mybatis/config.xml"; 
	   static SqlSessionFactory ssf=null;
	   
	 @Override
	public void init(ServletConfig config) throws ServletException {
		 InputStream is=null;
	      try {
	         is = Resources.getResourceAsStream(src);
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	      ssf = new SqlSessionFactoryBuilder().build(is);   
	}
	   
	   /*static{
	     
	   }*/
	   
	   public static SqlSessionFactory getSqlsessionFactory() {      
	      return ssf;
	   }

	}
/*public class HsSessionFactoryBuilder {
	
	static String src = "com/hs/web/dao/mybatis/config.xml";
	static SqlSessionFactory ssf = null;
	
	static{
		InputStream is = null;
		try{
			is = Resources.getResourceAsStream(src);
		}catch (IOException e) {
			e.printStackTrace();
		}
		ssf = new SqlSessionFactoryBuilder().build(is);
	}
	
	public static SqlSessionFactory getSqlsessionFactory(){
		return ssf;
	}

	InputStream is = Resources.getResourceAsStream(src);
	
	SqlSessionFactory ssf= new SqlSessionFactoryBuilder().build(is);
}*/
