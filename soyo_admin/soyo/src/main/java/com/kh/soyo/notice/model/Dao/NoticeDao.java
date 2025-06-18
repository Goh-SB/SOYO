package com.kh.soyo.notice.model.Dao;

import java.util.ArrayList;
import java.util.HashMap;

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

	public int noticeEnrollForm(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.noticeEnrollForm", n);
	}

	public int noticeSearchCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {

		return sqlSession.selectOne("noticeMapper.noticeSearchCount", map);
	}

	public ArrayList<Notice> noticeSearchList(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi) {

		int startRow = ((pi.getCurrentPage() - 1) * pi.getBoardLimit()) + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		map.put("startRow", startRow);
		map.put("endRow",endRow);
		map.put("pi", pi);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.noticeSearchList", map);
	}

	public int noticeFilterCount(SqlSessionTemplate sqlSession, String item) {

		return sqlSession.selectOne("noticeMapper.noticeFilterCount", item);
	}

	public ArrayList<Notice> noticeFilter(SqlSessionTemplate sqlSession, String item, PageInfo pi) {

		int startRow = ((pi.getCurrentPage() - 1) * pi.getBoardLimit()) + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("item", item);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.noticeFilter", hm);
	}

	
	
}
