package com.spring.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public void reservCheckPage(Model model, 
			
			@RequestParam("start_date") String start_date,
			@RequestParam("end_date") String end_date,
			@RequestParam("roomnum") String roomnum,
			@RequestParam("breakfast") String breakfast,
			@RequestParam("reserv_name") String reserv_name,
			@RequestParam("count") Long count) throws ParseException {
		
	
		
		ReservVO reserv = new ReservVO();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date start = sdf.parse(start_date);
		Date end = sdf.parse(end_date);
		
		reserv.setBreakfast(breakfast);
		reserv.setReserv_name(reserv_name);
		reserv.setRoomnum(roomnum);
		reserv.setStart_date(start);
		reserv.setEnd_date(end);
		reserv.setCount(count);
		model.addAttribute("reserv", reserv);
	}
	
}

