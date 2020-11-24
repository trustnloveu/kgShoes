package com.itbank.dao;

import java.util.HashMap;
import java.util.List;

import com.itbank.vo.BoardParam;
import com.itbank.vo.BoardReplyVO;
import com.itbank.vo.BoardVO;
import com.itbank.vo.ReplyParam;
import com.itbank.vo.ReviewsParam;
import com.itbank.vo.ReviewsVO;
import com.itbank.vo.ReviewsReplyVO;

public interface BoardDAO {

	void writeInsert(HashMap<String, String> map);

	List<BoardVO> selectAll(BoardParam bp);

	int getCount(BoardParam bp);

	BoardVO selectOne(int noticeNum);

	void writeUpdate(BoardVO vo);

	void deleteBoard(int noticeNum);

	void reviewInsert(ReviewsVO vo);

	List<ReviewsVO> selectReviewAll(ReviewsParam vo2);

	int getCount2(ReviewsParam vo2);

	int getMax();

	List<ReviewsReplyVO> selectAllReply();

	void insertReply(ReviewsReplyVO vo);

	List<ReviewsReplyVO> selectReply(ReplyParam vo2);

	Integer selectRnum(String merchanCode);

	ReviewsReplyVO selectReplyRenum(int renum);

	void updateReply(int reorder2);

	void updateRecomment(ReviewsReplyVO vo);

	void downReorder(int reorder);

	List<ReviewsReplyVO> selectReplyChild(int renum);

	void deleteReply(int renum);

	void updateReviews(ReviewsVO vo);

	void deleteReviewsReply(int rnum);

	ReviewsVO selectReviewOne(int rnum);

	int getCountReply(int rnum);

	int getCountBoardReply(int noticeNum);

	List<BoardReplyVO> selectBoardReply(ReplyParam vo2);

	List<BoardReplyVO> selectAllBoardReply();

	void insertBoardReply(BoardReplyVO vo);

	BoardReplyVO selectBoardReplyRenum(int renum);

	void updateBoardReply(int reorder2);

	void downBoardReplyReorder(int reorder);

	List<BoardReplyVO> selectBoardReplyChild(int renum);

	void deleteBoardReply(int renum);

	void deleteReviews(int rnum);

	void updateBoardReviewCount(int noticeNum);

	void updateBoardRePlyCount(int noticeNum);

	void updateBoardReplyCountDown(int noticeNum);

	int getBoardReplyMax();

	void updateBoardReply2(BoardReplyVO vo);
}
