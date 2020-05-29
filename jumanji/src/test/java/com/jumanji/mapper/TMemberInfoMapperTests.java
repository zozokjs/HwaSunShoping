package com.jumanji.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jumanji.db.TMemberInfoTests;
import com.jumanji.member.mapper.TMemberInfoMapper;
import com.jumanji.member.model.TMemberInfoModel;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TMemberInfoMapperTests {
	
	
	@Setter(onMethod_ = @Autowired)
	private TMemberInfoMapper memberMapper;
	
	//@Test
	public void selectMember() {
		
		log.info("--_--__-");
		TMemberInfoModel model = new TMemberInfoModel();
		model.setUser_id("admin");
		model.setUser_pw("1234");
		
		TMemberInfoModel model2 = memberMapper.selectMember(model);
		
		log.info(model);
		
	}
	
	
	@Test
	public void selectMember2() {
		
		log.info("--_--__-");
		
		
		TMemberInfoModel model2 = memberMapper.selectMember2(2);
		
		log.info(model2);
		
	}
	
	
}
