package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/reserv/*")
@Log4j
@AllArgsConstructor
@Controller
public class ReservController {

	
	@GetMapping(value="/reservPage")
	public void reservPage() {
	
	}
	
	@PostMapping("/payment")
	public void payment() {
		
	}
	
}

