package com.spring.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.maven.doxia.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.api.NaverLoginBO;
import com.spring.service.SocialService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
public class HomeController {
	
	@Setter(onMethod_ = @Autowired)
	private SocialService service;
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		//model.addAttribute("url", naverAuthUrl);
		session.setAttribute("url", naverAuthUrl);
		session.setAttribute("urlboard", naverAuthUrl);
		session.getAttribute("result2");
		/* 생성한 인증 URL을 View로 전달 */
		
		return "/page/home";

	}
	
	@GetMapping("/doA")
	public String doA(Locale locale, Model model) {
		log.info("doA");
		return "/page/home";
	}
	
	@GetMapping("/doB")
	public String doB(Locale locale, Model model) {
		log.info("doB");
		model.addAttribute("result", "doB result");
		return "/page/home";
	}
	
	
	
}