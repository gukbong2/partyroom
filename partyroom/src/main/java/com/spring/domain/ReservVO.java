package com.spring.domain;

import java.util.Date;

import lombok.Data;
@Data
public class ReservVO {

	private Long reserv_idx;
	private Long breakfast;
	private String price;
	private String roomnum;
	private String reserv_name;
	private Date start_date;
	private Date end_date;
	
	
}
