<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 이용안내 -->
<div class="site-section site-section-sm site-blocks-mid ">
	<div class="container">
		<div class="row">
			<div class="col-md-3 ml-5"
				data-aos="fade-up" data-aos-delay="">

				<!-- 상품 배송 정책 버튼-->
				<div class="text">
					<h3 class="text-center text-black" style="margin-bottom: 20px">배송상품 처리방침</h3>
					<button class="ghost-btn" id="policy1" style="border: 0px; cursor: pointer;">
						<img alt="delivery" src="${cpath }/images/delivery.png"
							class="img-fluid">
					</button>					
				</div>
			</div>

			<!-- 상품 배송 정책 내용-->
			<div class="modal" id="myModal1">
				<div class="modal-dialog  text-black">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title">배송상품 처리방침</h1>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<p>1) 일요일 및 공휴일은 상품배송이 불가능</p>
							<p>2) 10,000원 이상 상품 구매시 배송비 무료</p>
							<p>3) 배송 과정에서 발생하는 하자에 관하여 전액 보상</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		
		
		<div class="col-md-1"></div>
			<div class="col-md-3"
				data-aos="fade-up" data-aos-delay="100">

				<!-- 교환/반품 정책 버튼-->
				<div class="text">
					<h3 class="text-center text-black" style="margin-bottom: 20px">
						교환/반품 처리방침
						</h3>
					<button class="ghost-btn" id="policy2" style="border: 0px; cursor: pointer;">
						<img alt="delivery" src="${cpath }/images/retrun.png"
							class="img-fluid">
					</button>			
				</div>
			</div>

			<!-- 교환/반품 정책 내용-->
			<div class="modal" id="myModal2">
				<div class="modal-dialog text-black">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title">교환/반품 처리방침</h1>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<p>1) 배송완료 후 15일 이내 무료 교환/반품 가능</p>
							<p>2) 배송 이외의 원인으로 하자가 발생시 교환/반품 불가능
							<p>
							<p>3) 하자가 아닌 고객변심 교환/반품의 경우 교환/반품비 발생</p>
							<p>4) 부분적인 하자의 경우 부분적으로 교체 또는 A/S가 가능</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>

		<div class="col-md-1"></div>
			<div class="col-md-3"
				data-aos="fade-up" data-aos-delay="200">
				<div class="text">
					<h3 class="text-center text-black" style="margin-bottom: 20px">개인정보 처리방침</h3>
					<button class="ghost-btn" id="policy3" style="border: 0px; cursor: pointer;">
						<img alt="delivery" src="${cpath }/images/secure.png"
							class="img-fluid">
					</button>
					
				</div>
			</div>

			<div class="modal" id="myModal3">
				<div class="modal-dialog text-black">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title">개인정보 처리방침</h1>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<div class="modal-body">
							<p>1) 개인정보는 악의적인 목적으로 사용되지 않습니다</p>
							<p>2) 개인정보 수집 목적은 상품 이용 및 구매를 위함입니다</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>