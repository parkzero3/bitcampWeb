var http = require('http');
var fs = require('fs');

var express = require('express');
var ejs = require('ejs');
var requestip = require('request-ip');

var bodyParser = require('body-parser');

var app = express();
var server = http.createServer(app);

//--------------------  oracledb
var oracledb = require('oracledb');
oracledb.autoCommit=true; //자동커밋 설정

// db연결
var conn;
oracledb.getConnection({
	user:'scott',
	password:'tiger',
	connectString:'localhost:1521/xe',
},(error,con)=>{
	//연결 성공시
	if(error){ //에러발생시
		console.log("DB연결 error 발생->"+error );
	}else{
		conn = con ;
	}
});

//express 기본 폴더 셋팅 
app.use(express.static(__dirname));  //express에 기본폴더 셋팅
app.use(bodyParser.urlencoded({extended:true}));  //한글 인코딩

//get 방식으로 접속
app.get('/list',(request,response)=>{
	//데이터 베이스 접속시 오라클 DB가 필요함
	var sql = "select no, subject, userid, to_char(writedate,'MM-DD HH:MI')writedate, hit ";
		sql += " from freeboard order by no desc";
	// 실행하기		  에러, 선택한레코드
	conn.execute(sql,(error,result)=>{
		if(error){
			console.log("레코드 선택 에러발생 --> "+ error);
		}else{
			var cnt = result.rows.length;// 총 레코드 수
			
			// list.ejs 파일을 읽은 후 선택한 레코드를 랜더 하여 클라이언트에게 보냄
			//31행 기본경로가 셋팅 되어있기때문에 파일명만 입력
			fs.readFile('list.ejs','utf-8',(e,d)=>{
				if(!e){ //에러가 발생하지 않을경우
					response.writeHead(200,{'Content-Type':'text/html;charset=utf-8'});
					//					   (view코드,ejs에 보낼데이터를 json으로 표시)
					response.end(ejs.render(d,{
						records : result ,
						recordCount : cnt ,
						paging : {
							firstPage : 7 ,
							lastPage : 25 ,
							nowPage : 6
						}
					}));
					
				}else{ // 에러가 발생한 경우
					console.log("list.ejs 파일 읽기 에러 ->"+ e);
				}
			});
		}
	});
});

//글쓰기 폼 
app.get('/write',(request,response)=>{
	fs.readFile("write.html",(error,data)=>{
		if(!error){ //에러가 아닐시
			response.writeHead(200,{"Contetn-Type":"text/html;charset=utf-8"})
			response.end(data);
		}else{
			console.log("글쓰기 폼 에러발생 -> "+error);
		}
	});
});
//글 등록
app.post('/writeOk',(req,res)=>{
	// 폼의 데이터를 request
	var userid = req.body.userid;
	var subject = req.body.subject;
	var content = req.body.content;
	
	//접속자의 ip구하기 
	var ip = requestip.getClientIp(req).substring(7);
	console.log("ip=>"+ip)
	var sql = "insert into freeboard (no, userid, subject, content, ip) "
		sql+= "values(a_sq.nextval,'"+userid+"','"+subject+"','"+content+"','"+ip+"')"
	console.log("sql->"+sql);
	conn.execute(sql,(error,result)=>{
		if(error){ //에러발생시 -> 글쓰기폼으로 이동
			// 특정메소드에서 다른 url로 리다이렉트 하기
			res.statusCode = 302;
			res.setHeader("Location","/writeOk");
			res.end();
		}else{ //추가생공시
			res.statusCode = 302;
			res.setHeader("Location","/list");
			res.end();
		}
	});
});	
//글 내용보기

app.get('/view',(request,response)=>{
	var no = request.param('no');
	
	var sql = "select no, subject, DBMS_LOB.SUBSTR(content,DBMS_LOB.GETLENGTH(content)),";
		sql+= " userid, hit, to_char(writedate,'YYYY-MM-DD HH:MI:SS') ";
		sql+= " from freeboard where no="+no;
	conn.execute(sql,(error,result)=>{
		if(!error){
			fs.readFile('view.ejs','utf-8',(error,data)=>{
				if(!error){
					response.writeHead(200,{'Content-Type':'text/html;charset=utf-8'});
					response.end(ejs.render(data,{
						results : result
					}));			
				}
			});
		}
	});
});

//글 수정폼
app.get('/edit',(req,res)=>{
	var no = req.param('no');
	
	var sql = "select no, subject, DBMS_LOB.SUBSTR(content,DBMS_LOB.GETLENGTH(content)) ";
		sql+= "from freeboard where no="+no;
		conn.execute(sql,(e,result)=>{
			if(!e){
				console.log(e)
				fs.readFile('edit.ejs','utf-8',(error,data)=>{
					res.writeHead(200,{'Content-Type':'text/html;charset=utf-8'});
					res.end(ejs.render(data,{
						results : result
				}));
			});
		}
	});	
});

//글수정 - 실패수정, 성공 글내용
app.post('/editOk',(req,res)=>{
	var no = req.body.no;
	var subject = req.body.subject;
	var content = req.body.content;
	
	var sql = "update freeboard set subject ='"+subject+"',content= '"+content+"'";
		sql += "where no="+no;
		
	conn.execute(sql,(error,result)=>{
		if(error){ //에러발생
			res.statusCode =302;
			res.setHeader('Location','/edit?='+no);
			res.end();
		}else{
			res.statusCode =302;
			res.setHeader('Location','/view?='+no);
			res.end();
		}
	});
});

//삭제하기

app.get('/del',(req,res)=>{
	var no = req.param('no');
	
	var sql = "delete from freeboard where no="+no;
	conn.execute(sql,(error,result)=>{
		if(error){
			res.writeHead(200,{'Content-Type':'text/html;'});
			res.end("<script>location.href='/view?no="+no+"';</script>");
		}else{
			res.writeHead(200,{'Content-Type':'text/html;'});
			res.end("<script>location.href='/list';</script>");
		}
	});
});


server.listen(10016,()=>{
	console.log("server start");
	console.log("http://localhost:10016/write");
});