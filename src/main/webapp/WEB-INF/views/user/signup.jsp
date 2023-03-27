<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
	<meta charset="UTF-8">
	<meta content='IE=edge' http-equiv='X-UA-Compatible'>
    <title>아이티아이즈 CMS</title>
    <%@ include file="../include/header.jsp" %>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <style>
    	#moveLogin:hover {
    		text-decoration: underline;
    	}
    </style>
    <script type="text/javascript">
    	
    	let nameChk = false;
    	let idChk = false;
    	let pwChk = false;
    	let confirmPwChk = false;
    	let emailChk = false;
    	
    	
    	/* validation 정규식 */
    	// 이름 정규식
    	const nameChecker 	  = /^[가-힣]{2,6}$/;
    	// 아이디
    	const idChecker 	  = /^[a-zA-Z0-9]{4,14}$/;
    	// 패스워드
    	const passwordChecker = /^[a-zA-Z0-9]{8,20}$/;
    	// 이메일 형식 체크 (abc123@abc.abc)
		const mailChecker 	  = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    	// 아이디 중복전 Validation을 통과한 상태인지 체크
    	var idValidationYn 	  = false;
    	
    	function userNameCheck() {
    		// 사용자 이름
    		const uName 	 = $('#user_nm').val();
    		const input_warn = $('#user_nm');
    		var   name_warn  = $('#nameChk');
    		
    		// 공백체크
    		if(uName == ''){
    			input_warn.css('background', 'pink');
    			input_warn.css('color', 'black');
    			name_warn.html('<b style="font-size: 11px; color:red; margin-top: 5px;">이름은 필수 정보입니다.</b>');
    			nameChk = false;
    		}
    		else if(nameChecker.test(uName) == false){
    			input_warn.css('background', 'pink');
    			input_warn.css('color', 'black');
    			name_warn.html('<b style="font-size: 11px; color:red; margin-top: 5px;">2자리~6자리 한글입력이 필요합니다.</b>');
    			nameChk = false;
    		}
    		else {
    			input_warn.css('background', 'white');
    			input_warn.css('color', 'black');
    			name_warn.html('<b style="font-size: 11px; color:green; margin-top: 5px;">사용 가능한 이름입니다.</b>');
    			nameChk = true;
    		}
    	}
    	
		function userIdCheck() {
			// 키를 입력하고 땔 때 마다 이벤트 발생 
			var inId   = $('#user_id').val();
			var target = $('#user_id');
			var btn    = $('#btn-user-check');
			
			if(inId == ''){
				target.css('background', 'pink');
				target.css('color', 'black');
				$('#idChk').html('<b style="font-size: 11px; color:red; margin-top: 5px;">아이디는 필수 정보입니다.</b>');
				btn.attr('disabled', true);
				idChk = false;
			} else if(idChecker.test(inId) == false){
				target.css('background', 'pink');
				target.css('color', 'black');
				$('#idChk').html('<b style="font-size: 11px; color:red; margin-top: 5px;">영문과 숫자 조합으로 4~14자 조합해주세요.</b>');
				btn.attr('disabled', true);
				idChk = false;
			} else{
				btn.attr('disabled', false);
				target.css('background', 'pink');
				target.css('color', 'black');
				$('#idChk').html('<b style="font-size: 11px; color:red; margin-top: 5px;">중복확인을 해주세요.</b>');
				btn.attr('disabled', false);
				idChk = false;
			}
		}
		
		function btnUserIdCheck() {
			var uId     = $('#user_id').val();
			var target  = $('#user_id');
			var id_warn = $('#idChk');
			
			// 전송 파라미터
			var params = {
				user_id : uId
			}
			console.log("중복체크 : " + params);	
			$.ajax({
				type : "POST", // 서버에 전송하는 HTTP 방식 
				url  : "/user/userIdCheck",
				data : params,
				success : function(data) {
					var cnt = data.count;
					console.log(data.count);
					if(cnt > 0){
						target.css('background', 'pink');
						target.css('color', 'black');
						id_warn.html('<b style="font-size: 11px; color:red; margin-top: 5px;">이미 사용중인 아이디입니다.</b>');
						idChk = false;
					} else if(cnt == 0){
						target.css('background', 'white');
						target.css('color', 'black');
						id_warn.html('<b style="font-size: 11px; color:green; margin-top: 5px;">사용 가능한 아이디입니다.</b>');
						idChk = true;
					} else {
						target.css('background', 'pink');
						target.css('color', 'black');
						id_warn.html('<b style="font-size: 11px; color:red; margin-top: 5px;">아이디정보를 가져올 수 없습니다..</b>');
						idChk = false;
					}
				},
				error : function(status, error){
					console.log('통신 실패');
					console.log(status, error);
				}
			});
		}
		
		// 비밀번호 
		function passwordCheck() {
			const pw 	  = $('#pswd').val();
			const pw_warn = $('#pw_warn');
			var   pw_form = $('#pswd');
			
			// 유효성 검사
			if(pw == '') { // 공백체크
				pw_form.css('background', 'pink');
				pw_form.css('color', 'black');
    			pw_warn.html('<b style="font-size: 11px; color:red; margin-top: 5px;">해당내용은 필수 정보입니다.</b>');
    			pwChk = false;
			} else if(passwordChecker.test(pw) == false){
				pw_form.css('background', 'pink');
				pw_form.css('color', 'black');
    			pw_warn.html('<b style="font-size: 11px; color:red; margin-top: 5px;">영문과 숫자 조합으로 8~20자 조합해주세요.</b>');
    			pwChk = false;
			} else {
				pw_form.css('background', 'white');
				pw_form.css('color', 'black');
    			pw_warn.html('<b style="font-size: 11px; color:green; margin-top: 5px;">사용 가능한 비밀번호입니다.</b>');
    			pwChk = true;
			}
		}
		
		// 비밀번호 확인
		function confirmPasswordCheck() {
			const pw  	   = $('#pswd').val();
			const pwc 	   = $('#confirmPassword').val();
			const pwc_warn = $('#pwc_warn');
			var   pwc_form = $('#confirmPassword');
			
			if(pwc == '') { // 공백체크
				pwc_form.css('background', 'pink');
				pwc_form.css('color', 'black');
    			pwc_warn.html('<b style="font-size: 11px; color:red; margin-top: 5px;">해당내용은 필수 정보입니다.</b>');
    			confirmPwChk = false
			} else if(passwordChecker.test(pwc) == false){ // 유효성 검사
				pwc_form.css('background', 'pink');
				pwc_form.css('color', 'black');
    			pwc_warn.html('<b style="font-size: 11px; color:red; margin-top: 5px;">영문과 숫자 조합으로 8~20자 조합해주세요.</b>');
    			confirmPwChk = false
			} else if(pw != pwc) { // 비밀번호와 같은지 확인
				console.log(pw + " " + pwc);
				pwc_form.css('background', 'pink');
				pwc_form.css('color', 'black');
    			pwc_warn.html('<b style="font-size: 11px; color:red; margin-top: 5px;">비밀번호를 확인해주세요.</b>');
    			confirmPwChk = false
			} else {
				pwc_form.css('background', 'white');
				pwc_form.css('color', 'black');
    			pwc_warn.html('<b style="font-size: 11px; color:green; margin-top: 5px;">사용 가능한 비밀번호입니다.</b>');
    			confirmPwChk = true
			}
		}
		
		function emailCheck() {
			const email 	 = $('#user-eml').val() + $('#addr').val();
			const checkInput = $('.mail-check-input');
			var   warnMsg 	 = $('#email-warn');
			
			/* input validation*/
			if(mailChecker.test(email) == true){
				warnMsg.html('<b style="font-size: 11px; color:black; margin-top: 5px;">인증번호를 전송중입니다....</b>');
				$.ajax({
					type : "GET",
					url  : "<c:url value='/user/userEmailCheck'/>",
					data : {"email" : email},
					success : function(data) {
						checkInput.attr('disabled', false);
						code = data;
						$('#user-eml').css('background', 'white');
						warnMsg.html('<b style="font-size: 11px; color:green; margin-top: 5px;">인증번호를 전송하였습니다 번호확인을 해주세요.</b>');
					},
					error : function(req, status, err){
						alert("인증번호 전송에 실패하였습니다.")
						console.log(req);
					}
				});
			} else {
				$('#user-eml').css('background', 'pink');
				warnMsg.html('<b style="font-size: 11px; color:red; margin-top: 5px;">이메일 형식이 올바르지 않습니다.</b>');
			}
		}
		
		function emailConfirm() {
			const inputCode = $('.mail-check-input').val();
			const $resultMsg = $('#mail-check-warn');
			
			// 코드 데이터 타입 문자형태로 변경
			code = parseInt(code, 2).toString();
			
			console.log(code + " " + inputCode);
			// 입력코드와 인증코드값 비교
			if(inputCode === code)
			{
				$resultMsg.html('<b style="font-size: 11px; color:green; margin-top: 5px;">인증번호가 일치합니다.</b>');
				$('.mail-check-input').css('background', 'white');
				$('#addr').attr('onFocus', 'this.initialSelect = this.selectedIndex');
		        $('#addr').attr('onChange', 'this.selectedIndex = this.initialSelect');
		        
		        // 인증번호 확힌후 이메일 변경 불가
		        $('#btn-email-check').attr('disabled', true);
		        $('.mail-check-input').attr('disabled', true);
		        $('#btn-auth-check').attr('disabled', true);
		        $('#user-eml').attr('disabled', true);
		        $('#addr').attr('disabled', true);
		        
		        emailChk = true;
			}
			else
			{
				$resultMsg.html('<b style="font-size: 11px; color:red; margin-top: 5px;">인증번호가 불일치 합니다. 다시 확인해주세요!</b>');
				$('.mail-check-input').css('background','pink');
			}
		}
		
		function showPassword() {
			var showYn = $('#showPasswordYn').is(':checked');
			
			if(showYn == true){
				$('#pswd').prop('type', 'text');
				$('#confirmPassword').prop('type', 'text');
			} else {
				$('#pswd').prop('type', 'password');
				$('#confirmPassword').prop('type', 'password');
			}
		}
		
		function userJoin() {
	    	if(nameChk == false){
	    		$('#user_nm').focus();
	    		alert("이름을 확인해주세요");
	    	} else if(idChk == false){
	    		$('#user_id').focus();
	    		alert("아이디를 확인해주세요");
	    	} else if(pwChk == false){
	    		$('#pswd').focus();
	    		alert("비밀번호를 확인해주세요");
	    	} else if(confirmPwChk == false){
	    		$('#confirmPassword').focus();
	    		alert("비밀번호를 확인해주세요");
	    	} else if(emailChk == false){
	    		$('.mail-check-input').focus();
	    		alert("이메일을 확인해주세요");
	    	} else {
	    		var params = {
	    			user_nm : $('#user_nm').val(),
	    			user_id : $('#user_id').val(),
	    			pswd	: $('#pswd').val(),
	    			user_eml_addr : $('#user-eml').val() + $('#addr').val()
	    		}
	    		
	    		$.ajax({
					type : "POST", // 서버에 전송하는 HTTP 방식 
					url  : "/user/join",
					data : params,
					success : function(data) {
						if(data.result == "Success"){
							alert('회원가입이 완료되었습니다!\n로그인 해주세요');
							location.href = "/user/login";
						} else {
							alert("회원가입에 실패하였습니다. 시스템에 오류가 있습니다")
						}
					},
					error : function(status, error){
						console.log('통신 실패');
						console.log(status, error);
					}
				});
	    	}
		}
	</script>


</head>
<body>
	<div style="margin: 0 auto;  max-width: 475px;  max-height: 695px; padding: 20px 30px; background: #ffffff; box-shadow: 0px 2px 2px rgba(0,0,0,.2) !important;margin: auto;  left: 0;  right: 0;  top: 0; bottom: 0; position: absolute; border-radius: 5px;">
		<div class="text_center " style="margin-bottom: 30px">
           <a href="../index.html" class="logo_login"><span>Create An Account</span></a>
        </div>
        
		<div class="media form-inline>
			<form action="/user/join" method="post">
				<table width="100%">
					<colgroup>
						<col width="40%;">
						<col width="40%;">
						<col width="20%;">
					</colgroup>
					<tr>
						<td colspan="3"><input type="text" id="user_nm" class="form-control" onkeyup="userNameCheck();" style="width:100%; height: 40px;" placeholder="* 이름을 입력해주세요 "/></td>
					</tr>
					<tr>
						<td colspan="3"><span id="nameChk" class="text-muted"></span></td>
					</tr>
					<tr name="spacing"><td colspan="3" style="padding-top: 15px; padding-bottom:15px;"></td></tr>
					<tr>
						<td colspan="2"><input  type="text" id="user_id" class="form-control" onkeyup="userIdCheck();" placeholder="* 아이디를 입력해주세요" style="width:100%; height: 40px;"/></td>
						<td style=" text-align: center;"><button type="button" id="btn-user-check" class="btn gray" style="height: 40px;"  disabled="disabled" onclick="btnUserIdCheck();" value="button">중복확인</button></td>
					</tr>
					<tr>
						<td colspan="3"><span id="idChk" class="text-muted"></span></td>
					</tr>
					<tr name="spacing"><td colspan="3" style="padding-top: 15px; padding-bottom:15px;"></td></tr>
					<tr>
						<td colspan="3"><input type="password" class="form-control" id="pswd" onkeyup="passwordCheck();" style="height: 40px;" aria-describedby="pw_warn" placeholder="* 비밀번호를 입력해주세요 "></td>
					</tr>
					<tr>
						<td colspan="3"><small id="pw_warn" class="text-muted">Must be 8-20 characters long.</small></td>
					</tr>
					<tr name="spacing"><td colspan="3" style="padding-top: 15px; padding-bottom:15px;"></td></tr>
					<tr>
						<td colspan="3"><input type="password" class="form-control" id="confirmPassword" onkeyup="confirmPasswordCheck();" style="height: 40px;" aria-describedby="pwc_warn" placeholder="* 비밀번호를 확인해주세요"></td>
					</td>
					</tr>
					<tr>
						<td colspan="3"><small id="pwc_warn" class="text-muted">Must be 8-20 characters long.</small></td>
					</tr>
					<tr name="spacing"><td colspan="4" style="padding-top: 5px; padding-bottom:5px;"></td></tr>
					<tr><td><input type="checkbox" onclick="showPassword();" id="showPasswordYn" style="margin: 0.4rem;"><label style="font: 1rem 'Fira Sans', sans-serif; font-weight: bold;">비밀번호 보이기</label></td></tr>
					<tr name="spacing"><td colspan="4" style="padding-top: 15px; padding-bottom:15px;"></td></tr>
					<tr>
						<td><input type="text" name="user-email" id="user-eml" class="form-control" style="width: 100%; height: 40px;" placeholder="이메일 "></td>
						<td>
							<select name="address" id="addr" style="width: 100%; height: 40px;">
						  		<option>@iteyes.co.kr</option>
						  		<option>@gmail.com</option>
								<option>@naver.com</option>
								<option>@daum.net</option>
								<option>@hanmail.com</option>
							</select>
						</td>
						<td style="text-align: center;"><button type="button" id="btn-email-check" class="btn gray" style="height: 40px;" onclick="emailCheck();" value="button">본인인증</button></td>
					</tr>
					<tr>
						<td colspan="3"><span id="email-warn" class="text-muted"></span></td>
					</tr>
					<tr name="spacing"><td colspan="3" style="padding-top: 5px; padding-bottom:5px;"></td></tr>
					<tr>
						<td colspan="2"><input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6" style="width:100%;"></td>
						<td style=" text-align: center;"><button type="button" id="btn-auth-check" class="btn gray" style="height: 40px;" onclick="emailConfirm();" value="button">번호확인</button></td>
					</tr>
					<tr>
						<td colspan="3"><span id="mail-check-warn" style="margin-top: 5px;"></span></td>
					</tr>
				</table>
				<div style="text-align: center; margin-top: 20px;">
					<span>Already a member?  <a id="moveLogin" href="./login" class="blue">Log In</a></span>
				</div>
			  	<div class="form-group text-center" style="margin-top: 30px;">
					<button class="btn blue" onclick="userJoin();" type="submit" style="width: 100px; height: 40px;">회원가입</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
