<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		#info{float:left; margin-left: 50px; font-size : 30px;}
        #contents{background-color: rgb(230, 191, 191); width: 1200px; height: 800px; margin: 0 auto;}
        #tajaContents{width:100%; height: 95%; position: relative}
        #inputContents{text-align: center; border-top-style: solid; border-top-color: black; padding-top: 5px;}
        #inputText{display:inline-block}
        #inputBtn{display:inline-block;}
</style>
</head>
<body>
 <div id="info">
        <div id="score"></div>
        <div id="life"></div>
    </div>
    <div id="contents">
        <div id="tajaContents"></div>
        <div id="inputContents">
            <div id="inputText">
                <input type="text" id="tajaText" />
            </div>
            <div id="inputBtn">
                <button id="tajaBtn">시작하기</button>
            </div>
        </div>
    </div>
<script src="tajajsjs.js"></script>
</body>
</html>