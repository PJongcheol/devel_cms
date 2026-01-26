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
