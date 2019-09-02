package com.spring.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
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

import com.spring.domain.Criteria;
import com.spring.domain.MemberVO;
import com.spring.service.MemberService;
import com.spring.service.SHA256Util;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
@AllArgsConstructor
@RequestMapping("/member/*")
@Controller
@Log4j
public class MemberController {
	
	private MemberService service;
	
	@RequestMapping("/UpdateAddress")
	public void UpdateAddress() {
		
	}
	
	
	
	//회원가입 주소 팝업 불러오기
	@RequestMapping("/address")
	public void address() {
		
	}
	
	//회원 정보 수정 페이지
	@GetMapping("/profile")
	public void profile(Criteria cri, Model model, HttpSession session) {
		
		
	}
	
	@GetMapping("/login")
	public void loginPage() {
		
	}
	
	
	
	
	//회원가입
	@PostMapping("/register")
	public String register(MemberVO member, HttpSession session,
			HttpServletRequest request) throws Exception {
		
		log.info("register : " + member);
		
		String salt = SHA256Util.generateSalt();
		member.setSalt(salt);
		System.out.println("salt : " + salt);
		
		String password = member.getPassword();
		password = SHA256Util.getEncrypt(password, salt);
		System.out.println("password : " + password);
		
		member.setPassword(password);
		System.out.println("마지막 password : " + password);
		
		service.memberRegister(member);
		
			
		return "member/emailNotVerify";
		
	}
	
	//auth 1로 업데이트
	@GetMapping("/emailAuth")
	public String emailAuth(@ModelAttribute("member") MemberVO member, Model model) throws Exception {
		log.info(member.getEmail() + " :  auth confrimed");
		member.setAuth(1);	// authstatus를 1로,, 권한 업데이트
		service.updateAuthstatus(member);
		
		//model.addAttribute("auth_check", 1);
		
		return "/page/home";
	}
	
	
	
	
	
	//로그인 
		@PostMapping("/login")
		public String login(MemberVO vo, HttpSession session, Model model) {
			vo = service.getMember(vo.getEmail());
			String salt = service.getSaltById(vo.getEmail());
			String password = vo.getPassword();
			int auth = service.getAuth(vo.getEmail());
			vo.setAuth(auth);
			System.out.println("member auth : " + auth);
			System.out.println("salt : " + salt);
			System.out.println("password : " + password);
			password = SHA256Util.getEncrypt(password, salt);
			vo.setPassword(password);
			System.out.println("마지막 password : " + password);
			
			service.login(vo);
			//MemberVO member = service.login(vo);
			
			//이메일 인증이 안되어있다면
			if (vo.getAuth() == 0) {
				System.out.println("===========================auth 값 : " + vo.getAuth());
				return "member/emailNotVerify";
				
				} else {
			
				System.out.println("===========================auth 값 : " + vo.getAuth());
				
				
				session.setAttribute("member", vo);
				
				System.out.println("member : " + vo);
				
				return "redirect:/";
				
				}
			
			}
		
	
	//비밀번호 수정 페이지로
	@GetMapping("/modifyPw")
	public void modifyPw() {
		
	}
	
	
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	//비밀번호 찾기 이메일 전송
	@PostMapping("findPassword")
	public String findPassword(MemberVO member) throws UnsupportedEncodingException, MessagingException {
		
		service.findPassword(member);
		
		return "redirect:/page/home";
	}
	
	
	
	
	
	//비밀번호 찾기 시 이메일에서 링크 클릭 후 변경값 적는곳 페이지 이동
	@GetMapping("/findPwEmailAuth")
	public void findPwEmailAuth(@ModelAttribute("member") MemberVO member, HttpSession session) throws Exception {
		log.info(member.getEmail());
		
		
	}
	
	//위의 변경값으로 업데이트 회원가입형식 변경값 적는 페이지에서 비밀번호 적고 실제 수정 처리
			@PostMapping("/resetPassword")
			public String resetPassword(MemberVO vo, HttpSession session, @RequestParam("modifyPassword") String modifyPassword) {
				
				String salt = service.getSaltById(vo.getEmail());
				
				String password = modifyPassword;
				password = SHA256Util.getEncrypt(password, salt);
				vo.setPassword(password);
				
				service.updatePassword(vo);
			    
				session.invalidate();
				
				return "redirect:/page/home";
			}
		
			//프로필 수정
			@PostMapping("/updateProfile")
			public String updateProfile(MemberVO member, @RequestParam("password") String getPassword, HttpSession session) {
				
				String salt = service.getSaltById(member.getEmail());
				
				String password = getPassword;
				password = SHA256Util.getEncrypt(password, salt);
				member.setPassword(password);
				
				service.updateProfile(member);
				
				session.setAttribute("member", member);
				return "/member/profile";
			}
			
			
			//프로필 수정 페이지에서 비밀번호 수정
			@PostMapping("/updatePassword")
			public String updatePassword(MemberVO member, 
					@RequestParam("modifyPassword") String modifyPassword, HttpSession session) {
				
				String salt = service.getSaltById(member.getEmail());
				
				String password = modifyPassword;
				password = SHA256Util.getEncrypt(password, salt);
				member.setPassword(password);

				service.updatePassword(member);
				
				
				session.invalidate();
				
				return "redirect:/page/home";
				
			}
			
		//회원 탈퇴 
		@PostMapping("/deleteMember")
		public String deleteMember(MemberVO vo, HttpSession session) {
			
			String salt = service.getSaltById(vo.getEmail());
			
			String password = vo.getPassword();
			password = SHA256Util.getEncrypt(password, salt);
			vo.setPassword(password);
			
			service.deleteMember(vo);
			
			session.invalidate();
			return "/page/home";
		}
	

	
	//회원 탈퇴 페이지
	@GetMapping("/deleteMember")
	public void deleteMember() {
		
	}
	

	
	//이메일 인증 x 페이지
	@GetMapping("/emailNotVerify")
	public void emailNotVerify() {

	}
	
	
	
	//ajax 
	@PostMapping("/modifyPassword")
	@ResponseBody
	public Map<Object, Object> modifyPassword(MemberVO member) {
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		String salt = service.getSaltById(member.getEmail());
		String password = member.getPassword();
//		int auth = service.getAuth(member.getEmail());
//		member.setAuth(auth);
//		System.out.println("member auth : " + auth);
		System.out.println("salt : " + salt);
		System.out.println("password : " + password);
		password = SHA256Util.getEncrypt(password, salt);
		member.setPassword(password);
		
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


	@PostMapping("/loginInterceptor")
	public String loginInterceptor(MemberVO vo, HttpSession session, Model model) {
		vo = service.getMember(vo.getEmail());
		String salt = service.getSaltById(vo.getEmail());
		String password = vo.getPassword();
		int auth = service.getAuth(vo.getEmail());
		vo.setAuth(auth);
		System.out.println("member auth : " + auth);
		System.out.println("salt : " + salt);
		System.out.println("password : " + password);
		password = SHA256Util.getEncrypt(password, salt);
		vo.setPassword(password);
		System.out.println("마지막 password : " + password);
		
		service.login(vo);
		//MemberVO member = service.login(vo);
		
		//이메일 인증이 안되어있다면
		if (vo.getAuth() == 0) {
			System.out.println("===========================auth 값 : " + vo.getAuth());
			return "member/emailNotVerify";
			
			} else {
		
			System.out.println("===========================auth 값 : " + vo.getAuth());
			
			
			session.setAttribute("member", vo);
			System.out.println("member : " + vo);
			
			return "redirect:/board/list";
			
			}
		
		}
	
	
	
	
}