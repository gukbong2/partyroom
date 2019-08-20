package com.spring.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.domain.ReservVO;
import com.spring.service.ReservService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/reserv/*")
@Log4j
@AllArgsConstructor
@Controller
public class ReservController {

	private ReservService service;
	
	//첫번째 페이지로 이동
	@GetMapping(value="/reservPage")
	public void reservPage() {
	
	}
	//예약내역 확인
	@GetMapping("/CheckReserv")
	public void reservCheckPage(HttpSession session, 
			@RequestParam("start_date") String start_date,
			@RequestParam("end_date") String end_date,
			@RequestParam("breakfast") String breakfast,
			@RequestParam("reserv_name") String reserv_name,
			@RequestParam("count") Long count,
			@RequestParam("male") Long male,
			@RequestParam("female") Long female,
			@RequestParam("price") Long price,
			@RequestParam("time_idx") Long time_idx,
			@RequestParam("reserv_email") String reserv_email
			) throws ParseException {
		
		
		
		ReservVO reserv = new ReservVO();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date start = sdf.parse(start_date);
		Date end = sdf.parse(end_date);
		
		long calDate = start.getTime() - end.getTime();
		
		long calDateDays = calDate / (24 * 60 * 60 * 1000);
		
		calDateDays = Math.abs(calDateDays);
		
		System.out.println("체크아웃 날짜 - 체크인 날짜 : " + calDateDays);
		System.out.println("price : " + price);
		System.out.println("남성인원 : " + male);
		System.out.println("여성인원 : " + female);
		System.out.println("인원총합 : " + count);
		
		
		//count = male + female;
		price = price * calDateDays * count;
		System.out.println("인원*날짜*가격 : " + price);
		reserv.setBreakfast(breakfast);
		reserv.setReserv_name(reserv_name);
		reserv.setStart_date(start);
		reserv.setEnd_date(end);
		reserv.setCount(count);
		reserv.setReserv_email(reserv_email);
		
		reserv.setMale(male);
		reserv.setFemale(female);
		System.out.println("정기권 : " + time_idx);
		
		if (time_idx == 1) {
			reserv.setTime_idx(time_idx);
			reserv.setPrice(price);
			reserv.setTicket("정기권 사용안함");
		} else if (time_idx == 2) {
			long discount = count * 3;
			price = (long) (price - discount);
			System.out.println("5일 정기권  3달러 할인 x 인원수 : " + price);
			reserv.setTime_idx(time_idx);
			reserv.setPrice(price);
			reserv.setTicket("5일 정기권");
		} else if (time_idx == 3) {
			long discount = count * 6;
			price = (long) (price - discount);
			System.out.println("1주일 정기권  6달러 할인 x 인원수: " + price);
			reserv.setTime_idx(time_idx);
			reserv.setPrice(price);
			reserv.setTicket("1주 정기권");
		} else if (time_idx == 4) {
			long discount = count * 10;
			price = (long) (price - discount);
			System.out.println("2주 정기권 10달러 할인 x 인원수 : " + price);
			reserv.setTime_idx(time_idx);
			reserv.setPrice(price);
			reserv.setTicket("2주 정기권");
		} 
		session.setAttribute("reserv", reserv);
		
	
		
	}
	
	@GetMapping("/paypal")
	public void paypal(HttpSession session) {
		session.getAttribute("reserv");
		session.getAttribute("member");
	}
	
	
	@GetMapping("/confirm")
	public void confirm(HttpSession session) throws ParseException {
		

		ReservVO vo = (ReservVO) session.getAttribute("reserv");
		service.insert(vo);
		
	}
}

