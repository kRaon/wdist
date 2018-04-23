<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/bootstrap.css?ver=0" media="screen">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>

<form action="/signUpNewPwd.do" method="post" id="searchpwdForm">
  <fieldset>
  <div align="center">
	<legend>새비밀번호 설정하기</legend>
  </div>
  <div align="center">
  <div class="col-md-6 col-md-offset-3" align="left">
					
		<div id="pwDiv" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Password</label> 
			<input id="pw" type="password" class="form-control is-invalid" name="pw">
			<div id="pw_feedback" class="pw_feedback">4~15글자 이내로 입력하셔야 가입이 가능합니다.</div>
		</div>

		<div id="pwCkDiv" class="form-group has-danger">
			<label class="form-control-label" for="inputDanger1">Password Check</label> 
			<input id="pw_Check" type="password" class="form-control is-invalid">
			<div id="pwCheck_feedback" class="pwCheck_feedback">다시한번 비밀번호를 입력해주세요.</div>
		</div>			


	
		<div class="form-group text-center">
			<button id="newPwdBtn" type="submit" class="btn btn-success">새비밀번호 설정</button>
			<button type="button" class="btn btn-warning">가입취소</button>			
		</div>
	</div>
	</div>
	</fieldset>
</form>

<!-- 실제 서버로 전송되는 form -->
<form action="/signUpNewPwd.do" method="post" id="hiddenForm">
    <fieldset>

        <input type="hidden" name="pw" />

    </fieldset>
</form>

<script src="/js/rsa/jsbn.js"></script>
<script src="/js/rsa/prng4.js"></script>
<script src="/js/rsa/rng.js"></script>
<script src="/js/rsa/rsa.js"></script>
 <script src="/js/sha.min.js"></script>



<!-- 유저 입력 form의 submit event 재정의 -->
<script>

    var $pw = $("#hiddenForm input[name='pw']");


 
    // Server로부터 받은 공개키 입력
    var rsa = new RSAKey();
    rsa.setPublic("${modulus}", "${exponent}");
 
    $("#searchpwdForm").submit(function(e) {
        e.preventDefault();
 

        var pw = $(this).find("#pw").val();
		var shaPw = hex_sha512($('#pw').val()).toString();
        $pw.val(rsa.encrypt(shaPw));
        $("#hiddenForm").submit();
    });
</script>



</body>
</html>