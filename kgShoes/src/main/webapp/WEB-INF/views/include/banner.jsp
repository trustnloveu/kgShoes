<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!-- 배너(슬라이드) -->
<div class="site-blocks-cover bg-light" data-aos="fade">
   <div class="container mt-0 mb-0">
      <div id="demo" class="carousel slide" data-ride="carousel" data-interval="3000">
         <div class="carousel-inner p-0 w-100">

            <!-- 슬라이드 쇼 -->
            <!-- ??? -->
            <div class="carousel-item active center-block">
               <img class="d-block w-100" src="${cpath }/images/banner4.png" alt="First Slide">
            </div>
            <div class="carousel-item center-block">
               <img class="d-block w-100" src="${cpath }/images/banner2.jpg" alt="Second Slide">
            </div>
            <div class="carousel-item center-block">
               <img class="d-block w-100" src="${cpath }/images/banner3.jpg" alt="Third Slide">
            </div>

            <!-- 왼쪽 이미지로 슬라이더 이동 -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
               <span class="carousel-control-prev-icon" aria-hidden="true"></span>
               <span>Previous</span> <!-- 으른쪽 이미지로 슬라이더 이동  -->
            </a> 
            <a class="carousel-control-next" href="#demo" data-slide="next">
               <span>Next</span>
               <span class="carousel-control-next-icon"></span>
            </a>

            <!-- 인디케이터 -->
            <ul class="carousel-indicators">
               <li data-target="#demo" data-slide-to="0" class="active"></li>
               <li data-target="#demo" data-slide-to="1"></li>
               <li data-target="#demo" data-slide-to="2"></li>
            </ul>
         </div>
      </div>

   </div>
</div>