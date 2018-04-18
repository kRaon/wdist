package com.wdist.biz.board.service;

import java.util.List;

import com.wdist.biz.board.vo.BoardVO;
import com.wdist.biz.board.vo.FileVO;
import com.wdist.biz.board.vo.ReplyVO;

public interface BoardService {
	public List<BoardVO> freeOrCsBoard(String Type);
	
	public List<BoardVO> viewBoard(int BoardNum);
	
	public List<FileVO> viewBoradFile(int BoardNum);
	
	public List<ReplyVO> viewBoardReply(int BoardNum);
	
	public int insertBoard(BoardVO boardVO, FileVO fileVO);
	
	// 덧글을 더 다는 경우에 어떻게 될지 생각해서 수정해야 할 수 있다.
	public int insertReply(ReplyVO vo);
	
	public int deleteBoard(int num);
	
	public int modifyBoard(BoardVO vo, FileVO fileVO);
}
