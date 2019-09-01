package com.spring.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.MemberVO;
import com.spring.domain.ReservVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	
	private ReservMapper reservmapper;
	
//	@Test
//	public void testRegister() {
//		MemberVO member = new MemberVO();
//		
//		member.setEmail("junyeon2@gmail.com");
//		member.setPassword("a4134145");
//		member.setName("방국봉");
//		
//		log.info(member);
//		
//		mapper.insertSelectKey(member);
//	}
//	
//	@Test
//	public void testDelete() {
//		log.info("========DELETE COUNT : " + mapper.delete(5L));
//	}
	
//	@Test
//	public void getSaltById() {
//		MemberVO member = new MemberVO();
//		
//		member.setEmail("czcz");
//	
//		log.info(member);
//		mapper.getSaltById(member.getEmail());
//	}
//	
	
//	@Test
//	public void deleteMember() {
//		MemberVO member = new MemberVO();
//		
//		member.setEmail("angkimozee@gmail.com");
//		member.setPassword("dkdrlahWL");
//		
//		log.info(member);
//		mapper.deleteMember(member);
//	}
	
	@Test
	public void getReserv() {
		
		ReservVO reserv = new ReservVO();
		MemberVO member = new MemberVO();
		
		reserv.setReserv_email("junyeon2459@gmail.com");
		reserv.setReserv_name("이준연");
		member.setEmail("junyeon2459@gmail.com");
		member.setName("이준연");
		//reservmapper.getMyReservation(reserv);
	}
	
}
