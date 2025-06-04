package com.kh.soyo.notice.model.Dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	public int noticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.noticeListCount");
	}

	public ArrayList<Notice> noticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.noticeList", null, rowBounds);
	}

	public int noticeDelete(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.noticeDelete", noticeNo);
	}

	public int noticeRepair(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.noticeRepair", noticeNo);
	}

	public Notice noticeDatail(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.noticeDetail", noticeNo);
	}

	
	
}
