package com.kh.soyo.recent.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.recent.model.vo.Recent;

@Repository
public class RecentDao {

	public void updateRecent(SqlSessionTemplate sqlSession, Recent r) {
		
		// 회원번호와 제품번호를 넘겨 이미 등록되어있는지 검사
		String result = sqlSession.selectOne("recentMapper.selectRecentProductNo", r);
		
		if(result == null) {
			// 등록이 안되어있다면 최근본 상품의 갯수 알아오기
			int count = sqlSession.selectOne("recentMapper.selectRecentCount" ,r);

			if(count > 4) {
				// 5개가 넘으면 오래된 순부터 차례차례 지움
				int deleteSuccess = sqlSession.delete("recentMapper.deleteRecent" ,r);
				
				// 지우는데 성공했다면 등록하기
				if(deleteSuccess > 0) {
					
					// 이미 등록이 안되어있고 5개가 넘지 않으면 등록
					sqlSession.insert("recentMapper.insertRecent", r);
				}
				
			} else {
				// 5개가 안넘으면 등록
				sqlSession.insert("recentMapper.insertRecent", r);
			}
				
			
			
		}
		
		
	}

	public ArrayList<Recent> selectRecent(SqlSessionTemplate sqlSession, String memberId) {
		
		
 			return (ArrayList)sqlSession.selectList("recentMapper.selectRecent", memberId);
 		}
		
		
	}
	
