package com.kh.soyo.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.deliveryAddress.model.vo.DeliveryAddress;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;
import com.kh.soyo.review.model.vo.Review;
import com.kh.soyo.wishlist.model.vo.Wish;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
		
	}

	// 회원 정보 수정용 메소드
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember", m);
	}

	// 회원 삭제용 메소드
	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.update("memberMapper.deleteMember", memberId);
	}

	public int updatePwd(SqlSessionTemplate sqlSession, HashMap<String, String> hm) {
		
		return sqlSession.update("memberMapper.updatePwd", hm);
	}


	// 아이디 중복 체크용 메소드
	public int checkId(SqlSessionTemplate sqlSession, String checkId) {
		
		return sqlSession.selectOne("memberMapper.checkId" ,checkId);
	}
	// 회원이 주문한 상품 조회용 메소드
	public List<Product> orderProduct(SqlSessionTemplate sqlSession, String memberId,PageInfo pi) {
		
		int startRow = ((pi.getCurrentPage() - 1) * pi.getBoardLimit()) + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("memberId", memberId);
		return sqlSession.selectList("memberMapper.orderProduct",hm);

	}

	// 회원가입용 메소드
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public String findId(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.selectMember", memberId);
	}

	public int changePwd(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.newRandomPwd", m);
	}

	// 이메일 가져오기
	public String findEmail(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.findEmail", m);
	}


	public ArrayList<Review> myReview(SqlSessionTemplate sqlSession, String mi, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.myReview", mi, rowBounds);

	}
	public ArrayList<Product> orderProductList(SqlSessionTemplate sqlSession, String impNo) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.orderProductList",impNo);

	}

	// 리뷰 총 갯수 조회
	public int myReviewCount(SqlSessionTemplate sqlSession, String mi) {
		
		return sqlSession.selectOne("memberMapper.myReviewCount", mi);
	}

	public int myWishListCount(SqlSessionTemplate sqlSession, String mi) {
		
		return sqlSession.selectOne("memberMapper.myWishListCount", mi);
	}

	public ArrayList<Wish> myWishList(SqlSessionTemplate sqlSession, String mi, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.myWishList", mi, rowBounds);
	}

	public Wish myWishListSize(SqlSessionTemplate sqlSession, Wish mi) {
		
		return sqlSession.selectOne("memberMapper.myWishListSize", mi);
	}

	public int listPageCount(SqlSessionTemplate sqlSession, Member loginUser) {
		
		return sqlSession.selectOne("memberMapper.listPageCount",loginUser);
	}

	public int productCount(SqlSessionTemplate sqlSession, String impNo) {
		
		return sqlSession.selectOne("memberMapper.productCount",impNo);
	}

	public Product myProduct(SqlSessionTemplate sqlSession, Product p1) {
		return sqlSession.selectOne("memberMapper.myProduct",p1);
	}

	public DeliveryAddress defaultAddress(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.selectOne("memberMapper.defaultAddress",memberId);
	}

	public List<DeliveryAddress> selectAddress(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.selectList("memberMapper.selectAddress",memberId);
	}

	public int addressList(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.addressList",memberId);
	}

}