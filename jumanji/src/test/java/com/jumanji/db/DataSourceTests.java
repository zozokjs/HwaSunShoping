package com.jumanji.db;

import static org.junit.Assert.fail;
import org.springframework.beans.factory.annotation.Autowired;
import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTests {
	
	@Setter(onMethod_ =  {@Autowired} )
	private DataSource dataSource;
	
	//성공
	@Test
	public void testConnection() {
		try(Connection con = dataSource.getConnection()) {
			log.info("con1 > "+con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

	
	@Setter(onMethod_ = { @Autowired })
	private SqlSessionFactory sqlSessionFactory;
	
	//성공
	@Test
	public void testMyBatis() {
		try(
			SqlSession session = sqlSessionFactory.openSession(); 
			Connection con = session.getConnection();
				){
			log.info(session);
			log.info(con);
			
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
}
