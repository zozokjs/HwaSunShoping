package com.jumanji.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

//매번 URL 테스트 할 때마다 was를 재실행하면서 고치는 과정을 줄이기 위한 세팅
//아래처럼하면 was 재실행 없이 url을 테스트 할 수 있다.
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class MainControllerTests {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	
	//목업 MVC. 가짜 MVC
	//가짜로 url, 파라미터를 브라우저에서 사용하는 거처럼 만들어서 컨트롤러를 실행할 수 있다.
	private MockMvc mockMvc; 
	
	@Before
	public void setup() {
		log.info("before...............");
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	
	@Test
	public void testSelectMemberControl() throws Exception{
		
		//MockMvcRequestBuilders로 GET 방식으로 해당 URL을 호출함
		//이것의 실행 결과, model에 어떤 값이 들어 있는지 출력된다.
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/main/authenticate")
				.param("user_id", "admin")
				.param("user_pw", "1111"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);	
	}
	

}
