<!DOCTYPE html>
<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import   url('https://fonts.googleapis.com/css?family=Black+Han+Sans:400');
@import url('https://fonts.googleapis.com/css?family=Nanum+Brush+Script:400');
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@keyframes typing {
   from {
      width: 0;
   }
   to {
      width: 100%;
   }
}

@keyframes blink {
   50% {
      text-shadow: none;
   }
   100% {
      text-shadow: 0px 0px 10px rgba(255, 255, 0, 0.5);
   }
}
#logo {
   font-size: 68px; 
   font-family: '검은고딕', 'Black Han Sans'; 
   margin-top: 0px;
   border-top:0px;
   padding-top:0px;
   margin-bottom: 0px;
   border-bottom:0px;
   padding-bottom: 100%;
   line-height: 20px; 
   color: #EB1616; 
   text-shadow: 3px 4px 3px #888888;  
}

#logo:hover {
  text-shadow: 8px 8px 10px #888888; /* 그림자 강화 */
}


#message {
   font-size: 90px;
   color: white;
   font-family: '나눔 손글씨 붓','Nanum Brush Script';
   line-height: 100%;
   margin-top: 18%;
   border-top: 0px;
   padding-top: 0px;
   margin-bottom: 0px;
   border-bottom: 0px;
   padding-bottom: 15px;
   white-space: nowrap;
   overflow: hidden; 
   text-shadow: 1px 2px 5px #888888;
   animation: typing 8s steps(60, end) forwards;
}
 

#message2 {
   color:#6C7293;
   font-family: 'GmarketSansMedium';    
   font-size: 18px;
   margin-top: 10px;
   border-top: 10px;
   padding-top: 15px;
   float: left;
   text-shadow: 1px 2px 5px #888888; 
}

.first {
   background-color:  #000000; 
   display: flex;
   justify-content: center;
   align-items: center;
   flex-direction: column;
   line-height: 70px;   
}

a { text-decoration-line: none; 
     }


</style>

<script>
document.addEventListener("DOMContentLoaded", function() {
  var message = document.getElementById("message");
  var messageText = message.innerHTML;
  var animationEnd = messageText.length * 120; // 120ms = typing animation duration
  setTimeout(function() {
    message.style.animation = "none";
  }, animationEnd);
});




</script>

</head>

<body>
   <div class="first">
      <h1 id="message">"Money를 그리다, Money를 달리다"</h1>      
      <h2 id="message2">대시보드로 읽는 목표달성형 가계부 서비스</h2>
      <a href="signin.jsp" target="_Self"><h3 id="logo">Cash&Dash</h3></a>      
   </div>
</body>
</html>