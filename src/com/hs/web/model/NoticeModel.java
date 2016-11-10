package com.hs.web.model;

import com.hs.web.entities.Notice;

public class NoticeModel extends Notice{
	
	
	private int cmtCnt;
	
	public int getCmtCnt(){
		
		return cmtCnt;
		
		
	}
	public void setCmtCnt(int cmtCnt){
		this.cmtCnt = cmtCnt;
	}
}
