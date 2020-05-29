package com.jumanji.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jumanji.member.model.TMemberInfoModel;
import com.jumanji.member.service.TMemberInfoService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TMemberInfoServiceTests {

	
	@Setter(onMethod_ = @Autowired)
	private TMemberInfoService service;
	
	@Test
	public void testSelectMember() {
		log.info("testSelectMember read... ");
		
		TMemberInfoModel model = new TMemberInfoModel();
		model.setUser_id("admin");
		model.setUser_pw("1111");
		
		log.info(service.selectMember(model));
		
	}
	
}
