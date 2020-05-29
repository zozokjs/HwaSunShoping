package com.jumanji.db;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	
	
	//JDBC <-> MYSQL 간 기본 연결 설정
	
	@Test
	public void testConnection() {
		try(Connection con = DriverManager.getConnection(
				"jdbc:mysql://127.0.0.1:3306/jumanji?serverTimezone=UTC",
				"root",
				"1234")) {
			
			log.info(con);
			
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}


