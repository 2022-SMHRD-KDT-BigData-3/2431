<%@page import="Model.userDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/common.css">
<link rel="stylesheet" href="./css/main.css">

<title>2431</title>
<style type="text/css">
.main{
	background:beige;
}
h2 {
 font-size:5em;
 font:bold 7.5vw/1.6 'Signika', sans-serif;
 user-select:none;
}

h2 span { display:inline-block; animation:float .2s ease-in-out infinite; }
 @keyframes float {
  0%,100%{ transform:none; }
  33%{ transform:translateY(-1px) rotate(-2deg); }
  66%{ transform:translateY(1px) rotate(2deg); }
}
body:hover span { animation:bounce .6s; }
@keyframes bounce {
  0%,100%{ transform:translate(0); }
  25%{ transform:rotateX(20deg) translateY(2px) rotate(-3deg); }
  50%{ transform:translateY(-20px) rotate(3deg) scale(1.1);  }
}

span:nth-child(4n) { color:hsl(50, 75%, 55%); text-shadow:1px 1px hsl(50, 75%, 45%), 2px 2px hsl(50, 45%, 45%), 3px 3px hsl(50, 45%, 45%), 4px 4px hsl(50, 75%, 45%); }
span:nth-child(4n-1) { color:hsl(135, 35%, 55%); text-shadow:1px 1px hsl(135, 35%, 45%), 2px 2px hsl(135, 35%, 45%), 3px 3px hsl(135, 35%, 45%), 4px 4px hsl(135, 35%, 45%); }
span:nth-child(4n-2) { color:hsl(155, 35%, 60%); text-shadow:1px 1px hsl(155, 25%, 50%), 2px 2px hsl(155, 25%, 50%), 3px 3px hsl(155, 25%, 50%), 4px 4px hsl(140, 25%, 50%); }
span:nth-child(4n-3) { color:hsl(30, 65%, 60%); text-shadow:1px 1px hsl(30, 45%, 50%), 2px 2px hsl(30, 45%, 50%), 3px 3px hsl(30, 45%, 50%), 4px 4px hsl(30, 45%, 50%); }

h2 span:nth-child(2){ animation-delay:.05s; }
h2 span:nth-child(3){ animation-delay:.1s; }
h2 span:nth-child(4){ animation-delay:.15s; }
h2 span:nth-child(5){ animation-delay:.2s; }
h2 span:nth-child(6){ animation-delay:.25s; }
h2 span:nth-child(7){ animation-delay:.3s; }
h2 span:nth-child(8){ animation-delay:.35s; }
h2 span:nth-child(9){ animation-delay:.4s; }
h2 span:nth-child(10){ animation-delay:.45s; }
h2 span:nth-child(11){ animation-delay:.5s; }
h2 span:nth-child(12){ animation-delay:.55s; }
h2 span:nth-child(13){ animation-delay:.6s; }
h2 span:nth-child(14){ animation-delay:.65s; }
</style>

</head>
<body>
	<% 
		userDTO info = (userDTO)session.getAttribute("info");
	%>

	<header class="header">
		<div class="inner">
			<ul class="header-menu">
				<li class="nav-item"><a href="./main2.jsp"> HOME </a></li>
				<li class="nav-item"><a href="./survey.jsp"> GAME </a></li>
				<li class="nav-item"><a href="./statistics.jsp"> STATISTICS
				</a></li>
				<li class="nav-item"><a href="./historic.jsp"> HISTORIC
						SITE </a></li>
			</ul>
		</div>
	</header>

	<section class="main text-center">
		
		 <h2><span>???</span><span>???</span><span>???</span> <span>???</span><span>???</span><span></span><span>???</span> <span>???</span><span>???</span></h2>
		<h2><span>M</span><span>a</span><span>p</span> <span>S</span><span>t</span><span>o</span><span>r</span><span>y</span><span></span><span></span></h2>
		</section>

	<section class="sub-menu">
		<div class="sub-item" id="game">
			<img src="./img/33.png"  alt="???????????????">
			<div>
				<h1>GAME</h1>
				<p>?????? ?????????????????? ???????????? 518 ??????????????? ????????? ??? ??? ??????.</p>
			</div>
			<div class="more">
				<button>
					<a href="./survey.jsp">?????????</a>
				</button>
			</div>
		</div>

		<div class="sub-item" id="statistics">
			<img src="./img/44.png" alt="???????????????">
			<div>
				<h1>STATISTICS</h1>
				<p>????????? ?????? ????????? ???????????? ??????, ??????, ?????????????????? ????????? ??? ??? ??????.</p>
			</div>
			<div class="more">
				<form action="statisticsCon">
					<button>
						<a href="./statistics.jsp">?????????</a>
					</button>
				</form>
			</div>
		</div>

		<div class="sub-item" id="historic">
			<img src="./img/55.png" alt="??????????????????">
			<div>
				<h1>HISTORIC</h1>
				<p>????????? ????????? 518 ??????????????? ????????? ??? ??? ?????? ??????????????????.</p>
			</div>
			<div class="more">
				<button>
					<a href="./historic.jsp">?????????</a>
				</button>
			</div>
		</div>
	</section>

	<script type="text/javascript">
	
  </script>
</body>
</html>