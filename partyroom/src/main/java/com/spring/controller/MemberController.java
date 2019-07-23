package com.spring.controller;

import javax.servlet.http.HttpSession;

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
	public String register(MemberVO member, HttpSession session) {
		
		log.info("register : " + member);
		
		service.memberRegister(member);
		
		//모델에 저장 바로 로그인 되는 느낌으로 처리
		//이상하게 모델로 넘기면 안되는데 세션으로 하니까 되네;
		session.setAttribute("member", member);
			
		return "redirect:/board/list";
		
	}
	
	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession session) {
		MemberVO member = service.login(vo);
		//service.login(member);
		
		session.setAttribute("member", member);
		
		return "redirect:/board/list";
	}
	
	
	
}
