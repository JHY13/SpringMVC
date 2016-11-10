package com.hs.web.dao;

import java.sql.SQLException;
import java.util.List;

import com.hs.web.entities.Notice;
import com.hs.web.model.NoticeModel;


public interface NoticeDao {
	Notice get(String code);
	
/*	param1 page 2 field 3 query*/
	List<NoticeModel> getList(int page, String field, String query) ;
	List<NoticeModel> getList(int page) ;
	List<NoticeModel> getList();
	int insert(Notice notice);
	int update(Notice notice);
	int delete(String code);

	int getCount(String field, String query);
	
	String getLastCode();
	Notice getPrev(String code);
	Notice getNext(String code);
	int hitUp(String code);

	
}
