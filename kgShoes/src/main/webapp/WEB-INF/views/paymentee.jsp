<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- CSS link -->
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- 	2020.08.18 -->
<!-- 	카카오 주소 추가 -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
	
<body>

<!-- 	2020.08.06 -->
<!-- 	함수 스크립트 추가 -->
<script src="../js/paymentFunction.js"></script>
	
	
	<div class="site-wrap">
		<header class="site-navbar" role="banner">
			<!-- 타이틀 로고 -->
			<%@ include file="/WEB-INF/views/include/logo.jsp"%>

			<!-- 메뉴 -->
			<%@ include file="/WEB-INF/views/include/navbar.jsp"%>

			<!-- 카테고리 -->
			<div class="bg-light py-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 mb-0">
							<a href="${cpath }">Home</a>
								<span class="mx-2 mb-0">/</span>
							<strong class="text-black">Payment</strong>
						</div>
					</div>
				</div>
			</div>
		</header>
		
	<form id="paymentForm" action="${cpath }/paycomplete/" method="POST">
<!-- 		<form> -->
	<div class="site-section">
			<div class="container">
			
<!-- 			2020.08.06 -->
<!-- 			미로그인시 표시 -->
			<c:if test="${empty login }">
				<div class="row mb-5">
					<div class="col-md-12">
					
						<!-- 비회원 결제시 노출 / login.session 검사 필요 -->
						<div class="border p-4 rounded" role="alert">
							로그인을 하시면 더 많은 혜택을 받으실 수 있습니다.&nbsp;
							<a href="${cpath }/loginForm/"><strong>로그인 하기</strong></a>
						</div>
						
					</div>
				</div>
				</c:if>
				
				<!-- 결제 form -->
				<div class="row">
					<div class="col-md-7 mb-5">
						<h2 class="h3 mb-3 text-black">결제 내역</h2>
						<div class="p-lg-4 border">
							<div class="form-group">
								<div class="mb-2">
									<span class="text-black">결제 방법</span>
									<span class="text-danger">*</span>
								</div>	
							<!-- 결제창(무통장, 계좌이체, 핸드폰결제 선택) -->
							
<!-- 								2020.08.13 -->
<!-- 								input값 추가 -->
									<input type="hidden" name="orderPayoption" id="checkPay" value="">
									
									<c:choose>
										<c:when test="${empty login }">
											<input type="hidden" name="checkmember" value="nonmember">
										</c:when>
										<c:when test="${not empty login }">
											<input type="hidden" name="checkmember" value="member">
											<input type="hidden" name="customeremail" value="${login.email }">
										</c:when>
									</c:choose>
									
									<div class="payment-method col-md-12 pt-2 p-lg-0 text-black">
									<!-- 계좌이체 -->
									<div class="border p-3 mb-3">
										<h3 class="h6 mb-0">
<!-- 								2020.08.06 -->
<!-- 								bankPay, creditPay, mobilePay id 추가 -->
											<a class="d-block" id="button-bankPay" data-toggle="collapse" href="#bank-pay" role="button" aria-expanded="false"
											   aria-controls="bank-pay">계좌이체(무통장입금)
<!-- 											   <span class="chk-info">(무통장입금)</span> -->
											 </a>
										</h3>
										<!-- 계좌이체 스크롤 다운 -->
										<div class="collapse mt-4" id="bankPay">
											<div class="py-2">
												<div class="mb-0">
													<!-- 스크롤 내부 내용 -->
													<div class="form-group row">
														<div class="col-md-12">
											 				<span class="chk-info border-bottom">입력하신 정보로 입금계좌와 상세 내역을 전송해드립니다.</span>
														</div>
													</div>
													
													<div class="form-group row">
														<div class="col-md-6">
															<label for="c_fname" class="text-black">예금주 
																<span class="text-danger">*</span>
															</label>
															<input type="text" class="form-control" 
																   id="c_fname" name="c_fname"
																   placeholder="예금주 성함">
														</div>
													</div>

													<div class="form-group row">
														<div class="col-md-12">
															<label for="c_email" class="text-black">이메일
<!-- 															2020.08.18 필수입력 으로 수정 -->
																<span class="text-danger">*</span>
															</label>
															<input type="text" class="form-control" id="c_email" name="c_email" 
																   placeholder="이메일 입력" required>
														</div>
													</div> 
												</div>
											</div>
										</div>
									</div>
									
									<!-- 카드 결제 -->
									<div class="border p-3 mb-3">
										<h3 class="h6 mb-0">
											<a class="d-block" id="button-creditPay" data-toggle="collapse" href="#credit-pay" role="button" 
											   aria-expanded="false" aria-controls="credit-pay">
												신용카드
											</a>
										</h3> 
										<!-- 카드 스크롤 다운 -->
										<div class="collapse mt-4" id="creditPay">
											<div class="py-2">
												<div class="mb-0">
												<!-- 스크롤 내부 내용 -->
													<div class="form-group row">
														<div class="col-md-12">
											 				<span class="chk-info border-bottom">카드 선택 추가(Master, BC, Visa ...)</span>
														</div>
													</div>
													<div class="form-group row">
														<div class="col-md-12">
															<label for="c_card" class="text-black">카드번호
																<span class="text-danger">*</span>
															</label> 
<!-- 															2020.08.18 -->
<!-- 															카드번호 자동 대쉬 onkeyup 추가 / paymentEvent.js onkeyup 이벤트리스너 코드 삭제 -->
<!-- 																숫자를 받는 input에 (전화번호, 카드정보 등) onkeyup 추가 -->
															<input type="text" class="form-control" id="c_card" name="c_card" 
																   placeholder="ex) 1234-1234-1234-1234" maxlength="19" onKeyup="this.value=this.value.replace(/[^0-9]/g,''); autoHypen(this);">
														</div>
													</div>
													<div class="form-group row">
													
														<div class="col-md-6">
															<label for="c_cvv" class="text-black">CVV 번호
																<span class="text-danger">*</span>
															</label>
															<input type="text" class="form-control" 
																   id="c_cvv" name="c_cvv"
																   placeholder="ex) 123" maxlength="3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
														</div>
														<div class="col-md-6">
															<label for="c_ex_date" class="text-black">카드 만료일
																<span class="text-danger">*</span>
															</label> 
															<input type="text" class="form-control" 
																   id="c_ex_date" name="c_ex_date" 
																   placeholder="MM/YY" maxlength="5" onKeyup="this.value=this.value.replace(/[^0-9]/g,''); autoSlash(this);">
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<!-- 핸드폰 결제 -->
									<div class="border p-3 mb-3">
										<h3 class="h6 mb-0">
											<a class="d-block" id="button-mobilePay" data-toggle="collapse" href="#mobile-pay" role="button" 
											   aria-expanded="false" aria-controls="mobile-pay">
												핸드폰 결제
											</a>
										</h3>
										<!-- 스크롤 다운 -->
										<div class="collapse mt-4" id="mobilePay">
											<div class="py-2">
												<div class="mb-0">
												<!-- 스크롤 내부 내용 -->
													<div class="form-group row">
														<div class="col-md-12">
											 				<span class="chk-info border-bottom">'결제하기'를 통해 문자인증과 함께 결제가 진행됩니다.</span>
														</div>
													</div>
													<div class="form-group row">
														<div class="col-md-3">
															<label for="c_tel_com" class="text-black">통신사
																<span class="text-danger">*</span>
															</label> 
															<select class="form-control" id="c_tel_com" name="tong_sin_sa">
																<option value="KT">KT</option>
																<option value="SKT">SKT</option>
																<option value="LG U+">LG U+</option>
															</select>
														</div>
														<div class="col-md-9">
															<label for="c_pNum" class="text-black">휴대전화 번호
																<span class="text-danger">*</span>
															</label> 
															<input type="text" class="form-control" id="c_pNum" name="c_mobile" 
																   placeholder="ex) 01012345678" maxlength="11" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
														</div>
													</div>
<!-- 													2020.08.07 김정미 -->
<!-- 													불필요한 입력란 div 삭제 -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							

							<div class="form-group">
<!-- 							2020.08.06 -->
<!-- 							미로그인 시 배송지 체크 미표시 & 배송지 입력 폼 표시 -->
								<c:choose>
									<c:when test="${not empty login }">
									<label for="c_ship_different_address" class="text-black"
										data-toggle="collapse" href="#ship_different_address"
										role="button" aria-expanded="false"
										aria-controls="ship_different_address">
<!-- 										2020.08.18 checkbox name 추가 -->
										<input type="checkbox" value="1" id="c_ship_different_address" name="diffrentAddress">
										&nbsp;배송지 정보를 직접 입력하시겠습니까?
										<span class="chk-info">(체크하지 않을 시 회원 정보에 기록된 주소로 배송됩니다.)</span>
									</label>
									</c:when>
									<c:when test="${empty login }"><label for="order_notes" class="text-black">배송지 정보</label></c:when>
								</c:choose>
								<!-- 스크롤 내부 폼(default로 회원 정보에 기재된 주소로 설정됨) -->
								<c:choose>
									<c:when test="${empty login }">
										<div class="collapse border p-3 show" id="ship_different_address">
									</c:when>
									<c:when test="${not empty login }"><div class="collapse border p-3" id="ship_different_address"></c:when>
								</c:choose>
									<div class="py-2">

										<!-- 보내는 사람 / 전화번호 -->
										<div class="form-group row">
											<div class="col-md-6">
												<label for="recieve-name" class="text-black">받으시는 분
													<span class="text-danger">*</span>
												</label>
												<input type="text" class="form-control" id="recieve-name" name="orderRecieveName" required>
											</div> 
											<div class="col-md-6">
												<label for="recieve-pNum" class="text-black">받으시는 분 연락처
													<span class="text-danger">*</span>
												</label>
												<input type="text" class="form-control" id="recieve-pNum" name="orderRecievePnum" maxlength="11" required onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
											</div>
										</div>
										
										<!-- 알림받을 이메일 -->
										<div class="form-group row">
											<div class="col-md-12">
												<label for="recieve-addr" class="text-black">이메일 
													<span class="chk-info">(배송 알림 받으실 경우 입력)</span>
												</label>
												<input type="text" class="form-control" id="recieve-email" name="orderRecieveEmail">
											</div>
										</div>
										
										<!-- 배송 주소 -->
										<div class="form-group row">
											<div class="col-md-12">
												<label for="address" class="text-black">배송지 주소
													<span class="text-danger">*</span>
												</label>
				<!-- 2020.08.18 br 추가 -->		<br>
<!-- 												2020.08.18 input required 추가 -->
												<input type="text" class="col-md-6 form-control" style="display: inline-block;" id="postcode" name="postcode" placeholder="우편번호" required>
<!-- 				2020.08.19 postcode() => payPostcode() 로 수정 -->
               									<input type="button" class="col-md-2 ml-3 btn btn-primary btn-lg" value="검색" style="display: inline-block;" onclick="payPostcode()">
               									<input type="text" class="col-md-12 mt-3 form-control" id="address" name="address" placeholder="주소" required>
               									<input type="text" class="col-md-12 mt-3 form-control" id="detailAddress" name="detailAddress" placeholder="상세주소" required>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="order_notes" class="text-black">주문시 요청 사항</label>
<!-- 								2020.08.18 -->
<!-- 								textarea name 변경 -->
								<textarea name="orderNotes" id="order_notes" cols="30"
										  rows="5" class="form-control"
										  placeholder="추가로 요청하실 사항이 있으시면 이곳에 적어주세요."></textarea>
							</div>

						</div>
					
					
					
					</div>
					
					<!-- payment-right-section -->
					<div class="col-md-5">
						<div class="row mb-5">
							<div class="col-md-12">
								<h2 class="h3 mb-3 text-black">결제 상세</h2>
								<div class="p-lg-4 border">
									
									<!-- 결제 상품 리스트(테이블) -->
									<table class="table site-block-order-table mb-3">
										<tr>
											<th>상품명</th>
											<th class="text-right">상품가격</th>
										</tr>
										
									<!-- 결제 상품 리스트 -->
										<!-- 1번 예시 -->
<!-- 								2020.08.13 -->
<!-- 								여러개의 상품(배열) 값 입력 받기 -->
									<c:forEach var="name" items="${name }" varStatus="status">
										<tr>
<!-- 										2020.08.07 td id 추가 -->
											<td id="reportName">${name }
												<strong class="mx-2">x</strong> ${ammount[status.index] }(수량)
											</td>
											<td class="text-right">${price[status.index] * ammount[status.index] } 원</td>
										</tr>
<!-- 									2020.08.13 -->
<!-- 									결제 상품 정보 hidden값으로 설정 -->
										<input type="hidden" name="orderMerchanName" value="${name }">
										<input type="hidden" name="orderPrice" value="${price[status.index] * ammount[status.index] }">
										<input type="hidden" name="orderQuantitiy" value="${ammount[status.index] }">
										<input type="hidden" name="merchanCode" value="${code[status.index] }">
										<input type="hidden" name="shoesize" value="${size[status.index] }">
									</c:forEach>	
										<tr>
											<td class="text-black font-weight-bold">
												<strong>결제 금액</strong>
											</td>
											<td class="text-black font-weight-bold text-right">
												<strong>${totalPrice } 원</strong>
											</td>
										</tr>
									</table>
									
									<!-- 결제 동의 -->
									<div class="form-group">
										<label for="chk-pay-agreement" class="text-black" data-toggle="collapse" href="#detail-pay-agreement"
											   role="button" aria-expanded="false" aria-controls="create_an_account">
											   <input type="checkbox" value="1" id="chk-pay-agreement" required>&nbsp;결제 내역을 확인하셨나요?
										</label>
										<div class="collapse" id="detail-pay-agreement">
											<div class="py-2">
												<p class="mb-2">
													결제 내역을 확인하였습니다.
												</p>
											</div>
										</div>
									</div>
									<!-- 결제 버튼 -->
									<div class="form-group">
										<button class="btn btn-primary btn-lg py-3 btn-block"
												onclick="completePayment()">
												결제하기
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				<!-- </form> -->
				</div>
			</div>
			</form>
		</div>

		<!-- Footer -->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	</div>

	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/jquery-ui.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>
	<script src="../js/aos.js"></script>

<!-- 	2020.08.06 -->
<!-- 	js 연결 -->
	<script src="../js/paymentEvent.js"></script>
	<script src="../js/main.js"></script>
	
</body>
</html>