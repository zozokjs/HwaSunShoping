package com.jumanji.model;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class SampleDTO {

	private String name;
	private int age;
	
	//private Date doDate;
	
	// 2020/01/01 형식으로 파라미터가 전달된다면 컨트롤러에서 initBinder() 없이도 날짜 타입으로 변환됨
	@DateTimeFormat(pattern="yyyy/mm/dd")
	private Date doDate;
	
}
