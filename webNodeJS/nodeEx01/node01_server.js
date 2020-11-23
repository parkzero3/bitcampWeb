/**
	node.js 는 이븐테 기반 비동기식 서버프레임 워크이다.
	==========   준비사항 ====================
	
	1. http:// www.nodejs.org 에서 다운로드 후 설치
		버젼 확인하는방법  cmd - > node -v 입력
	
	2.이클립스에서 node 설치 
		help -> eclipse Marketplace > node 검색후 
		Enide.p2f - Eclipse node.js IDE.17.plus를 인스톨한다.				
 */

// 1. 서버를 생성하기 위해서는 http 모듈이 필요하다.
// 	  http 모듈을 객체로 생성하기 위해서는 require() 함수를 이용한다.
var http = require('http');

// 2. http 모듈을 이용하여 서버를 생성한다.
var server = http.createServer(function(request,response){
	// request : 클라이언트에서 서버로 정보를 보낼때
	// response : 서버에서 클라인트로 정보를 보낼때
	
	//
	response.writeHead(200,{'Content-type':'text/html; charset=UTF-8'});
	response.write('<h1>nodejs 서버에서 받은정보</h1>');
	response.write("<div style='color:red'>노드에서 한글은 </div>");
	response.end("<h2>END에서 보낸 메세지</h2>");
});

// 3. 클라이언트가 서버에 접속하면 접속을 받아낼 이벤트 
//				포트번호
	server.listen(10001,function(){
		console.log("서버 대기중 .. http://localhost:10001");
	});
