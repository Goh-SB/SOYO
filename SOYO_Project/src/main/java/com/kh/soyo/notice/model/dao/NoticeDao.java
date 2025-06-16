package com.kh.soyo.notice.model.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	public ArrayList<Notice> noticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		// select문(여러 행 조회)
		return (ArrayList)sqlSession.selectList("noticeMapper.noticeList", null, rowBounds);
	}
	
	public int noticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.noticeListCount");
	}
	
	public Notice noticeDatail(SqlSessionTemplate sqlSession, int nno) {
		return sqlSession.selectOne("noticeMapper.noticeDetail", nno);
	}
	
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}
}