package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.MemberVO;
import com.spring.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/member/*")
@Controller
@AllArgsConstructor
@Log4j
public class MemberController {
	
	private MemberService service;
	
	//로그인 , 회원가입을 모달로 처리하니까 getmapping이 필요없을듯
	@PostMapping("/register")
	public String register(MemberVO member, Model model) {
		
		service.memberRegister(member);
		
		//모델에 저장
		model.addAttribute("member", member);
			
		return "/board/list";
		
	}
	
	
	
	
	
}
