package com.soldesk.healthproject.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NoticeCommentVO {
	
	private long ncomment_number ;
	private long npost_number ;
	private String ncomment ;
	private String ncomment_writer ;
	private Date ncomment_register_date ;
	private long nreply_number ;
	private String ncomment_delete_flag ;

	private int lvl ;  //오라클 계층쿼리의 level 값을 저장할 필드
	
}
