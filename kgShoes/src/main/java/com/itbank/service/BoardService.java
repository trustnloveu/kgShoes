package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.dao.BoardDAO;
import com.itbank.vo.BoardParam;
import com.itbank.vo.BoardReplyVO;
import com.itbank.vo.BoardVO;
import com.itbank.vo.ReplyParam;
import com.itbank.vo.ReviewsParam;
import com.itbank.vo.ReviewsVO;

@Service
public class BoardService {

	@Autowired private BoardDAO dao;
	private final String filePath = "D:\\reviewImg\\";		// 파일 업로드
	private final int perPage = 5;
	private String wordType;
	private String word;
	private String sort;

//	<< 2020년 08월 07일 작업 >>
	// 새 글  쓰기
	public void writeInsert(HashMap<String, String> map) {
		dao.writeInsert(map);
	}
	
//	<< 2020년 08월 07일 작업 >>	
//	<<< 2020년 08월 18일 수정>>>
	// 게시판 목록 및 필터/정렬
	public ModelAndView selectBoardListAll(int page, HttpServletRequest req) {
		System.out.println("selectBoardListAll");
		ModelAndView mav = new ModelAndView("board");
		
		// 검색 및 정렬처리
		BoardParam bp = new BoardParam();
		String wtp = req.getParameter("wordType");
		String wd = req.getParameter("word");
		String so = req.getParameter("sort");
		
		// 검색
		if(wtp != null || wd != null) {
			wordType = wtp;
			word = wd;
			if(sort != null) {
				sort = null;
			}
		}
		else { 
			wordType = wordType;
			word = word;
		}
		
		// 정렬
		if(so != null) {
			sort = so;
			if(page != 1) { page = 1; }		// 페이지가 1이 아니면 1로 세팅(클릭 시, 1페이지로 가도록)
		}
		else { sort = sort; }
		
		System.out.println("page : " + page);
		
		System.out.println("wtp : " + wtp);
		System.out.println("wd : " + wd);
		System.out.println("so : " + so);
		
		System.out.println("wordType : " + wordType);
		System.out.println("word : " + word);
		System.out.println("sort : " + sort);
		
		// 각 변수 bp에 저장
		bp.setWordType(wordType);
		bp.setWord(word);
		bp.setSort(sort);
		
		// 총 페이지 개수
		int allCount = dao.getCount(bp);
		int pageCount = allCount / perPage;
		pageCount += allCount % perPage == 0 ? 0 : 1;
		
		// 작은 페이징
		int first = (page - 1) * perPage + 1;
		int last = first + perPage - 1;
		bp.setStart(first);
		bp.setEnd(last);
		
		// 큰 페이징
		int section = (page - 1) / perPage;
		int begin = perPage * section + 1;
		int end = begin + (perPage - 1) > pageCount ? pageCount : begin + (perPage - 1);
		
		// 페이지 변환 시 후기 번호
		int no = (page - 1) * perPage;	// st.count로 후기 번호를 붙일거임 -> 페이지가 넘어가면 st.count가 1로 초기화됨 -> 따라서 page가 증가할 때 마다 증가값(no)을 st.count에 더해줌 -> 이건 그걸 위한 변수
		
		// 뷰에 전달
		mav.addObject("list", dao.selectAll(bp));			
		mav.addObject("allCount", allCount);				// 전체 레코드 개수
		mav.addObject("begin", begin);						// 페이징에 표시할 시작 페이지
		mav.addObject("end", end);							// 페이징에 표시할 마지막 페이지
		mav.addObject("page", page);						// 현재 페이지
		mav.addObject("perPage", perPage);					// 한 페이지 당 보여지는 개수
		mav.addObject("prev", section != 0);				// 이전을 표시할 조건
		mav.addObject("next", allCount > perPage * end);	// 다음을 표시할 조건
		mav.addObject("no", no);							// 게시글 번호에 표기될 번호
				
		return mav;
	}

//	<< 2020년 08월 07일 작업 >>
	// 검색 파라미터 초기화
	public ModelAndView searchInit() {
		ModelAndView mav = new ModelAndView("redirect:/board/");
		wordType = null;
		word = null;
		sort = null;
		return mav;
	}

//	<< 2020년 08월 07일 작업 >>
//	<< 2020년 08월 19일 수정>>
	// 선택한 게시물의 정보 불러오기(게시판 1개의 목록)
	public ModelAndView selectBoardOne(int noticeNum, int number, HttpServletRequest req, int page) {
		
		ModelAndView mav = new ModelAndView("boardRead");
		
		// 리뷰 수
		dao.updateBoardReviewCount(noticeNum);		// 클릭할 때마다, notice테이블의 리뷰 수 +1
		
		// 페이징(댓글)
		BoardReplyVO vo = new BoardReplyVO();		
		ReplyParam vo2 = new ReplyParam();
		vo2.setNoticeNum(noticeNum);
		
		// 총 페이지(댓글)
		int allCount = dao.getCountBoardReply(noticeNum);	// 해당 게시글의 번호를 이용해서 자식댓글의 총 개수를 구한다.
		int pageCount = allCount / perPage;													
		pageCount += allCount % perPage == 0 ? 0 : 1;
		
		// 작은 페이징(댓글)
		int first = (page - 1) * perPage + 1;
		int last = first + perPage - 1;
		vo2.setStart(first);	// 시작 글 rownum
		vo2.setEnd(last);		// 마지막 글 rownum
		
		// 큰 페이징(댓글)
		int section = (page - 1) / perPage;
		int begin = perPage * section + 1;	
		int end = begin + (perPage - 1) > pageCount ? pageCount : begin + (perPage - 1);
		
		// 뷰에 전달(댓글)
		mav.addObject("vo", dao.selectOne(noticeNum));		// 해당 게시글 객체 가져오기
		mav.addObject("number", number);					// 게시글 번호 (jsp에 보여지는 번호)
		mav.addObject("list", dao.selectBoardReply(vo2));	// 해당 게시글의 번호를 받아서 자식 댓글목록 가져오기
		mav.addObject("allCount", allCount);				// 전체 레코드 개수
		mav.addObject("noticeNum", noticeNum);				// 게시글 번호 저장 (실제 게시글 번호)
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("page", page);						// 현재 페이지
		mav.addObject("perPage", perPage);					// 한 페이지 당 보여지는 개수
		mav.addObject("prev", section != 0);
		mav.addObject("next", allCount > perPage * end);
		
		return mav;
	}

	public ModelAndView boardUpdate(int noticeNum) {
		ModelAndView mav = new ModelAndView("boardUpdate");
		mav.addObject("vo", dao.selectOne(noticeNum));
		return mav;
	}

//	<< 2020년 08월 10일 작업>>
	// 게시글 수정
	public ModelAndView boardUpdatePost(int noticeNum, HttpServletRequest req, MultipartRequest mpRequest, BoardVO vo) throws IOException {
		ModelAndView mav = new ModelAndView("redirect:/board/");
		Date date = new Date();
		String img = "";
		
		req = (HttpServletRequest) mpRequest;
		
		String title = req.getParameter("title");
		String context = req.getParameter("context");
		
		MultipartFile mpFile = mpRequest.getFile("userFile");
		String originalFileName = mpFile.getOriginalFilename();		// 이미지에 대한 originalname을 받아서
		int lastIndex = originalFileName.lastIndexOf(".");

		if(lastIndex != -1) {	// lastIndex가 -1이면, 비교하는 길이가 음수이면
			String extName = originalFileName.substring(originalFileName.lastIndexOf("."));	// 확장자만 뽑아서 저장			
			String imgSrc = UUID.randomUUID().toString().replace("-", "") + extName;		// 이미지 경로 저장
			img = imgSrc;
		}
		
		boolean flag = img.equals("");		// img가 빈 문자열이면 true

		vo.setNoticeNum(noticeNum);
		vo.setTitle(title);
		vo.setContext(context);
		vo.setRegistDate(date);
		if(flag == false) {		// img가 빈 문자열이 아니면 (파일을 받았다면)
			File file = new File(filePath + img);
			mpFile.transferTo(file);
			vo.setImg(img);
		}
		
		dao.writeUpdate(vo);
		
		return mav;
	}
	
//	<< 2020년 08월 10일 작업>>
	// 게시판 삭제
	public ModelAndView deleteBoard(int noticeNum) {
		ModelAndView mav = new ModelAndView("redirect:/board/");
		dao.deleteBoard(noticeNum);
		return mav;
	}
	
//	<< 2020년 08월 11일 작업>>
//	<< 2020년 08월 18일 수정>>
	// 상품후기 작성
	public ModelAndView reviewInsert(String merchanCode, HttpServletRequest req, MultipartRequest mpRequest, ReviewsVO vo) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView("redirect:/shopSingle/" + vo.getMerchanCode() + "/");
		
		ReviewsParam vo2 = new ReviewsParam();
		vo2.setMerchanCode(merchanCode);
		String img = "";
		
		req = (HttpServletRequest) mpRequest;
		
		String writer = req.getParameter("writer");
		String context = req.getParameter("context");
		System.out.println("customerCode : " + req.getParameter("customerCode"));
		int customerCode = Integer.parseInt(req.getParameter("customerCode"));
		
		MultipartFile mpFile = mpRequest.getFile("itemPhoto");
		String originalFileName = mpFile.getOriginalFilename();		// 이미지에 대한 originalname을 받아서
		int lastIndex = originalFileName.lastIndexOf(".");
		
		int num = dao.getCount2(vo2);	// merchanCode를 받아서 해당 후기의 갯수를 받아온다(이미지 경로에 해당 후기의 번호를 붙여주기 위해서)
		if(num != 0) {					// 해당 후기가 있으면, 현재 count에 +1 해준다
			num += 1;
		}
		else {							// 없으면, 0으로 초기화
			num = 0;
		}
		
		if(lastIndex != -1) {	// lastIndex가 -1이 아니라면, 비교하는 길이가 음수가 아니면
			String extName = originalFileName.substring(originalFileName.lastIndexOf("."));	// 확장자만 뽑아서 저장
			img = merchanCode + "_" + "review" + "_" + num + extName;	// 상품코드_review_num.extName(저장되는 파일명)
		}
		
		System.out.println("img : " + img);
		System.out.println("cutomerCode : " + customerCode);
		
		vo.setMerchanCode(merchanCode);
		vo.setWriter(writer);
		vo.setContext(context);
		vo.setCustomerCode(customerCode);

		boolean flag = img.equals("");	// img가 빈 문자열이면 true
		
		if(flag == false) {		// img가 빈 문자열이 아니면 (파일을 받았다면)
			File file = new File(filePath, img);
			mpFile.transferTo(file);			
			vo.setImg(img);
		}

		dao.reviewInsert(vo);
		
		mav.addObject("page", 1);	// 최초로 페이지를 불러왔을 때, 페이지를 1로 설정해서 보내준다(후기 번호를 매길때 활용)
		
		return mav;
	}



//	<< 2020년 8월 13일 작업 >>
	// 후기 수정
	public ModelAndView reviewUpdate(String merchanCode, int rnum, HttpServletRequest req, MultipartRequest mpRequest) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView("redirect:/shopSingle/" + merchanCode + "/");
		ReviewsVO vo = new ReviewsVO();
		String img = "";
		Date date = new Date();		// 작성된 날짜를 받아온다
		
		req = (HttpServletRequest) mpRequest;
		
		String writer = req.getParameter("writer");
		String context = req.getParameter("context");
		
		MultipartFile mpFile = mpRequest.getFile("userfile");
		String originalFileName = mpFile.getOriginalFilename();		// 이미지에 대한 originalname을 받아서
		int lastIndex = originalFileName.lastIndexOf(".");

		if(lastIndex != -1) {	// lastIndex가 -1이면, 비교하는 길이가 음수이면
			String extName = originalFileName.substring(originalFileName.lastIndexOf("."));	// 확장자만 뽑아서 저장			
			String imgSrc = UUID.randomUUID().toString().replace("-", "") + extName;		// 이미지 경로 저장
			img = imgSrc;
		}
		
		System.out.println("img : " + img);
		boolean flag = img.equals("");		// img가 빈 문자열이면 true

		vo.setWriter(writer);
		vo.setContext(context);
		vo.setRnum(rnum);
		vo.setRegistDate(date);
		
		if(flag == false) {		// img가 빈 문자열이 아니면 (파일을 받았다면)
			File file = new File(filePath + img);
			mpFile.transferTo(file);
			vo.setImg(img);
		}
		vo.setImg(img);
		dao.updateReviews(vo);

		return mav;
	}

//	<< 2020년 8월 13일 작업 >>
	// 후기 삭제
	public ModelAndView deleteReviews(String merchanCode, int rnum) {
		ModelAndView mav = new ModelAndView("redirect:/shopSingle/" + merchanCode + "/");
		
		dao.deleteReviewsReply(rnum);	// 후기 테이블의 rnum을 받아서 해당 후기의 자식 댓글들을 모두 삭제
		dao.deleteReviews(rnum);		// 그 다음 해당 후기를 삭제
		
		return mav;
	}

//	<< 2020년 8월 13일 작업 >>
	// 후기 읽기 및 수정/삭제 페이지 이동
	public ModelAndView reviewRead(int page, int rnum, String merchanCode, int number) {
		
		ModelAndView mav = new ModelAndView("reviewRead");				
		
		ReviewsVO vo = new ReviewsVO();
		System.out.println("rnum : " + rnum);
		
		// 페이징(댓글)
		ReplyParam vo2 = new ReplyParam();
		vo2.setRnum(rnum);
		
		// 총 페이지(댓글)
		int allCount = dao.getCountReply(rnum);	// 해당 후기의 번호를 이용해서 자식댓글의 총 개수를 구한다.
		int pageCount = allCount / perPage;													
		pageCount += allCount % perPage == 0 ? 0 : 1;
		
		System.out.println("allCount : " + allCount);
		
		// 작은 페이징(댓글)
		int first = (page - 1) * perPage + 1;
		int last = first + perPage - 1;
		vo2.setStart(first);	// 시작 글 rownum
		vo2.setEnd(last);		// 마지막 글 rownum
		
		// 큰 페이징(댓글)
		int section = (page - 1) / perPage;
		int begin = perPage * section + 1;	
		int end = begin + (perPage - 1) > pageCount ? pageCount : begin + (perPage - 1);
		
		// 해당 후기 객체 가져오기
		mav.addObject("vo", dao.selectReviewOne(rnum));
		
		// 뷰에 전달(댓글)
		mav.addObject("list", dao.selectReply(vo2));		// 해당 후기의 번호를 받아서 해당 댓글목록을 가져오기
		mav.addObject("allCount", allCount);				// 전체 레코드 개수
		mav.addObject("merchanCode", merchanCode);			// 상품 코드 저장 
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("page", page);						// 현재 페이지
		mav.addObject("perPage", perPage);					// 한 페이지 당 보여지는 개수
		mav.addObject("prev", section != 0);
		mav.addObject("next", allCount > perPage * end);
		mav.addObject("number", number);
		
		return mav;
	}

//	<< 2020년 8월 15일 작업 >>
//	<< 2020년 8월 19일 수정 >>
//	<< 2020년 8월 20일 수정 >>
	// 댓글 입력(게시판 페이지)
	public ModelAndView insertBoardReply(int noticeNum, int number, HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView("redirect:/board/read/" + noticeNum + "/" + number + "/");
		BoardReplyVO vo = new BoardReplyVO();
		
		String writer = req.getParameter("writer");
		String context = req.getParameter("context");
		int customerCode = Integer.parseInt(req.getParameter("customerCode"));
		
		System.out.println("customerCode : " + customerCode);
		
		int reparent = 0;	// 최상위 댓글이므로 reparent는 0으로 준다
		int reorder = 0;	// 처음 후기에 댓글을 달았다면, 순서와
		int redepth = 0;	// 깊이는 0으로 초기화 한다.
		List<BoardReplyVO> vo2 = dao.selectAllBoardReply();		// 댓글 목록 전체를 가져와서
		
		if(vo2.size() != 0) {	// 댓글 목록이 있다면 reoreder의 최대값 + 1을 해주고 reorder에 저장
			reorder = dao.getBoardReplyMax() + 1;
		}
		
		// vo객체 세팅
		vo.setWriter(writer);
		vo.setContext(context);
		vo.setReparent(reparent);
		vo.setReorder(reorder);
		vo.setRedepth(redepth);
		vo.setNoticeNum(noticeNum);
		vo.setCustomerCode(customerCode);
		
		dao.insertBoardReply(vo);					// 댓글 insert
		dao.updateBoardRePlyCount(noticeNum);		// 댓글 입력 시, notice테이블의 댓글 수 +1

		return mav;
	}

//	<< 2020년 8월 19일 수정>>
	// 답글 입력(게시판 페이지)
	public ModelAndView boardReplyRecomment(int noticeNum, int number, HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView("redirect:/board/read/" + noticeNum + "/" + number + "/");
		BoardReplyVO vo = new BoardReplyVO();
		
		String writer = req.getParameter("writer");
		String context = req.getParameter("context");
		int renum = Integer.parseInt(req.getParameter("renum"));
		
		vo = dao.selectBoardReplyRenum(renum);	// 부모 댓글의 정보를 가져온다
		int redepth = vo.getRedepth() + 1;		// 부모 댓글의 깊이 + 1 해준다
		int reorder = vo.getReorder() + 1;		// 부모 댓글의 순서 + 1 해준다
		int reorder2 = vo.getReorder();			// 부모 댓글의 순서를 저장
		
		// vo세팅
		vo.setWriter(writer);
		vo.setContext(context);
		vo.setNoticeNum(noticeNum);
		vo.setReparent(renum);
		vo.setRedepth(redepth);
		vo.setReorder(reorder);
		
		dao.updateBoardReply(reorder2);			// 부모 댓글의 순서보다 큰 댓글들의 순서를 모두 + 1 해준다.
		dao.insertBoardReply(vo);				// 그 다음 insert
		dao.updateBoardRePlyCount(noticeNum);	// 댓글 입력 후, notice의 댓글 수를 +1한다
		
		return mav;
	}

//	<< 2020년 8월 15일 작업 >>
//	<< 2020년 8월 19일 수정>>
	// 댓글 삭제(게시판 페이지)
	public ModelAndView deleteBoardReply(int noticeNum, int renum, int number) {
		ModelAndView mav = new ModelAndView("redirect:/board/read/" + noticeNum + "/" + number + "/");
		
		BoardReplyVO vo = new BoardReplyVO();
		
		vo = dao.selectBoardReplyRenum(renum);		// 번호를 통해 해당 댓글의 정보를 불러온다
		int reorder = vo.getReorder();				// 해당 댓글의 순서를 저장한다
		
		dao.downBoardReplyReorder(reorder);			// 해당 순서보다 더 큰 순서들을 모두  -1 해준다
		
		List<BoardReplyVO> vo2 = dao.selectBoardReplyChild(renum);		// 삭제하고자 하는 댓글의 번호로 자식 댓글이 있는지 확인한다		
		if(vo2.size() == 0) {						// 만약, 자식 댓글이 존재하지 않으면 
			dao.deleteBoardReply(renum);				// 해당 댓글을 지워라
			dao.updateBoardReplyCountDown(noticeNum);	// 댓글이 지워진 후, notice 테이블의 댓글 수 -1 감소
		}
		// 자식 댓글이 존재하면,
		else {
			// alert 페이지 처리
			mav.setViewName("alert");
			return mav;
		}
		
		return mav;
	}

//	<< 2020.08.20 수정 >>
	// 댓글 수정
	public ModelAndView boardReplyUpdate(int noticNum, int number, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("redirect:/board/read/" + noticNum + "/" + number + "/");
		
		BoardReplyVO vo = new BoardReplyVO();
		Date date = new Date();
		
		String writer = req.getParameter("writer");
		String context = req.getParameter("context");
		int renum  = Integer.parseInt(req.getParameter("renum"));
		
		vo.setWriter(writer);
		vo.setContext(context);
		vo.setRegistDate(date);
		vo.setRenum(renum);
		
		dao.updateBoardReply2(vo);
		
		return mav;
	}
}
