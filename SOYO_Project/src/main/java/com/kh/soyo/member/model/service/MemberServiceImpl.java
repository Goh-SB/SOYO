package com.kh.soyo.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.deliveryAddress.model.vo.DeliveryAddress;
import com.kh.soyo.member.model.dao.MemberDao;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.product.model.vo.Product;
import com.kh.soyo.review.model.vo.Review;
import com.kh.soyo.wishlist.model.vo.Wish;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public ArrayList<Member> selectMemberList() {
		return null;
	}

	@Override
	public Member selectMember(String memberId) {
		return memberDao.selectMember(sqlSession, memberId);
	}

	@Transactional
	@Override
	public int updateMember(Member m) {
		return memberDao.updateMember(sqlSession, m);
	}

	@Transactional
	@Override
	public int deleteMember(String memberId) {
		return memberDao.deleteMember(sqlSession, memberId);
	}

	@Override
	public Member loginMember(Member m) {
		
		return memberDao.loginMember(sqlSession, m);
		
	}

	@Transactional
	@Override
	public int updatePwd(HashMap<String, String> hm) {
		
		return memberDao.updatePwd(sqlSession, hm);
	}

	@Override

	public int checkId(String checkId) {
		
		return memberDao.checkId(sqlSession, checkId);
	}
	public List<Product> orderProduct(String memberId,PageInfo pi) {
		
		return memberDao.orderProduct(sqlSession,memberId,pi);

	}

	@Transactional
	@Override
	public int insertMember(Member m) {
		
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public String findId(Member m) {
		
		return memberDao.findId(sqlSession, m);
	}

	// 비밀번호 재발급을 위한 메소드
	@Transactional
	@Override
	public int changePwd(Member m) {
		
		return memberDao.changePwd(sqlSession ,m);
	}

	// 이메일 찾기용 메소드
	@Override
	public String findEmail(Member m) {
		
		return memberDao.findEmail(sqlSession, m);
	}

	@Override
	public ArrayList<Review> myReview(String mi, PageInfo pi) {
		return memberDao.myReview(sqlSession, mi, pi);
	}
	
	public ArrayList<Product> orderProductList(String impNo) {
		
		return memberDao.orderProductList(sqlSession,impNo);

	}

	@Override
	public int myReviewCount(String mi) {
		
		return memberDao.myReviewCount(sqlSession,mi);
	}

	@Override
	public int myWishListCount(String mi) {
		
		return memberDao.myWishListCount(sqlSession, mi);
	}

	@Override
	public ArrayList<Wish> myWishList(String mi, PageInfo pi) {
		
		return memberDao.myWishList(sqlSession, mi, pi);
	}

	@Override
	public Wish myWishListSize(Wish mi) {
		
		return memberDao.myWishListSize(sqlSession, mi);
	}

	@Override
	public int listPageCount(Member loginUser) {
		return memberDao.listPageCount(sqlSession,loginUser);
	}

	@Override
	public int productCount(String impNo) {
		return memberDao.productCount(sqlSession,impNo);
	}

	@Override
	public Product myProduct(Product p1) {
		return memberDao.myProduct(sqlSession,p1);
	}

	@Override
	public DeliveryAddress defaultAddress(String memberId) {
		
		return memberDao.defaultAddress(sqlSession,memberId);
	}

	@Override
	public List<DeliveryAddress> selectAddress(String memberId) {

		return memberDao.selectAddress(sqlSession, memberId);
	}

	@Override
	public int addressList(String memberId) {
		return memberDao.addressList(sqlSession,memberId);
	}



}