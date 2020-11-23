/**
 파일입출력 모듈
	fs : FileSystem
 */

// 1. fs 모듈 객체 구하기

var fs = require('fs');

//쓰기 할 내용

var txt = "My First data ......\r\n노드 js를 이용한 파일 쓰기";

// 2. 비동기식으로 파일 쓰기 : 비동기식은 읽기,쓰기  thread 쓰레드의 의해서 처리된다.
//			쓰기할 파일명(절대주소) , 데이터 , 콜백함수 
fs.writeFile('D:/javaFolder/nodeWrite.txt',txt,function(e){
	if(e){ //true : 쓰기실패,
		console.log("비동기식 쓰게 에러"+e);
	}else{ //false : 쓰기성공
		console.log("비동기식 쓰기 성공"+e);
	}
});

// 3. 동기식 파일쓰기 : 명령어를 실행하면 바로 쓰기를 한다.
// 						콜백 함수가 없으므로 에러발생시 처리를 위해 예외처리를 해야함

try{
//					(파일명, 데이터 ,인코딩)	
	fs.writeFileSync('D:/javaFolder/nodeWriteSync.txt',txt+'->동기식','UTF-8');
}catch(e){
	console.log("동기식 쓰기 에러발생"+e);
}









