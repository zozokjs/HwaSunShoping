<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jumanji Login Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <form action="/main/authenticate" id="loginForm" method="get">
        <table>
            <colgroup>
                <col style="width:40%">
                <col style="width:60%">            
            </colgroup>
            <tbody>
                <tr>
                    <td colspan="2">관리자 로그인</td>
                </tr>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name = "user_id"></td>
                </tr>
                <tr>
                    <td>비번</td>
                    <td><input type="text" name = "user_pw"></td>
                </tr>
            </tbody>
        </table>
        <button class="btn btn-primary" type="button" onclick="login()">로그인</button>
    </form>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$(".btn").on("click", function(){
			console.log("-----");
			let btnId = $(this).attr("id");
			
		
		});
	});
	
	var login = function(){
		
		//유효성 검사
		$("#loginForm").submit();
	}

	
</script>
</body>
</html>