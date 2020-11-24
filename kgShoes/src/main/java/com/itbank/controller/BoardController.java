package com.itbank.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.BoardService;
import com.itbank.vo.BoardVO;
import com.itbank.vo.ReviewsVO;

// << 2020년 08월 04일 ~ 07일 작업 중 >>
@Controller
@RequestMapping("board/")
public class BoardController {

	@Autowired private BoardService bs;
	private final String filePath = "D:\\boardImg\\";

//	<< 2020년 08월 07일 작업 부분 >>
	// 검색 필터 및 페이징 후 리스트 반환하는 함수
	@RequestMapping(value="", method=RequestMethod.GET)
	public ModelAndView boardList(HttpServletRequest req) {
		return board(1, req);
	}
	
//	<< 2020년 08월 07일 작업 부분 >>
	// 검색 필터 및 페이징 후 리스트 반환하는 함수
	@RequestMapping(value="", method=RequestMethod.POST)
	public ModelAndView boardListPost(HttpServletRequest req) {
		return board(1, req);
	}
	
//	<< 2020년 08월 07일 작업 부분 >>
	// 검색 필터 및 페이징 후 리스트 반환하는 함수
	@RequestMapping("{page}/")
	private ModelAndView board(@PathVariable("page") int page, HttpServletRequest req) {
		return bs.selectBoardListAll(page, req);
	}

//	<< 2020년 08월 07일 작업 부분 >>
	// 새 글 쓰기 작동 부분(get)
	@RequestMapping(value="boardWrite/", method=RequestMethod.GET)
	public ModelAndView boardWrite() {
		ModelAndView mav = new ModelAndView("boardWrite");
		return mav;
	}
	
//	<< 2020년 08월 06일 작업 부분 >>
	// 새 글 쓰기 작동 부분(post)
	@RequestMapping(value="boardWrite/", method=RequestMethod.POST)
	public ModelAndView boardWriteInsert(MultipartRequest mpRequest, HttpServletRequest req) throws IOException, StringIndexOutOfBoundsException {
		ModelAndView mav = new ModelAndView("redirect:/board/");
		String img = "";
		
		req = (HttpServletRequest) mpRequest;
		String type = req.getParameter("type");
		String title = req.getParameter("title");
		String writer = req.getParameter("writer");
		String context = req.getParameter("context");
		
		MultipartFile mpFile = mpRequest.getFile("userFile");
		String originalFileName = mpFile.getOriginalFilename();		// 이미지에 대한 originalname을 받아서
		int lastIndex = originalFileName.lastIndexOf(".");			

		if(lastIndex != -1) {	// lastIndex가 -1이 아니라면, 비교하는 길이가 음수가 아니면
			String extName = originalFileName.substring(originalFileName.lastIndexOf("."));	// 확장자만 뽑아서 저장			
			String imgSrc = UUID.randomUUID().toString().replace("-", "") + extName;		// 이미지 경로 저장
			img = imgSrc;
		}
		
		if(type.equals("noti")) {
			type = "공지사항";
		}
		
		boolean flag = img.equals("");		// img가 빈 문자열이면 true
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("title", title);
		map.put("writer", writer);
		map.put("context", context);
		if(flag == false) {		// img가 빈 문자열이 아니면 (파일을 받았다면)
			File file = new File(filePath + img);
			mpFile.transferTo(file);
			map.put("img", img);
		}
		bs.writeInsert(map);
		return mav;
	}
	
//	<< 2020년 08월 07일 작업 >>
	// 검색(필터) 및 정렬 초기화
	@RequestMapping("searchInit/")
	public ModelAndView searchInit() {
		return bs.searchInit();
	}

//	<< 2020년 08월 07일 작업 >>
	// 선택한 게시글 정보 불러오기
	@RequestMapping(value="read/{noticeNum}/{number}/", method=RequestMethod.GET)
	public ModelAndView readGet(@PathVariable("noticeNum") int noticeNum, @PathVariable("number") int number, HttpServletRequest req) {
		return boardReply(1, number, noticeNum, req);	
	}
	
//	<< 2020년 08월 15일 작업 >>
	// 댓글 입력
	@RequestMapping(value="read/{noticeNum}/{number}/", method=RequestMethod.POST)
	public ModelAndView insertBoardReply(@PathVariable("noticeNum")int noticeNum, @PathVariable("number")int number, HttpServletRequest req) {
		return bs.insertBoardReply(noticeNum, number, req);
	}
	
//	<<  >>
	// 게시글에 대한 댓글(페이지 클릭 시)
	@RequestMapping(value="read/{page}/{number}/{noticeNum}/", method=RequestMethod.GET)
	public ModelAndView boardReply(@PathVariable("page")int page, @PathVariable("number") int number, 
			@PathVariable("noticeNum") int noticeNum, HttpServletRequest req) {
		return bs.selectBoardOne(noticeNum, number, req, page);
	}
	
//	<< 2020년 8월 20일 수정 >>
	// 댓글 수정
	@RequestMapping("boardReplyUpdate/{noticeNum}/{number}/")
	public ModelAndView boardReplyUpdate(@PathVariable("noticeNum") int noticNum,
			@PathVariable("number")int number, HttpServletRequest req) {
		return bs.boardReplyUpdate(noticNum, number, req);
	}
	
//	<< 2020년 8월 15일 작업 >>
	// 답글 달기(게시판 페이지)
	@RequestMapping(value="boardReplyRecomment/{noticeNum}/{number}/", method=RequestMethod.POST)
	public ModelAndView boardReplyRecomment(@PathVariable("noticeNum") int noticeNum, 
			@PathVariable("number") int number, HttpServletRequest req) {
		return bs.boardReplyRecomment(noticeNum, number, req);
	}
	
	// 답글 삭제(게시판 페이지)
	@RequestMapping("deleteBoardReply/{noticeNum}/{renum}/{number}/")
	public ModelAndView deleteBoardReply(@PathVariable("noticeNum")int noticeNum, @PathVariable("renum")int renum,
			@PathVariable("number")int number) {
		return bs.deleteBoardReply(noticeNum, renum, number);
	}
	
//	<< 2020년 08월 10일 작업 >>
	// 게시글 수정페이지 이동
	@RequestMapping(value="boardUpdate/{noticeNum}", method=RequestMethod.GET)
	public ModelAndView boardUpdate(@PathVariable("noticeNum") int noticeNum) {
		return bs.boardUpdate(noticeNum);
	}
	
//	<< 2020년 8월 10일 작업 >>
	// 게시글 수정
	@RequestMapping(value="boardUpdate/{noticeNum}", method=RequestMethod.POST)
	public ModelAndView boardUpdatePost(@PathVariable("noticeNum") int noticeNum, HttpServletRequest req, 
			MultipartRequest mpRequest, BoardVO vo) throws IOException {
		return bs.boardUpdatePost(noticeNum, req, mpRequest, vo);
	}
	
//	<< 2020년 8월 10일 작업 >>
	// 해당 게시글 삭제
	@RequestMapping("boardDelete/{noticeNum}")
	public ModelAndView deleteBoard(@PathVariable("noticeNum") int noticeNum) {
		return bs.deleteBoard(noticeNum);
	}
	
//	<< 2020년 8월 13일 작업 >>
	// 후기 페이지로 이동
	@RequestMapping("reviewRead/{rnum}/{merchanCode}/{number}/")
	public ModelAndView reviewRead(@PathVariable("rnum") int rnum, @PathVariable("merchanCode") String merchanCode,
			@PathVariable("number") int number) {
		return reviewReadPage(1, rnum, merchanCode, number);
	}

	
	
//	<< 2020년 8월 13일 작업 >>
	// 후기 페이지로 이동(페이지 클릭 시)
	@RequestMapping(value="reviewRead/{page}/{rnum}/{merchanCode}/{number}/")
	public ModelAndView reviewReadPage(@PathVariable("page") int page, @PathVariable("rnum") int rnum, 
			@PathVariable("merchanCode") String merchanCode, @PathVariable("number") int number) {
		return bs.reviewRead(page, rnum, merchanCode, number);
	}

//	<< 2020년 8월 12일 작업 >>
	// 후기 작성
	@RequestMapping(value="reviews/{merchanCode}", method=RequestMethod.POST)
	public ModelAndView reviewInsert(@PathVariable("merchanCode") String merchanCode, HttpServletRequest req, 
			MultipartRequest mpRequest, ReviewsVO vo) throws IllegalStateException, IOException {
		return bs.reviewInsert(merchanCode, req, mpRequest, vo);
	}
	
//	<< 2020년 8월 12일 작업 >>
	// 후기 수정
	@RequestMapping(value="reviewUpdate/{merchanCode}/{rnum}/", method=RequestMethod.POST)
	public ModelAndView reviewUpdate(@PathVariable("merchanCode") String merchanCode, @PathVariable("rnum") int rnum, 
			HttpServletRequest req, MultipartRequest mpRequest) throws IllegalStateException, IOException {
		return bs.reviewUpdate(merchanCode, rnum, req, mpRequest);
	}


	
//	<< 2020년 8월 13일 작업 >>
	// 후기 삭제
	@RequestMapping(value="deleteReviews/{merchanCode}/{rnum}/")
	public ModelAndView deleteReviews(@PathVariable("merchanCode")String merchanCode, @PathVariable("rnum")int rnum) {
		System.out.println("123123");
		return bs.deleteReviews(merchanCode, rnum);
	}
}
