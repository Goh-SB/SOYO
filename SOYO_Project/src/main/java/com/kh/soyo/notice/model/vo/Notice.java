package com.kh.soyo.notice.model.vo;

import java.sql.Date;
import org.apache.ibatis.type.Alias;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Alias("notice")
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Notice {
	private int noticeNo;			// 공지 번호
	private String noticeTitle;		// 공지 제목
	private String noticeContent;	// 공지 내용
	private Date noticeDate;		// 공지 작성일
	private String status;			// 공지 삭제 여부
	private String noticeImage;		// 첨부파일
}