package com.spring.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.MemberVO;
import com.spring.service.MemberService;
import com.spring.service.SHA256Util;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;
@AllArgsConstructor
@RequestMapping("/member/*")
@Controller
@Log4j
public class MemberController {
	
	private MemberService service;

	//회원가입
	@PostMapping(value="/register")
	public String register(MemberVO member, HttpSession session,
			HttpServletRequest request) throws Exception {
		
		log.info("register : " + member);
		
//		String salt = SHA256Util.generateSalt();
//		member.setSalt(salt);
//		System.out.println("salt : " + salt);
//		
//		String password = member.getPassword();
//		password = SHA256Util.getEncrypt(password, salt);
//		System.out.println("password : " + password);
//		
//		member.setPassword(password);
//		System.out.println("마지막 password : " + password);
		
		service.memberRegister(member);
		
		session.setAttribute("member", member);
			
		return "board/emailNotVerify";
		
	}
	
	@GetMapping("/emailAuth")
	public String emailAuth(@ModelAttribute("member") MemberVO member, Model model) throws Exception {
		log.info(member.getEmail() + " :  auth confrimed");
		member.setAuth(1);	// authstatus를 1로,, 권한 업데이트
		service.updateAuthstatus(member);
		
		//model.addAttribute("auth_check", 1);
		
		return "redirect:/board/list";
	}
	
	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession session) {
		vo = service.getMember(vo.getEmail());
		//String salt = service.getSaltById(vo.getEmail());
		//String password = vo.getPassword();
		int auth = service.getAuth(vo.getEmail());
		vo.setAuth(auth);
		System.out.println("member auth : " + auth);
		//System.out.println("salt : " + salt);
		//System.out.println("password : " + password);
		//password = SHA256Util.getEncrypt(password, salt);
		//vo.setPassword(password);
		//System.out.println("마지막 password : " + password);
		
		service.login(vo);
		//MemberVO member = service.login(vo);
		
		//이메일 인증이 안되어있다면
		if (vo.getAuth() == 0) {
			System.out.println("===========================auth 값 : " + vo.getAuth());
			return "board/emailNotVerify";
			
			} else {
		
			System.out.println("===========================auth 값 : " + vo.getAuth());
			
			
			session.setAttribute("member", vo);
			System.out.println("member : " + vo);
			return "redirect:/board/list";
			
			}
		
		}
	
	@GetMapping("/info")
	public void memberInfo() {
		
	}
	
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/board/list";
	}
	
	
	@PostMapping("/updatePassword")
	public String updatePassword(MemberVO member, @RequestParam("email") String email, 
			@RequestParam("modifyPassword") String modifyPassword, HttpSession session) {
		
		member.setEmail(email);
		member.setPassword(modifyPassword);

		service.updatePassword(member);
		
		session.setAttribute("member", member);
		return "redirect:/member/info";
		
	}
	
	
	//ajax 
	@PostMapping("/modifyPassword")
	@ResponseBody
	public Map<Object, Object> modifyPassword(MemberVO member) {
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = service.modifyPassword(member);
		
		map.put("cnt", count);
		
		return map;
	}
	
	
	
	
	
}