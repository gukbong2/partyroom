package com.spring.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.ReservVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReservServiceTest {

	@Setter(onMethod_ = {@Autowired})
	private ReservService service;
	
	@Test 
	public void testInsert() throws ParseException {
		ReservVO reserv = new ReservVO();
		
		String startdate = "2019-08-07";
		String enddate = "2019-08-10";
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");	
			
		Date start = sdf.parse(startdate);
		Date end = sdf.parse(enddate);
		
		reserv.setBreakfast("X");
		reserv.setPrice("15000");
		reserv.setReserv_name("박비듬");
		reserv.setRoomnum("여성 도미토리");
		reserv.setStart_date(start);
		reserv.setEnd_date(end);
		
		service.insert(reserv);
		
		log.info(reserv);
	}
	
//	@Test
//	public void deleteTest() {
//		log.info("remove : " + service.remove(6L));
//	}
	
		
	
	
}
