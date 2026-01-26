<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/taglib.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<c:url value='/css/user.css'/>">
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/user/header.jsp"/>

	<jsp:include page="${body}.jsp"/>

	<jsp:include page="/WEB-INF/views/layout/user/footer.jsp"/>

</body>
</html>
