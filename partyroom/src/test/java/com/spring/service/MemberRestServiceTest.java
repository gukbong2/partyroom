package com.spring.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberRestServiceTest {
	@Setter(onMethod_ = {@Autowired})
	private MemberRestService service;

	@Test
	public void idCheck() {
		log.info(service.idCheck("junyeon2459@gmail.com"));
		
	}
	

}
