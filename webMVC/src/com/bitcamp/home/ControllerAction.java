package com.bitcamp.home;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/*.do")
public class ControllerAction extends HttpServlet {
	Map<String,CommandService> map = new HashMap<String,CommandService>();

    public ControllerAction() {
        super();
       
    }
    //doGet(), doPost()가 실행되기전에 호출되는 메소드
    public void init(ServletConfig config) throws ServletException  {
    	//properties 파일 매핑주소와 객체를  Map에 저장한다.
    	
    	//1.properties 파일이름 얻어오기
    	String propertiesFile = config.getInitParameter("proFileName");
    	
    	Properties prop = new Properties();
    	try {
    		FileInputStream fis = new FileInputStream(propertiesFile);
    		prop.load(fis);
    		
    	}catch(FileNotFoundException fnfe) {
    		System.out.println("properties파일 에러"+fnfe.getMessage());
    	}catch(IOException ie) {
    		System.out.println("properties 로드 에러"+ie.getMessage());
    	}
    	//2. properties 의  String 을 객체로 전환하여 map에 추가하는 기능 구현
    	try {
	    	// 키 목록 얻어오기
	    	Enumeration keyList= prop.propertyNames();
		    	while(keyList.hasMoreElements()) {
		    		String key = (String)keyList.nextElement();
		    		System.out.println("key:" + key);
		    		//key의 해당하는 commandClass명을 얻어온다 (String)
		    		String command = prop.getProperty(key);
		    		System.out.println("command:" + command);
		    		System.out.println("key="+key+",value="+command);
		    		
		    		//문자열로 되어있는 패키지와 클래스명을 객체로 만들기
		    		Class commandClass= Class.forName(command); //데이터타입 (클래스)
		    		CommandService service= (CommandService)commandClass.getDeclaredConstructors()[0].newInstance();
	    			map.put(key,service);
	    		}
    		
	    	}catch(Exception e) {
	    		System.out.println("프로퍼티를 Map을 만들기에서 에러발생"+e.getMessage());
	    	}
    }
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//uri 주소를 구한다.
		String uriPath = req.getRequestURI(); // webMVC/index.do
		String contextPath = req.getContextPath();//webMVC
		//System.out.println("uriPath="+uriPath);
		//System.out.println("contextPath="+contextPath);
		
		String commandKey = uriPath.substring(contextPath.length());
		System.out.println(commandKey);
		CommandService service= map.get(commandKey);
		System.out.println(service);
		String viewFile = service.executeCommand(req, res);
		
		//view 파일로 이동시키기
		RequestDispatcher dispatcher = req.getRequestDispatcher(viewFile);
		dispatcher.forward(req, res);//페이지 이동하기
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}