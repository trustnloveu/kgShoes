<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<div class="site-section block-3 site-blocks-2 bg-light">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-7 site-section-heading text-center pt-4">
				<h2>Best Selling</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="owl-carousel owl-theme" id="Featured">
					<c:forEach begin="1" end="3" var="vo" items="${recommendedHomeList }">
					<div class="item">
						<div class="block-4 text-center" style="width: 480px; height: 530px;">
							<figure class="block-4-image">
							<a href="${cpath }/shopSingle/${vo.merchanCode }/">
								<img src="${cpath }/img/${vo.imgSrc }" alt="Image placeholder"
									class="img-fluid">
							</a>
							</figure>
							<div class="block-4-text p-4">
								<h3>
									<a href="${cpath }/shopSingle/${vo.merchanCode }/">${vo.merchanName }</a>
								</h3>
								<p class="mb-0">${vo.brand }</p>
								<c:if test="${vo.discRate == 0 }">
									<p class="text-primary font-weight-bold"><fmt:formatNumber value="${vo.price }" pattern="#,###" />원</p>
								</c:if>
								<c:if test="${vo.discRate != 0 }">
									<c:set var="price" value="${vo.price - (vo.price * vo.discRate / 100) }"></c:set>
									<p class="text-primary font-weight-bold">
										<span class="saleDeco"><fmt:formatNumber value="${vo.price }" pattern="#,###" />원</span><br>
										<span class="salePrice"><fmt:formatNumber value="${price }" pattern="#,###" />원</span>
									</p>
											
								</c:if>							
							</div>
						</div>						
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>


