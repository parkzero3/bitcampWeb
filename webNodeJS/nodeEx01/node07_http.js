//NodeJS : 전역변수

// [1] __filename : 현재 실행중인 파일의 절대경로와 파일명을 가지고 있다.
// [2] __dirname : 현재 실행중인 파일의 경로


var http = require('http');
var server = http.createServer(function(request,response){
	response.writeHead(200,{'Content-Type':'text/html;charset=utf-8'});
	response.end("http 모듈 이벤트 테스트중");
});

// 1. 클라이언트가 서버에 접속 할때 발생하는 이벤트 : connection
// on = listen = addListen

server.on('connection',function(code){
	console.log("connection 이벤트 발생 code= "+code);
});

// 2. 서버가 종료되면 발생하는 이벤트 : close

server.on('close',function(code){
	console.log("close 이벤트 발생 code= "+code);
});

// 3. 클라이언트가 서버에 요청을 하면 발생하는 이벤트 : request

server.on('request',function(code){
	console.log("request 이벤트 발생 code= "+code);
});

// 4. 서버가 클라이언트에게 응답하면 발생하는 이벤트 : response

server.on('response',function(code){
	console.log("response 이벤트 발생 code= "+code);
});


server.listen(10008,function(){
	console.log("서버 대기중 ..  http://localhost:10008");
	console.log('__filename = '+__filename);
	console.log('__dirname = '+__dirname);
});
