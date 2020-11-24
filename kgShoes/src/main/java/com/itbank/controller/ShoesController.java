package com.itbank.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.MerchandiseService;

@Controller
public class ShoesController {
	
//@Autowired private MerchandiseService ms;
	@Autowired private MerchandiseService ms;
	private final String filePath = "D:/upload/";
	
	@RequestMapping(value="shop/", method=RequestMethod.GET)
	public ModelAndView mermerchandiseListGet(HttpServletRequest req) {
		ms.filterReset(1);
		return merchandiseListPost(req);	// 페이지를 처음 호출했을때도(get으로 들어왔을때) post로 보냄
	}
	
	@RequestMapping(value="shop/", method=RequestMethod.POST)
	public ModelAndView merchandiseListPost(HttpServletRequest req) {
		return merchandise(1, req);		// 처음 호출했을때는 페이지를 1로 준다 
	}
	
	@RequestMapping("shop/{page}/")
	public ModelAndView merchandise(@PathVariable("page") int page, HttpServletRequest req) {
		return ms.listAll(page, req);	// 페이지 받아서 상품 전체 목록 받아오기
	}
	
	
	@RequestMapping(value="shop/{page}/", method=RequestMethod.POST )
	public ModelAndView merchandisePost(@PathVariable("page") int page, HttpServletRequest req) {
		return ms.listAll(page, req);	// 페이지 받아서 상품 전체 목록 받아오기
	}
	
	@RequestMapping("shop/filterReset/")
	public ModelAndView filterReset() {		// 필터 리셋 후 전체 목록 다시 받아오기
		return ms.filterReset(1);			// 페이지를 1로 보내준다
	}
	
	@RequestMapping(value="shop/upload/", method=RequestMethod.POST)
	public ModelAndView insertMerchandise(MultipartRequest mpRequest) throws IllegalStateException, IOException {
		// 상품 등록 후 상품페이지로 리다이렉트
		ModelAndView mav = new ModelAndView("redirect:/");
		
		// 입력된 상품 정보들을 받아온다(다중구현)
		HttpServletRequest request = (HttpServletRequest) mpRequest;
		String[] merchandiseName = request.getParameterValues("merchandiseName");
		String[] price = request.getParameterValues("price");
		String[] brand = request.getParameterValues("brand");
		String[] category = request.getParameterValues("category");
		String[] quantity = request.getParameterValues("quantity");
		List<MultipartFile> mpFile = mpRequest.getFiles("userFile");
		
		// 상품 여러개를 받아서(다중구현) 상품 정보를 하나씩 등록한다. 
		for(int i = 0; i < merchandiseName.length; i++) {

			MultipartFile mpFile2 = mpFile.get(i);	// 다중으로 받은 상품 이미지를 한개씩 분리하기 위한 MultipartFile 선언
			
			BufferedImage image = ImageIO.read(mpFile2.getInputStream());
			Integer width = image.getWidth();
			Integer height = image.getHeight();
			
			System.out.println("width : " + width);
			System.out.println("height : " + height);
			
			String originalFileName = mpFile2.getOriginalFilename();						// 이미지에 대한 originalname을 받아서
			String extName = originalFileName.substring(originalFileName.lastIndexOf("."));	// 확장자만 뽑아서 저장
			String imgSrc = UUID.randomUUID().toString().replace("-", "") + extName;		// 이미지 경로 저장
			
			File file = new File(filePath, imgSrc);
			mpFile2.transferTo(file);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("merchanName", merchandiseName[i]);
			map.put("price", price[i]);
			map.put("brand", brand[i]);
			map.put("category", category[i]);
			map.put("quantity", quantity[i]);
			map.put("imgSrc", imgSrc);
			
			ms.uploadMerchandise(map);	// 상품 정보를 등록(insert)
		}
		
		return mav;
	}
	
	
	
	
	// 8.4Bong 카테고리 옆에 상품 개수 표시
//	@RequestMapping(value = "getQuantityByCategory/", produces = "application/json;charset=utf8")
//	public String getQuantityByCategory() {
//		String jsonData = null;
//		List<String>categoryQuantity = ms.getQuantityByCategory();
//		
//		try {
//			jsonData = new ObjectMapper().writeValueAsString(categoryQuantity);
//		} catch (JsonGenerationException e) {
//			e.printStackTrace();
//		} catch (JsonMappingException e) {
//			System.out.println("json mapping error !!");
//		} catch (IOException e) {
//			System.out.println("IOExceiption!!");
//		}
//		System.out.println("getQuantityByCategory : " + jsonData);
//		return jsonData;
//	}
	
	
}
