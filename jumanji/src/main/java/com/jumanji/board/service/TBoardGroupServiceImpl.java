package com.jumanji.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jumanji.board.mapper.TBoardGroupMapper;
import com.jumanji.board.model.TBoardGroupModel;
import com.jumanji.member.service.TMemberInfoServiceImpl;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class TBoardGroupServiceImpl implements TBoardGroupService{

	@Setter(onMethod_ = @Autowired)
	private TBoardGroupMapper mapper;
	
	@Override
	public TBoardGroupModel selectBoardGroup(String grp_id) {
		log.info("selectMember Service....");
		
		return mapper.selectBoardGroup(grp_id);
	}

}
