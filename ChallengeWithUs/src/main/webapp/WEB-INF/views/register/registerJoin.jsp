<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/inc/viewsCss/registerStyle.css"
	type="text/css" />
</head>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script>
	function testChk() {
		//빈칸유무 체크 
		if (document.getElementById("userid").value == "") {
			alert("아이디를 입력하세요");
			return false;
		}
		if (document.getElementById("userpwd").value == "") {
			alert("비밀번호를 입력하세요");
			return false;
		}
		/*
		나머지 빈칸 조건문 작성
		*/
		return true; 
	}

	function doubleChk() {
		alert("아이디가 중복됩니다");
		}
	

	 function sample6_execDaumPostcode() {
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

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
</script>
<main>
	<div class="register-form">
		<div class="sign_font">회원가입</div>
		<input type="text" class="name" placeholder="이름">
		<div class="name_text">이름</div>
		<input type="text" class="phone" placeholder="연락처">
		<div class="phone_text">연락처</div>
		<input type="email" class="email" placeholder="이메일">
		<div class="email_text">이메일</div>
		<input type="password" class="password" placeholder="비밀번호" id="userpwd">
		<div class="pw_text">비밀번호</div>
		<div class="sex_text">성별</div>
		<input type="radio" class="radio1" name="sex" value="male"> <input
			type="radio" class="radio2" name="sex" value="female">
		<div class="male_font">남</div>
		<div class="female_font">여</div>
		<input type="password" class="confirm-password" placeholder="비밀번호 확인">
		<div class="pwcon_text">비밀번호 확인</div>
		<input type="text" class="birthday" placeholder="생년월일">
		<div class="birth_text">생년월일</div>
		<input type="text" class="id" placeholder="아이디" id="userid">
		<div class="id_text">아이디</div>
		<div class="double-check" onclick="doubleChk()">
			<div class="dochk">중복확인</div>
		</div>
		<input type="text" id="sample6_postcode" class="postnum" placeholder="우편번호">
		<input type="text" id="sample6_extraAddress" class="conf" placeholder="참고항목">
		<input type="text" class="address" placeholder="도로명 주소" id="sample6_address">
		<input type="text" id="sample6_detailAddress" class="detail_add" placeholder="상세주소">
		<div class="add_text" >주소</div>
		<div class="find-address" onclick="sample6_execDaumPostcode()">
			<div class="fadd_text">주소검색</div>
		</div>
		<div class="login-button" onclick="testChk()">
			<div class="check_text">확인</div>
		</div>
	</div>
</main>