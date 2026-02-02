$(function () {
    // datepicker
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
	    prevText: '이전',
	    nextText: '다음',
	    monthNames: [
	      '1월','2월','3월','4월','5월','6월',
	      '7월','8월','9월','10월','11월','12월'
	    ],
	    monthNamesShort: [
	      '1월','2월','3월','4월','5월','6월',
	      '7월','8월','9월','10월','11월','12월'
	    ],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년',
	    changeMonth: true,
	    changeYear: true,
		yearRange: "1900:2100"
    });

    $(".datepicker").datepicker();

	// 전화번호 자동 변환
	$(".tel").on("input", function(){
		var value = $(this).val();

		// 숫자만 허용
		value = value.replace(/[^0-9]/g, "");

		// 최대 11자리
		if (value.length > 11) {
			value = value.slice(0, 11);
		}

		// 하이픈 처리
		if (value.length < 4) {
		// 그대로
		} else if (value.length < 8) {
			value = value.replace(/(\d{3})(\d+)/, "$1-$2");
		} else {
			value = value.replace(/(\d{3})(\d{4})(\d+)/, "$1-$2-$3");
		}

		$(this).val(value);
	});
});

// 이메일 형식 체크
function emailCheck(email_address){
	email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	if(!email_regex.test(email_address)){
		return false;
	}else{
		return true;
	}
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