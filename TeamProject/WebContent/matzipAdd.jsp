<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<form action = "memberAddResult.jsp">
			아이디 : <input type = "text" name = "id" /><br/>
			이름: <input type = "text" name = "name" /><br/>
			비밀번호 : <input type = "password" name = "password" /><br/>
			성별 : <input type = "radio" name = "gender" value = "남성" checked/>남성&nbsp;&nbsp;&nbsp;
				 <input type = "radio" name = "gender" value = "여성"/>여성<br/>
			핸드폰번호 : <select name = "phone1">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
					</select> -
					<input type = "text" name = "phone2" /> -
					<input type = "text" name = "phone3" /><br/>
			이메일 : <input type = "text" name = "email" /><br/>		
			<input type = "reset" value = "다시쓰기" />
			<input type = "submit" value = "등록하기" />
		</form>
	</body>
</html>