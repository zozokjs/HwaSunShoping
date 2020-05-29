package com.jumanji.controller;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jumanji.model.SampleDTO;
import com.jumanji.model.SampleDTOList;

import lombok.extern.log4j.Log4j;

//servlet-context.xml 혹은 servletConfig.java에서 
//<context:component-scan> 태그 혹은 @ComponentScan 어노테이션으로 해당 패키지를 지정하고 있기 때문에
//이 클래스는 bean이 된다.
@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {

	
	@RequestMapping("")
	public void basic() {
		log.info("basic...................");
	}
	
	//요청 > http://localhost:8080/sample/ex01?name=AA&age=123
	//결과 > SampleDTO(name=AA, age=123)
	//자료형이 자동 변환됨
	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		
		log.info(" "+dto);
		
		return "ex01";
	}
	
	
	//요청 > http://localhost:8080/sample/ex01?name=AA&age=123
	//결과 >  AA
	//결과 > 123
	//request로 전달된 변수 이름과 여기서 받는 변수 이름이 다를 때 쓰기 좋음
	@GetMapping("/ex02")
	public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) {
		
		log.info(" "+name);
		log.info(" "+age);		
		
		return "ex02";
	}
	
	//요청 > http://localhost:8080/sample/ex02List?ids=1&ids=2&ids=3	
	//결과 >  [1, 2, 3]
	@GetMapping("/ex02List")
	public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
		
		log.info(" "+ids);
		return "ex02List";
	}
	
	//요청 > http://localhost:8080/sample/ex02Array?ids=1&ids=2&ids=3
	//결과 >  [1, 2, 3]	
	@GetMapping("/ex02Array")
	public String ex02Array(@RequestParam("ids") String[] ids) {
		
		log.info(" "+Arrays.toString(ids));
		return "ex02Array";
	}
	
	//요청 > http://localhost:8080/sample/ex02Bean?list%5B0%5D.name=aaa&list%5B0%5D.age=1&list%5B1%5D.name=bbb&list%5B1%5D.age=2
	//요청 > http://localhost:8080/sample/ex02Bean?list[0].name=aaa&list[0].age=1&list[1].name=bbb&list[1].age=2	
	//결과 >  SampleDTOList(list=[SampleDTO(name=aaa, age=1), SampleDTO(name=bbb, age=2)])	
	@GetMapping("/ex02Bean")
	public String ex02Bean(SampleDTOList dtoList) {
		
		log.info(" "+dtoList);
		return "ex02Bean";
	}
	
	
	//파라마티 호출(binding)시 자동 호출되는 어노테이션
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));		
	}
	
	//요청 > http://localhost:8080/sample/ex03?name=a&doDate=2020-01-01
	//결과 > SampleDTO(name=a, age=0, doDate=Wed Jan 01 00:00:00 KST 2020)
	//initBinder() 덕분에 날자가 자동 변환되어 처리됨
	//initBinder 안 쓰려면 DTO에서 @DateTimeFormat(pattern="yyyy/mm/dd")를 지정해야 한다.
	@GetMapping("/ex03")
	public String ex03(SampleDTO dto) {
		
		log.info(" "+dto);
		return "ex03";
	}
	
	//요청 > http://localhost:8080/sample/ex04?name=a&doDate=2020-01-01&page=1
	//결과 > SampleDTO(name=a, age=0, doDate=Wed Jan 01 00:00:00 KST 2020)
	//결과 > 1
	//sample폴더 아래의 ex04.jsp에서는 DTO는 받아내어 페이지에 출력하지만 page는 안 됨
	@GetMapping("/ex04")
	public String ex04(SampleDTO dto, int page) {
		
		log.info(" "+dto);
		log.info(" "+page);
		
		return "/sample/ex04";
	}
	
	
	
	//요청 > http://localhost:8080/sample/ex04Model?name=a&doDate=2020-01-01&page=1
	//결과 > SampleDTO(name=a, age=0, doDate=Wed Jan 01 00:00:00 KST 2020)
	//결과 > 1
	//@ModelAttribute를 쓰면 sample폴더 아래의 ex04.jsp에서 DTO와 page를 모두 받아내어 페이지에 출력함
	@GetMapping("/ex04Model")
	public String ex04Model(SampleDTO dto, @ModelAttribute("page") int page) {
		
		log.info(" "+dto);
		log.info(" "+page);
		
		return "/sample/ex04";
	}

	
	/*
	 * Controller의 return 타입
	 * return 타입이 String인 경우 위에서처럼 해당되는 jsp를 리턴함. servlet-context.xml에서 value가 /WEB-INF/views/와.jsp로 설정되어 있기 때문이다.
	 * 이 return 타입에는 redirect와 forward 키워드를 붙일 수 있다.
	 * */
	
	
	//요청 > http://localhost:8080/sample/ex06
	//결과 > 브라우저가 열리며 화면상에  {"name":"Kim","age":1,"doDate":null} 라고 출력됨
	//이처럼 return 타입이 VO나 DTO 같은 객체 타입으로 지정하면 JSON 형태로 뽑아낼 수 있다.(pom.xml에 jackson-data-bind 추가해야함)
	@GetMapping("/ex06")
	public @ResponseBody SampleDTO ex06(){
		
		log.info(" ex06...... ");
		SampleDTO dto = new SampleDTO();
		dto.setAge(1);
		dto.setName("Kim");
		return dto;
	}

	//요청 > http://localhost:8080/sample/ex07
	//결과 > 브라우저가 열리며 화면상에  {"name" : "홍길동"} 라고 출력됨. 
	//개발자도구를 보면 Response Headers에 content-type이 application/json;charset=UTF-8로 되어 있음
	//이처럼 return 타입을 ResponseEntity로 지정하면 HTTP 프로토콜 헤더를 조정할 수 있다.
	@GetMapping("/ex07")
	public ResponseEntity<String> ex07(){
		
		log.info(" ex07...... ");
		String msg = "{\"name\" : \"홍길동\"}";
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "application/json;charset=UTF-8");
		
		return new ResponseEntity<String>(msg, header, HttpStatus.OK);
	}
		
	//파일 업로드 화면으로 이동
	@GetMapping("/ex08Upload")
	public void ex08Upload(){
		
		log.info(" ex08...... ");
	}

	//파일 업로드 화면에서 업로드 이후의 처리
	//요청 >  http://localhost:8080/sample/ex08upload 에서 파일 업로드 후 제출 버튼
	//결과 >  --------------------------
	//결과 >  name : Screenshot_1.png
	//결과 >  size : 74020	
	@PostMapping("/ex08UploadPost")
	public void ex08UploadPost(ArrayList<MultipartFile> files) {
		
		
		files.forEach(file -> {
			log.info("--------------------------");
			log.info("name : "+file.getOriginalFilename());
			log.info("size : "+file.getSize());
			
		});
		
	}
	
}
