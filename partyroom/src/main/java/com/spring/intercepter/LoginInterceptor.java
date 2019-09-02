package com.spring.intercepter;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		log.info("pre handle");
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member") == null) {
			System.out.println("member null");
			saveDest(request);
			
			response.sendRedirect("/member/login");
			return false;
		} else {
			return true;
		}
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView mav) throws Exception {
		log.info("post handle");
		
		HttpSession session = request.getSession();
		
		ModelMap modelMap = mav.getModelMap();
		
		Object member = modelMap.get("member");
		
		if(member != null) {
			log.info("login success");
			session.setAttribute("LOGIN", member);
			
			Object dest = session.getAttribute("dest");
			
			response.sendRedirect(dest != null ? (String)dest:"/");
			//response.sendRedirect("/board/register");
		}
	
	}
	
	
		
	private void saveDest(HttpServletRequest request) {
		String uri = request.getRequestURI();
		
		String query = request.getQueryString();
		
		if(query == null || query.contentEquals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
		if (request.getMethod().equals("GET")) {
			log.info("dest : " + (uri + query));
			request.getSession().setAttribute("dest", uri + query);
			
		}
	}
	

	
	
}
