<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/taglib.jsp" %>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/admin/header.jsp"/>

	<div class="container">
		 <div class="sidebar">
			<jsp:include page="/WEB-INF/views/layout/admin/left.jsp"/>
		 </div>
		 <jsp:include page="${body}.jsp"/>
	</div>

	<jsp:include page="/WEB-INF/views/layout/admin/footer.jsp"/>
</body>
</html>
