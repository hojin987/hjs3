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
public class QuestionCommentVO {
	
	private long qcomment_number ;
	private long qpost_number ;
	private String qcomment ;
	private String qcomment_writer ;
	private Date qcomment_register_date ;
	private long qreply_number ;
	private String qcomment_delete_flag ;

	private int lvl ;  //오라클 계층쿼리의 level 값을 저장할 필드
	
}
