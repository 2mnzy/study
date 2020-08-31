<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<script src="resources/js/jquery-3.5.0.js"></script>
<html>
<head>
	<title>Home</title>
	
	
</head>
<style>
body {text-align:center;}
#keyword{height: 30px;}
div {text-align:center;}
#table{
	padding-left:355px;
	padding-top: 30px;
}
#thumbnail{
	
}
#title:hover {
	display:block;
}
</style>
<body>
<h1>
	책
</h1>

<div>

검색어:<input type="text" id="keyword" size="70" onkeyup="enterkey();">
<button id="btn1" onclick="btnaction();">제출</button>
<br>
<table id="table">
		<tr style="padding-bottom:20px;">
		<th>제목</th>
		<th>저자</th>
		<th>이미지</th>
		</tr>
<c:forEach var="book" items="${list}">
	
		<tr>
		<td id='title'>${book.title}</td>
		<td>${book.author}</td>
		<td>
			<img id='thumbnail2' src="${book.image}" onmouseover="imageOn(this)" onmouseout="imageOut(this)"/>
			<div id='up' style="position:absolute; width:30%; left:1550px; top:300px; display:none;">
			<img id='thumbnail' src="${book.image}" />
			</div>
		</td>
		</tr>
</c:forEach>
</table>
</div>
</body>
<script>
function btnaction(){
	var keyword= document.getElementById("keyword").value;
	location.href="search.minji?keyword="+keyword;
}

function enterkey(){
	if (window.event.keyCode == 13) {
		btnaction();
   }
}

function imageOn(t){
	$(t).next().css("display","block");
	}
	
function imageOut(t){
	$(t).next().css("display","none");
	}



</script>

</html>
