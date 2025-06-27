package com.kh.soyo.recent.model.service;

import java.util.ArrayList;

import com.kh.soyo.member.model.vo.Member;
import com.kh.soyo.recent.model.vo.Recent;

public interface RecentService {

	void updateRecent(Recent r);

	ArrayList<Recent> selectRecent(String memberId);


}
