var http = require('http');
var url = require('url');
var fs = require('fs');
var socketio = require('socket.io');

var server = http.createServer((req,res)=>{
	var pUrl = url.parse(req.url);
	var pathName= pUrl.pathname;
	
	if(pathName =="/chatForm"){
		fs.readFile(__dirname+'/chat_2_room.html','utf-8',(e,d)=>{
			if(!e){
				res.writeHead(200,{'Content-Type':'text/html;charset=utf-8'});
				res.end(d);
			}
		});
		
	}else{
		res.writeHead("404",{'Content-Type':'text/html'});
		res.end("404 error");
	}
});
server.listen(10015,()=>{
	console.log("server start");
	console.log("http://localhost:10015/chatForm");
});

//////////////////////////////////////////////////////

var io = socketio.listen(server);

io.sockets.on('connection',(socket)=>{
	var roomName ="";
	// 방만들기
	socket.on('join',(data)=>{
		roomName = data;
		// 방이름중에서 같은 방이름을 가진 객체끼리 조인한다.
		socket.join(roomName);
	});
	
	//클라이언트가 보낸 메세지를 받는 이벤트
	socket.on("msg",(data)=>{
		console.log(roomName,"=>"+data);
		//같은 방의 클라이언트에게 문자보내기
		io.sockets.in(roomName).emit('response',roomName+"->"+data);
		
	});
});




















