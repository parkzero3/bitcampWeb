var http = require('http');
var url = require('url');
var fs = require ('fs');
var socketio = require('socket.io');

var server = http.createServer((req,res)=>{
	var urlName = url.parse(req.url);
	var pathName = urlName.pathname;

	if(pathName =='/chatForm'){
		fs.readFile(__dirname+"/chat_1.html","utf-8",(e,data)=>{		
			if(e){ //에러있을시
				res.writeHead(500,{'Content-Type':'text/html;charset=utf-8'});
				res.end("<h2>500error</h2> 발생");
			}else{ //에러없을시
				res.writeHead(200,{'Content-Type':'text/html;charset=utf-8'});
				res.end(data);
			}
		});
	}else{
		res.writeHead(404,{'Content-Type':'text/html;charset=utf-8'});
		res.end("<h2>404error</h2> 발생");
	}
});
server.listen(10014,function(){
	console.log("Start Server");
	console.log("http://localhost:10014/chatForm")
});


////////////////////////  ( Socket io 객체만들기 )////////////////////////////////
// socketio 이벤트를 만든다 ( 접속을 대기하는 이벤트)
var id =''; // <- 지역변수

var io = socketio.listen(server);

//클라이언트가 서버에 연결 하면 실행 될 이벤트 (connection)

io.sockets.on('connection',(socket)=>{
	console.log("클라이언트가 접속함");
	//접속자에게 자동으로 할당된 아이디
	id = socket.id;   // <- 전역변수
	console.log(id);
	//클라이언트가 보낸 통신정보를 받을 이벤트
	//		이벤트종류 , 받은정보
	socket.on('hello',(data)=>{
		console.log("Client Msg ==>"+ data)
		
		//클라이언트에게 문자보내는 이벤트를 발생시킨다.
		// socket.emit('echo',"welcome Client -->"+data); *1명에게 보낼때
		
//============== public 모든접속자에게 정보보내기================
		//[1] public : 모든 접속자에게 정보보내기
		//io.sockets.emit('echo','public-->'+data);
		
		//[2] broadcast : 나를 제외한 모든 접속자에게 정보 보내기
		//socket.broadcast.emit('echo','broadcast-->'+data);
		
		//[3]private : 특정 클라이언트에게만 데이터 보내기
		//		id가 전역변수 일 경우 마지막 접속자에게 보낸다.
		//		id가 지역변수 일 경우 현재 접속자에게 보낸다.
		io.sockets.in(id).emit('echo','private-->'+data);
				
	});
});





















