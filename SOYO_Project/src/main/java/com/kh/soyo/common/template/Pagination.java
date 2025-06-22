package com.kh.soyo.common.template;

import com.kh.soyo.common.model.vo.PageInfo;

public class Pagination {
	// 7개의 변수를 미리 설정해서 하나의 PageInfo 객체로 만드는 메소드
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		/// 4개의 기본 변수를 매개 변수로 받아서 나머지 3개의 변수를 계산
		// listCount에서 boardLimit를 나눈 값(나머지가 있다면 올림 처리)
		int maxPage = (int) Math.ceil((double) listCount / boardLimit);
		
		// currentPage와 pageLimit의 영향을 받음
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// startPage와 pageLimit의 영향을 받음
		int endPage = startPage + pageLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		// 9개의 변수를 PageInfo로 가공해서 반환
		return new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage, startRow, endRow);
	}
}