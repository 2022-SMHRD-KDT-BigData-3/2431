<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action = "SurveyCon">
		나이대 <select name = "age">
			<option value="10대">10대</option>
            <option value="20대">20대</option>
            <option value="30대">30대</option>
            <option value="40대">40대</option>
            <option value="50대">50대</option>
            <option value="60대이상">60대이상</option>
		</select> 
		
		지역 <select name = "city">
			<option value="서울특별시">서울특별시</option>
        	<option value="광주광역시">광주광역시</option>
        	<option value="인천광역시">인천광역시</option>
        	<option value="부산광역시">부산광역시</option>
        	<option value="대전광역시">대전광역시</option>
        	<option value="울산광역시">울산광역시</option>
        	<option value="대구광역시">대구광역시</option>
        	<option value="경기도">경기도</option>
        	<option value="충청북도">충청북도</option>
        	<option value="충청남도">충청남도</option>
        	<option value="전라북도">전라북도</option>
        	<option value="전라남도">전라남도</option>
        	<option value="경상북도">경상북도</option>
        	<option value="경상남도">경상남도</option>
        	<option value="강원도">강원도</option>
        	<option value="제주도">제주도</option>
		</select> 
		
		단어 <input type = "text" name = "prevletter"> 
		<input type = "submit">
	</form>
</body>
</html>