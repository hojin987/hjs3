package com.soldesk.healthproject.common.paging.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeCommentPagingDTO {
	
	private long npost_number ;
	private int pageNum ;
	private int rowAmountPerPage ;

	
//	public noticeBoardPagingDTO() {
//		this.noticePageNum = 1 ;
//		this.rowAmountPerNoticePage = 10 ;
//	}

	//생성자: 목록 화면에서 사용자가 표시할 행수를 선택하고 페이징 번호 클릭 시,
	//페이지번호와 행수를 각각 사용자가 선택한 페이징번호와 표시행수로 전달
	public NoticeCommentPagingDTO(long npost_number, Integer pageNum) {
		
		this.npost_number = npost_number ;
		
		if (pageNum == null) {
			this.pageNum = 1 ;
			
		} else {
			this.pageNum = pageNum;
		}
		
		this.rowAmountPerPage = 10 ;
		
	}
	

	

}
