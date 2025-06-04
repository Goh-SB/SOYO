package com.kh.soyo.member.model.dao;

import java.util.ArrayList;

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

}
