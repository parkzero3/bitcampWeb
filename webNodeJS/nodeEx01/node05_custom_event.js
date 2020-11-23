


// 1. 이벤트가 정의되어 있는 events 모듈을 이용한다.

var EventEmitter = require('events');

// 2. EventEmitter를 이용하여 이벤트를 초기화 시킨다.

var customEvent = new EventEmitter();

// 3. 이벤트를 생성한다.
var cnt = 1;
customEvent.on('call',()=>{
	// call 이벤트가 발생하면 실행하는 실행문을 작성한다.
	console.log('call 이벤트가 발생됨->' + cnt++);
});

//---------------------------------------------------------

var http = require('http');
var server = http.createServer(function(request,response){
	// 강제로 이벤트 발생시키기
	customEvent.emit('call');
	
	response.writeHead(200,{'Content-Type':'text/html;charset=utf-8'});
	
	response.end("사용자 정의 이벤트 처리중 -> cnt :" + cnt);
});
server.listen(10006,function(){
	console.log("server 대기중.. http://localhost:10006");
});