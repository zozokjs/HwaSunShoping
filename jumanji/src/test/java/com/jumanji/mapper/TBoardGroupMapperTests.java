package com.jumanji.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jumanji.board.mapper.TBoardGroupMapper;
import com.jumanji.board.model.TBoardGroupModel;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TBoardGroupMapperTests {

	@Setter(onMethod_ = @Autowired)
	TBoardGroupMapper mapper;

	
	//게시판 그룹 1개 조회
	@Test
	public void testSelectBoardGroup() {
		
		TBoardGroupModel model = new TBoardGroupModel();		
		String grp_id = "PRD_001";
		model = mapper.selectBoardGroup(grp_id);		
		log.info(model);		
	}
	
	
}
