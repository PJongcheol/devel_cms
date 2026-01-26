<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대시보드</title>
</head>
<body>
	<main class="main">
        <div class="cards">
            <div class="card blue"><h3>총 회원</h3><p>1,234</p></div>
            <div class="card green"><h3>오늘 방문</h3><p>567</p></div>
            <div class="card orange"><h3>게시글</h3><p>89</p></div>
            <div class="card purple"><h3>댓글</h3><p>456</p></div>
        </div>

        <div class="section">
            <h3>회원 목록</h3>
            <input type="text" id="datepicker" placeholder="가입일 선택">
            <table>
                <thead>
                    <tr><th><input type="checkbox"></th><th>회원 ID</th><th>이름</th><th>가입일</th><th>상태</th></tr>
                </thead>
                <tbody>
                    <tr><td><input type="checkbox"></td><td>HelloWorld</td><td>홍길동</td><td>2026-01-01</td><td>활성</td></tr>
                    <tr><td><input type="checkbox"></td><td>user02</td><td>김철수</td><td>2026-01-05</td><td>활성</td></tr>
                    <tr><td><input type="checkbox"></td><td>user03</td><td>이영희</td><td>2026-01-10</td><td>휴면</td></tr>
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>