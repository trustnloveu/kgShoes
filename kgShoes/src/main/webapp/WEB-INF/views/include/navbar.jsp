<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="site-navigation text-right text-md-center" role="navigation">
	<div class="container">
		<ul class="site-menu js-clone-nav d-none d-flex pl-5 pr-5" style="text-align: center;">
			<li><a href="${cpath }">Home</a></li>
			<li><a href="${cpath }/about/">About</a></li>
			<li class="has-children"><a href="${cpath }/shop/">Shop</a>
				<ul class="dropdown">
									
					<li style="margin-left: 10px;">
						<form method="GET" action="${cpath }/shop/1/">
							<input type="hidden" name="category" value="Leather">
							<input class="ghost-btn d-flex" style="" type="submit" value="Leather">
						</form>
					</li>
					
					<li style="margin-left: 10px;">
						<form method="GET" action="${cpath }/shop/1/">
							<input type="hidden" name="category" value="Running">
							<input class="ghost-btn d-flex" style="" type="submit" value="Running">
						</form>
					</li>
					
					<li style="margin-left: 10px;">
						<form method="GET" action="${cpath }/shop/1/">
							<input type="hidden" name="category" value="Life Style">
							<input class="ghost-btn d-flex" style="" type="submit" value="Life Style">
						</form>
					</li>
					
					<li style="margin-left: 10px;">
						<form method="GET" action="${cpath }/shop/1/">
							<input type="hidden" name="category" value="ETC">
							<input class="ghost-btn d-flex" style="" type="submit" value="ETC">
						</form>
					</li>
									
				</ul></li>
			
			<li><a href="${cpath }/board/">Board</a></li>
			<li><a href="${cpath }/contact/">Contact</a></li>
		</ul>
	</div>
</nav>