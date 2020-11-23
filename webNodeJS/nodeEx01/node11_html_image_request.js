var http = require('http');
var url = require('url');
var fs = require ('fs');
var mime = require('mime');
var server = http.createServer(function(request,response){
	// request 에서 url 파싱하여 접속 주소를 알아낸다.
	var parseUrl = url.parse(request.url);
	
	//pathname  접속주소를 알아낸다.
	var pathName = parseUrl.pathname;
	console.log("pathName=========="+pathName);
	
	if(pathName == '/home'){ // html 파일을 요구
		//html파일을 read를 하여 response 에 쓰기를 한다.
		fs.readFile(__dirname+"/node10_html_image.html","utf-8",function(error,data){
			if(!error){// 값이 있을경우 에러발생 = true - > 값이 없을경우 에러가 발생하지않음 =false
				//쓰기 : 파일에서 정상적으로 읽기를 했을 때
				response.writeHead(200,{'Content-Type':'text/html;charset=utf-8'});
				response.end(data);
			}else{
				response.writeHead(404,{'Content-Type':'text/html'});
				response.end('500 Error Page!!');
			}			
		});
	}else if(pathName.indexOf("/image")==0){//image 폴더명으로 요청이 들어올시
		var imgPath = pathName.substring(1);     //  '/image/01.jpg' << 제일 앞 / 자르기 --> image/01.jpg 
		// mime : 파일의 종류
		var imgMime = mime.lookup(imgPath);
		console.log("mime---->"+imgMime); 
		fs.readFile(imgPath,function(error,data){
			if(error){ // 에러일때
				
			}else { //에러 아닐때
				response.writeHead(200,{'Content-Type':imgMime});
				response.end(data);
			}
		});
	}else{
		response.writeHead(404,{'Content-Type':'text/html'});
		response.end('404 Page Not Found!!');
	}
});

server.listen(10009,function(){
	console.log("server start !");
	console.log("http://localhost:10009/home");
});