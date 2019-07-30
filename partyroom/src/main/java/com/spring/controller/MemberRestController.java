package com.spring.controller;


import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.MemberVO;
import com.spring.service.MemberRestService;
import com.spring.service.MemberService;
import com.spring.service.SHA256Util;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/check/*")
@RestController
@Log4j
public class MemberRestController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberRestService service;
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;
	
	//조회
	@GetMapping(value = "/{email}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<MemberVO> idCheck(@PathVariable("email") String email) {
		log.info("컨트롤러에서 확인 : " + service.idCheck(email));
		
		
		return new ResponseEntity<>(service.idCheck(email), HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
}
