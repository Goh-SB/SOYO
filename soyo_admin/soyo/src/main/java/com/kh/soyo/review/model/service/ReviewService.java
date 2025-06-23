package com.kh.soyo.review.model.service;

import java.util.ArrayList;

import com.kh.soyo.common.model.vo.PageInfo;
import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.review.model.vo.Review;

public interface ReviewService {

	int reviewListCount();

	ArrayList<Review> reivewList(PageInfo pi);

	int deleteBtn(Review review);

	int repairBtn(Review review);

	
}
