package com.soldesk.healthproject.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soldesk.healthproject.common.paging.domain.BoardPagingDTO;
import com.soldesk.healthproject.mapper.FreeBoardMapper;
import com.soldesk.healthproject.mapper.NoticeBoardMapper;
import com.soldesk.healthproject.mapper.TicketMapper;

@Service
public class HomeServiceImpl implements HomeService {
	
	private NoticeBoardMapper noticeBoardMapper;
	private FreeBoardMapper freeBoardMapper;
	private TicketMapper ticketMapper;
	
	public HomeServiceImpl(NoticeBoardMapper noticeBoardMapper,
						   FreeBoardMapper freeBoardMapper,
						   TicketMapper ticketMapper) {
		this.noticeBoardMapper = noticeBoardMapper ;
		this.freeBoardMapper = freeBoardMapper ;
		this.ticketMapper = ticketMapper ;
	}

	@Override
	@Transactional
	public void getAllBoard(BoardPagingDTO noticeBoardPaging,
							BoardPagingDTO freeBoardPaging) {
		noticeBoardMapper.selectNoticeBoardList(noticeBoardPaging);
		freeBoardMapper.selectFreeBoardList(freeBoardPaging);
		ticketMapper.selectTicketList();
		
	}

}
