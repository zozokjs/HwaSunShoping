package com.jumanji.controller;

import java.util.Map;

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

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
@Log4j
public class BoardManagementControllerTests {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	//목업 MVC. 가짜 MVC
	private MockMvc mockMvc; 
	
	@Before
	public void setup() {
		log.info("before...............");
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	
	//@Test
	public void testGeneralBoardList() throws Exception{
		
		//MockMvcRequestBuilders로 GET 방식으로 해당 URL을 호출함
		//이것의 실행 결과, model에 어떤 값이 들어 있는지 출력된다.
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board")
				.param("grp_id", "PRD_001"))
				.andReturn()
				.getModelAndView()
				.getModelMap()
				);	
	}
	
	@Test
	public void testGeneralBoardList2() throws Exception{
		
		//MockMvcRequestBuilders로 GET 방식으로 해당 URL을 호출함
		//이것의 실행 결과, model에 어떤 값이 들어 있는지 출력된다.
		
		Map<String, Object> result = 
		
		(Map<String, Object>) mockMvc.perform(MockMvcRequestBuilders.post("/board/search/boardList")
				.param("grp_id", "PRD_001"))
				.andReturn()
				.getModelAndView();
				//.getModel()
				//.getView()
				//.getModelMap()
		log.info("-------------test result -----------------");
		log.info(result);
	}
}
