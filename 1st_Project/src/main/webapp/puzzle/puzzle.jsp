<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.userDTO"%>
<%@page import="Model.quizDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#nickname{ display: none;}
#placeid{ display: none;}
#quiz{ display: none;}
body{
    background-image: url("./puzzle4.jpg");
    background-repeat: repeat;
    background-size: cover;
}

* {
  margin: 0;
  padding: 0;
}

.preview {
	width: 45%;
	float: left;
	margin-left: 2%;
}

.text {
	text-align: center;
	font-size: 40px;
}

</style>

</head>
<body>
<%
	//userDTO info = (userDTO)session.getAttribute("info");

	//quizDTO quizinfo = (quizDTO)session.getAttribute("quizinfo");
%>

<%-- <div id = "nickname"><%=info.getNickname()%></div>
<div id = "placeid"><%=quizinfo.getPlaceid()%></div>
<div id = "quiz"><%=quizinfo.getQuiz()%></div> --%>

	<div class="puzzle-container">
        <div class = "text">
            퍼즐게임
        </div>
        <div id = "timer" class = "text">
        	0
        </div>
        <label for="puzzle-input">
            이미지 선택
            <input onchange="updateImageDisplay()" name="puzzle-input" id="puzzle-input" type="file" accept="image/*">
        </label>
        <div class="preview item">
            <p>선택한 이미지로 퍼즐을 만듭니다.</p>
        </div>
        <table id="puzzle-board" class = "item">

        </table>
        <div id="puzzle-box">

        </div>
    </div>
    
<script type="text/javascript">
	const numColsToCut = 5;
	const numRowsToCut = 5;
	const imagePieces = [];
	const originImagePieces = [];
	const resultPieces = new Array(numColsToCut*numRowsToCut);
	
	function suffleList(array) {
	  for (let i = array.length - 1; i > 0; i -= 1) {
	    let j = Math.floor(Math.random() * (i + 1));
	    [array[i], array[j]] = [array[j], array[i]];
	  }
	}
	
	function suffleRendering() {
	  const box = document.getElementById('puzzle-box');
	  suffleList(imagePieces);
	  while(resultPieces.length > 0) {
	    resultPieces.pop();
	  }
	  imagePieces.forEach(img => {
		  box.appendChild(img);
		});
	}
	
	const maxTime = 300;
	let nowTime = 0;
	let timer;
	function startTimer() {
	  timer = window.setInterval(() => {
	    if(nowTime === maxTime) {
	      window.clearInterval(timer);
	      suffleRendering();
	      window.alert('시간 종료!');
	      var result = "flase";
	      var score = 0;
	      location.href = "../exitGameCon?nickname="+ nickname +"&placeid="+ placeid +"&quiz="+ quiz +"&result="+result+"&score="+score;
	    }
	    
	    nowTime += 1;
	    
	    document.getElementById("timer").innerHTML = (maxTime - nowTime) + "초";
	    
	  }, 1000);
	}
	
	function allowDrop(ev) {
	  ev.preventDefault();
	}
	
	function drag(ev) {
	  ev.dataTransfer.setData("text", ev.target.id);
	}
	
	const completePuzzle = (puzzle, result) => puzzle.every((piece, index) => piece === result[index]);
	
	function drop(ev) {
	  ev.preventDefault();
	  var data = ev.dataTransfer.getData("text");
	  const child = document.getElementById(data);
	  if (!data) return;
	  if (resultPieces.length === 0) {
		startTimer();
	  }
	  if (ev.target.nodeName !== 'TD') {
	    console.log(ev.target.parentNode);
	    const currentImage = ev.target;
	    const td = ev.target.parentNode;
	    td.removeChild(currentImage);
	    td.appendChild(child)
	    const box = document.getElementById('puzzle-box');
	    box.appendChild(currentImage);
	    return;
	  }
	  ev.target.appendChild(document.getElementById(data));
	  const index = ev.target.id.replace('piece_', '');
	  resultPieces[Number(index)] = data;
	  if (completePuzzle(originImagePieces, resultPieces)) {
	    window.alert('퍼즐 성공!');
	    var result = "true";
	    var score = 10;
	    location.href = "../exitGameCon?nickname="+ nickname +"&placeid="+ placeid +"&quiz="+ quiz +"&result="+result+"&score="+score;
	  }
	}
	
	function updateImageDisplay() {
	  const preview = document.querySelector('.preview');
	  const input = document.querySelector('input');
	  //const input = document.querySelector('.img');
	  const board = document.getElementById('puzzle-board');
	
	  document.querySelector('label').style.display = "none";
	  while(preview.firstChild) {
	    preview.removeChild(preview.firstChild);
	  }
	  const curFiles = input.files;
	    for(const file of curFiles) {
	         const para = document.createElement('p');
	         const imageItem = document.createElement('div');
	           const img = new Image();
	           img.onload = function() {
	             const widthOfOnePiece = this.width/numColsToCut;
	             const heightOfOnePiece = this.height/numRowsToCut;
	
	              while(board.firstChild) {
	                board.removeChild(board.firstChild);
	              }
	                 for(var x = 0; x < numColsToCut; ++x) {
	                    let tableRow = document.createElement('tr');
	                     for(var y = 0; y < numRowsToCut; ++y) {
	                         var canvas = document.createElement('canvas');
	                         canvas.width = widthOfOnePiece;
	                         canvas.height = heightOfOnePiece;
	                         var context = canvas.getContext('2d');
	                         context.drawImage(img, y * widthOfOnePiece, x * heightOfOnePiece, widthOfOnePiece, heightOfOnePiece, 0, 0, canvas.width, canvas.height);
	                         let pieceImage = new Image();
	                         pieceImage.src = canvas.toDataURL();
	                         pieceImage.id = canvas.toDataURL();
	                         pieceImage.draggable = true;
	                         pieceImage.ondragstart = drag;
	                         let tableData = document.createElement('td');
	                         tableData.ondrop = drop;
	                         tableData.ondragover = allowDrop;
	                         tableData.width = widthOfOnePiece;
	                         tableData.height = heightOfOnePiece;
	                         tableData.id = `piece_${x * numColsToCut + y}`;
	                         tableRow.appendChild(tableData);
			   originImagePieces.push(pieceImage.src);
	                         imagePieces.push(pieceImage);
	                     }
	                     board.appendChild(tableRow);
	                 }
		suffleRendering();
		startTimer();
		}	
	           img.src = URL.createObjectURL(file);
	
	           imageItem.appendChild(img);
	           imageItem.appendChild(para);
	           preview.appendChild(imageItem);
	     }
	}
</script>
</body>
</html>

<style>
input {
  opacity: 0;
}

table {
  border: 1px solid black;
  border-spacing: 0;
  box-sizing: border-box;
}

td {
  border: 1px solid black;
  padding:0px !important;
  box-sizing: border-box;
  border-spacing: unset;
  border-collapse: collapse;
}

td img {
  display: block;
}

img:hover {
  box-sizing:border-box;
  outline: solid 2px red;
}

</style>