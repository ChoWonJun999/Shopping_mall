<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--logo-->
<div class="head_head">
	<div class="con head_logo">
		<a href="/">
			<h1>Logo</h1>
		</a>
		<a class="memo">로고 img</a>
	</div>
</div>

<div class="head_right">
	<ul class="con head_right_user">
		<li>
			<a class="memo">DB연결 login&logout</a>
		</li>
		<li>
			<a>???님</a>
		</li>
		<li>
			<a>MyPage</a>
		</li>
		<li>
			<a href="/">LOGOUT</a>
		</li>
	</ul>
</div>

<div class="head_foot">
	<ul class="con head_foot_menu">
		<c:forEach var="list" items="${configList}" varStatus="i">
			<c:if test="${list.aMenuVisibleState eq '1'}">
				<li>
					<a href="/">${list.aMenuName}</a>
				</li>
			</c:if>
		</c:forEach>
		<!-- 
		<li>
			<a>최대 15개</a>
			<ul class="head_foot_menu_sub" style="display: none;">
				<li class="over">
					<a>메뉴 서브1</a>
				</li>
				<li class="over">
					<a>메뉴 서브2</a>
				</li>
				<li class="over">
					<a>메뉴 서브3</a>
				</li>
			</ul>
		</li>
		 -->
	</ul>
</div>