package com.hs.web.dao;

import java.util.List;

import com.hs.web.entities.Member;

public interface MemberDao {
	
	//아이디 중복 확인 이거로 충분;
	Member get(String mid);
/*	filed 검색창*/

	List<Member> getList(int page, String field, String query);
	int insert(Member member);
	int update(Member member);
	int delete(String mid);
}
