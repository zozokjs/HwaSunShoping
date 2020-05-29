package com.jumanji.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jumanji.board.mapper.TBoardContentMapper;
import com.jumanji.board.mapper.TBoardGroupMapper;
import com.jumanji.board.model.TBoardContentModel;
import com.jumanji.board.model.TBoardGroupModel;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TBoardContentMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	TBoardContentMapper mapper;

	
	//게시글  1개 조회
	//@Test
	public void testSelectBoardContent() {
		 
		TBoardContentModel model = new TBoardContentModel();		
		TBoardContentModel model2 = new TBoardContentModel();		
	
		model.setBrd_idx(5);
		model.setGrp_id("PRD_001");
		model2 = mapper.selectBoardContent(model);		
		log.info(model2);		
		
		//게시글 내용 컬럼인 byte 자료형을 string으로 변환함
		byte[] a = model2.getBrd_content();
		String stringed = new String(a);
		log.info(stringed);
	}
	
	//해당 게시판 그룹 ID에 해당되는 모든 게시글 조회(del_flag가 Y 아닌 것만)
	@Test
	public void testSelectBoardContentAll() {
		 
		TBoardContentModel model = new TBoardContentModel();	
		
		String grp_id = "PRD_001";
		
		mapper.selectBoardContentAll(grp_id).forEach(element -> log.info(element)); 
	}
	
	
	//게시글 1개 입력
	//@Test
	public void testInsertBoardContent() {
		TBoardContentModel model = new TBoardContentModel();
		model.setGrp_id("PRD_001");
		model.setUser_idx(2);
		model.setBrd_title("db입력제목");
		
		//게시글 내용은 바이트 변환
		String brd_content = "db 입력 내용";
		byte[] brd_content2 = brd_content.getBytes(); 
		model.setBrd_content(brd_content2);
		
		model.setRead_count(1);
		model.setParent_brd_idx(0);
		
		mapper.insertBoardContent(model);
		log.info(model);
	}
	
	
	//게시글 1개 업데이트	
	//@Test
	public void testModifyBoardContent() {
		TBoardContentModel model = new TBoardContentModel();
		model.setBrd_idx(5);
		model.setGrp_id("PRD_001");
		/*
		 * model.setGrp_id("PRD_001"); model.setBrd_title("db입력제목수정1");
		 * 
		 * //게시글 내용은 바이트 변환 String brd_content = "db 입력 내용 수정";
		 */
		
		model.setDel_flag("Y");
		//byte[] brd_content2 = brd_content.getBytes(); 
		//model.setBrd_content(brd_content2);
		
		mapper.modifyBoardContent(model);
		log.info(model);
	}

	//1개의 게시글 조회수 증가
	//@Test
	public void testModifyBoardCount() {
		TBoardContentModel model = new TBoardContentModel();
		model.setBrd_idx(1);
		model.setGrp_id("PRD_001");
		model.setRead_count(2);
		mapper.modifyBoardCount(model);
		log.info(model);
	}
	
	//1개의 게시글 삭제
	//@Test
	public void testDeleteBoardContent() {
		TBoardContentModel model = new TBoardContentModel();
		model.setBrd_idx(4);
		model.setGrp_id("PRD_001");
		
		log.info("delete count : "+mapper.deleteBoardContent(model));
	}
	
	
	
}
