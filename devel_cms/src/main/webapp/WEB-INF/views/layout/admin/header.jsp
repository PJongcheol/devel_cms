<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp" %>

<header>
    <div class="logo">
        <i class="fa-solid fa-cogs"></i> CMS Dashboard
    </div>

    <c:if test="${not empty sessionScope.LoginVO}">
        <div class="user">
            <i class="fa-solid fa-user"></i>
            <span class="user-name">
                ${sessionScope.LoginVO.memberNm}
            </span>

            <a href="/login/logout.do" class="btn-logout">로그아웃</a>
        </div>
    </c:if>
</header>
