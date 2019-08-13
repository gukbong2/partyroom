package com.spring.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.MemberVO;
import com.spring.service.MemberService;
import com.spring.service.SHA256Util;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
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
			return "/page/home";
			
			}
		
		}
	
	@GetMapping("/modifyPw")
	public void modifyPw() {
		
	}
	
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "/page/home";
	}
	@PostMapping("findPassword")
	public String findPassword(MemberVO member) throws UnsupportedEncodingException, MessagingException {
		
		service.findPassword(member);
		
		return "/page/home";
	}
	
	
	@PostMapping("/updatePassword")
	public String updatePassword(MemberVO member, @RequestParam("email") String email, 
			@RequestParam("modifyPassword") String modifyPassword, HttpSession session) {
		
		member.setEmail(email);
		member.setPassword(modifyPassword);

		service.updatePassword(member);
		
		//MemberVO vo = service.getMember(email);
		
		//session.setAttribute("member", vo);
		session.invalidate();
		
		return "/page/home";
		
	}
	
	@GetMapping("/findPwEmailAuth")
	public void findPwEmailAuth(@ModelAttribute("member") MemberVO member, Model model) throws Exception {
		log.info(member.getEmail());
		
	}
	
	@PostMapping("/resetPassword")
	public String resetPassword(MemberVO member, @RequestParam("email") String email, 
			@RequestParam("modifyPassword") String modifyPassword, HttpSession session) {
		
		member.setEmail(email);
		member.setPassword(modifyPassword);
		
		service.updatePassword(member);
		MemberVO vo = service.getMember(email);
		session.setAttribute("member", vo);
		return "/page/home";
	}
	
	@GetMapping("/deleteMember")
	public void deleteMember() {
		
	}
	
	@PostMapping("/deleteMember")
	public String deleteMember(MemberVO member, @RequestParam("email") String email, 
			@RequestParam("password") String password, HttpSession session) {
		
		member.setEmail(email);
		member.setPassword(password);
		
		service.deleteMember(member);
		
		session.invalidate();
		
		return "/page/home";
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
	
	//ajax 
	@PostMapping("/phoneCheck")
	@ResponseBody
	public Map<Object, Object> phoneCheck(MemberVO member) {
		int count = 0;
//		, @RequestParam("phone") String phone member.setPhone(phone);
		Map<Object, Object> map = new HashMap<Object, Object>();
		count = service.phoneCheck(member);
		
		map.put("cnt", count);
		
		return map;
	}


	
	//문자보내기
	@ResponseBody
	@RequestMapping(value = "/sendSMS", method = RequestMethod.POST)
	public void sendSMS(String phone) throws Exception { // 휴대폰 문자보내기

		String api_key = "";
		String api_secret = "";
		Message coolsms = new Message(api_key, api_secret);// 메시지보내기 객체 생성
		//String key = new TempKey().getNumKey(6); // 인증키 생성
		//service.insertAuthCode(phone, key); // 휴대폰 인증 관련 서비스
		
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone); // 수신번호
		params.put("from", "01039222459"); // 발신번호
		params.put("type", "SMS"); // 문자 타입
		params.put("text", "안녕하세요 방국봉입니다. 문자테스트"); // 문자내용
		params.put("charset", "utf-8");
		
		coolsms.send(params);
	}
	
	
	
	
}