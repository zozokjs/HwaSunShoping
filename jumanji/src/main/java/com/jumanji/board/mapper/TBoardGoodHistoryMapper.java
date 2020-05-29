package com.jumanji.board.mapper;

import com.jumanji.board.model.TBoardGoodHistoryModel;

public interface TBoardGoodHistoryMapper {
	//1개의 게시글 입력
	public void insertBoardGoodHistory(TBoardGoodHistoryModel model);

	//1개의 게시글 삭제
	public int deleteBoardGoodHistory(TBoardGoodHistoryModel model);
	
	public TBoardGoodHistoryModel selectBoardGoodHistory(TBoardGoodHistoryModel model);

}
