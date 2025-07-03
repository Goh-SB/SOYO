package com.kh.soyo.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.member.model.vo.Member;

@Repository
public class MemberDao {

	public ArrayList<Member> MemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1 ) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.memberList", null, rowBounds);
	}

	public int memberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.memberListCount");
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.update("memberMapper.deleteMember", memberId);
	}

	public int repairMember(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.update("memberMapper.repairMember", memberId);
	}

	public Member memberDetail(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.memberDetail", memberId);
	}

	public int memberUpdateForm(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.memberUpdateForm", m);
	}


	public int searchMemberCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("memberMapper.searchMemberCount", map);
	}

	public ArrayList<Member> searchMember(SqlSessionTemplate sqlSession, PageInfo pi,
			HashMap<String, Object> map) {
		
		int startRow = ((pi.getCurrentPage() - 1) * pi.getBoardLimit()) + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return (ArrayList)sqlSession.selectList("memberMapper.searchMember", map);
	}

	public int filterCount(SqlSessionTemplate sqlSession, String item) {

		return sqlSession.selectOne("memberMapper.filterCount", item);
	}

	public ArrayList<Member> filter(SqlSessionTemplate sqlSession, PageInfo pi, String item) {

		int startRow = ((pi.getCurrentPage() - 1) * pi.getBoardLimit()) + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("item", item);
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		
		return (ArrayList)sqlSession.selectList("memberMapper.filter", hm);
	}

	public List<Map<String, Object>> chart1Data(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("memberMapper.chart1Data");
	}

	public int percentMen(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("memberMapper.percentMen");
	}

	public int percentWomen(SqlSessionTemplate sqlSession) {

		return sqlSession.selectOne("memberMapper.percentWomen");
	}

	public int percentNoGender(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.percentNoGender");
	}


}
