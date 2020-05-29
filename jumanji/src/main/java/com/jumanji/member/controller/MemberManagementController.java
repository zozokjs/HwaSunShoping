package com.jumanji.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jumanji.controller.SampleController;
import com.jumanji.member.service.TMemberInfoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class MemberManagementController {

	private TMemberInfoService service;

	//메인 페이지 보여줌
	@RequestMapping("")
	public String main() {
		
		log.info("main read");		
		return "main/main";
	}
	
}
