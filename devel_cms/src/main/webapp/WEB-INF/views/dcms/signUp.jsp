<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CMS</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script src="/js/devel.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="<c:url value='/css/devel.css'/>">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script type="text/javascript">
	var chk = "0";

	$(document).ready(function(){
		// alert messgae
		if("${message}" != "") {
			alert('<c:out value="${message}" />');
		}

		// 아이디 변경 시
		$("#memberId").on("input", function(){
			// 공백 제거
			var id = $(this).val().trim();
			$("#memberId").val(id);

			chk = "0";
		});
	});

	// 로그인
	function fn_login() {
		if($("#userId").val().trim() == "") {
			alert("아이디는 필수입니다.");
			return false;
		}

		if($("#password").val().trim() == "") {
			alert("비밀번호는 필수입니다.");
			return false;
		}

		$("#loginForm").submit();
	}

	// 회원가입
	function fn_signUp() {
		$("#signUpForm").submit();
	}

	// 주소찾기
	function fn_juso() {
		new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memberPost').value = data.zonecode;
                document.getElementById("memberAddr").value = addr;
                document.getElementById("memberAddrDetl").focus();
            }
        }).open();
	}

	// 아이디 중복검사
	function checkDup(){
		var memberId = $("#memberId").val();

		$.ajax({
		  url: "/login/checkId.do",
		  type: "POST",
		  data: {
			  memberId: memberId
		  },
		  success: function(data) {

			  console.log(data);
			  if(data.message == "ok") {
				  alert("사용 가능한 아이디입니다.");
				  chk = "1";
			  } else if(data.message == "dup") {
				  alert("이미 등록된 아이디입니다.");
				  chk = "0";
			  }

		  },
		  error: function(xhr, status, error){
			  console.log(xhr + ":" + status + ":" + error);
			  alert("처리 중 오류가 발생했습니다.");
			  return false;
		  }
		});
	}

	// 저장
	function fn_save() {
		// ID
		if($("#memberId").val() == "") {
			alert("아이디는 필수입니다.");
			$("#memberId").focus();
			return false;
		} else if($("#memberId").val().length < 4) {
			alert("아이디는 최소 4자리입니다.");
			$("#memberId").focus();
			return false;
		} else if(chk == "0") {
			alert("아이디 중복검사는 필수입니다.");
			$("#memberId").focus();
			return false;
		}

		// PassWord
		if($("#memberPw").val() == "" || $("#memberPw2").val() == "") {
			alert("비밀번호는 필수입니다.");
			return false;
		} else if($("#memberPw").val().length < 4) {
			alert("비밀번호는 최소 4자리입니다.");
			return false;
		} else if($("#memberPw").val() != $("#memberPw2").val()) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#memberPw2").focus();
			return false;
		}

		// Name
		if($("#memberNm").val() == "") {
			alert("이름은 필수입니다.");
			$("#memberNm").focus();
			return false;
		}

		// Email
		if($("#memberEmail").val() == "") {
			alert("이메일은 필수입니다.");
			$("#memberEmail").focus();
			return false;
		} else if(!emailCheck($("#memberEmail").val())) {
			alert("유효한 이메일 형식이 아닙니다.");
			$("#memberEmail").focus();
			return false;
		}

		// Birth
		if($("#memberBrthdy").val() == "") {
			alert("생년월일은 필수입니다.");
			$("#memberBrthdy").focus();
			return false;
		}

		// Phone
		if($("#memberPhone").val() == "") {
			alert("핸드폰 번호는 필수입니다.");
			$("#memberPhone").focus();
			return false;
		} else if($("#memberPhone").val().length < 13) {
			alert("핸드폰 번호는 13자리 입니다.");
			return false;
		}

		// Addr
		if($("#memberPost").val() == "" || $("#memberAddr").val() == "") {
			alert("주소는 필수입니다.");
			return false;
		}

		var formData = new FormData($("#signUpForm")[0]);

		if(confirm("저장 하시겠습니까?")) {
			$.ajax({
			  url: "/login/signUpSave.do",
			  type: "POST",
			  processData: false,
			  contentType: false,
			  data: formData,
			  success: function(data) {
				  if(data.message == "ok") {
					  alert("정상적으로 처리되었습니다.\n관리자의 승인 후 이용 가능합니다.");
					  location.href = "/login.do";
				  }
			  },
			  error: function(xhr, status, error){
				  console.log(xhr + ":" + status + ":" + error);
				  alert("처리 중 오류가 발생했습니다.");
				  return false;
			  }
			});
		}
	}

	// 취소
	function fn_back() {
		location.href = "/login.do";
	}
</script>
</head>
<body class="dev-page">
	<form name="signUpForm" id="signUpForm" method="post" action="/login.do">
		<div class="dev-box">
		    <div class="dev-header">
		        <h1>회원가입</h1>
		    </div>

		    <div class="dev-body">
	            <label for="memberId">아이디</label>
	            <input type="text" class="btn-63" id="memberId" name="memberId" placeholder="영문 또는 숫자 4자리" />
	            <button type="button" onclick="checkDup()" class="btn-35">중복검사</button>

	            <label for="memberPw">비밀번호</label>
	            <input type="password" id="memberPw" name="memberPw" placeholder="4자리 이상" />

	            <label for="memberPw2">비밀번호 확인</label>
	            <input type="password" id="memberPw2" name="memberPw2" placeholder="동일한 비밀번호를 입력하세요"/>

	            <label for="memberNm">이름</label>
	            <input type="text" id="memberNm" name="memberNm" placeholder="이름을 입력하세요" />

	            <label for="email">이메일</label>
	            <input type="text" id="memberEmail" name="memberEmail" placeholder="ex)xxxx@xxx.xxx 형식" />

	            <label for="memberBrthdy">생년월일</label>
	            <input type="text" class="datepicker" id="memberBrthdy" name="memberBrthdy" readonly/>

	            <label for="memberPhone">핸드폰번호</label>
	            <input type="text" class="tel" id="memberPhone" name="memberPhone" placeholder="핸드폰 번호를 입력하세요" />

	            <label for="memberPost">우편번호</label>
	            <input type="text" class="btn-63" id="memberPost" name="memberPost" placeholder="" readonly />
	            <button type="button" onclick="fn_juso()" class="btn-35">우편번호검색</button>

	            <label for="memberAddr">주소</label>
	            <input type="text" id="memberAddr" name="memberAddr" placeholder="주소찾기 버튼을 클릭하세요" readonly/>

	            <label for="memberAddrDetl">상세주소</label>
	            <input type="text" id="memberAddrDetl" name="memberAddrDetl" placeholder="상세주소를 입력하세요" />

	            <button type="button" onclick="fn_save()" class="dev-btn">저장하기</button>
	            <button type="button" onclick="fn_back()" class="dev-btn-gray">취소</button>
		    </div>

		    <div class="dev-footer">
		        © 2026 CMS Admin System
		    </div>
		</div>
	</form>
</body>
</html>