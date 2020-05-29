package com.jumanji.db;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jumanji.member.mapper.TMemberInfoMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TMemberInfoTests {


	/*
	 * @Setter(onMethod_ = @Autowired) private TMemberInfoMapper memberMapper;
	 * 
	 * @Test public void selectMember() {
	 * 
	 * log.info("--_--__-"); log.info(memberMapper.selectMember(2));
	 * 
	 * }
	 */
}
