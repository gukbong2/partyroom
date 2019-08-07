package com.spring.mapper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.velocity.tools.generic.DateTool;
import org.junit.Test;
import org.junit.experimental.theories.suppliers.TestedOn;
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
public class ReservMapperTest {

	@Setter(onMethod_ = @Autowired)
	private ReservMapper mapper;
	
//	@Test
//	public void getListTest() {
//		mapper.getList().forEach(reserv -> log.info(reserv));
//	}
	
	@Test
	public void insertTest() throws ParseException {
		ReservVO reserv = new ReservVO();
		
		String startdate = "1994-03-07";
		String enddate = "2008-03-02";
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");	
			
		Date start = sdf.parse(startdate);
		Date end = sdf.parse(enddate);
		
		reserv.setBreakfast(1L);
		reserv.setPrice("20000");
		reserv.setReserv_name("방국봉");
		reserv.setRoomnum("man");
		reserv.setStart_date(start);
		reserv.setEnd_date(end);
		
		mapper.insert(reserv);
	}
	
//	@Test
//	public void readTest() {
//		ReservVO reserv = mapper.read(3L);
//		
//		log.info("read : " + reserv);
//	}
	
	
//	@Test
//	public void deleteTest() {
//		log.info("delete : " + mapper.delete(2L));
//	}
	
}
