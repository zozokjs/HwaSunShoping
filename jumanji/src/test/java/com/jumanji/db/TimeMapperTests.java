package com.jumanji.db;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jumanji.member.mapper.TMemberInfoMapper;
import com.jumanji.member.mapper.TimeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TimeMapperTests {

	
	@Setter(onMethod_ = @Autowired)
	private TimeMapper timeMapper;
	
	
	//@Test
	public void testGetTime() {

		log.info("1 > "+timeMapper.getClass().getName());
		log.info("2 > "+timeMapper.getTime());
	}
	
	@Test
	public void testGetTime2() {

		log.info("1 time2");
		log.info("2 > "+timeMapper.getTime2());
	}
	
	
}
