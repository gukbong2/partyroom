package com.spring.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.BoardVO;
import com.spring.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
//	@Test
//	public void getBoardList() {
//		mapper.getList().forEach(board -> log.info(board));
//	}
//	
//	@Test
//	public void testInsert() {
//		BoardVO board = new BoardVO();
//		
//		board.setTitle("안녕하세요");
//		board.setContent("반가워요");
//		board.setWriter("방국봉");
//		
//		mapper.insert(board);
//		
//		log.info("======== board : " + board);
//	}
	
//	@Test
//	public void testInsertSelectKey() {
//		BoardVO board = new BoardVO();
//		
//		board.setTitle("안녕하세요");
//		board.setContent("반가워요");
//		board.setWriter("방국봉");
//		
//		mapper.insertSelectKey(board);
//		
//		log.info("======= board : " + board);
//	}
	
//	@Test
//	public void testRead() {
//		BoardVO board = mapper.read(5L);
//		
//		log.info("=================Read=================== : " + board);
//	}
	
//	@Test
//	public void testDelete() {
//		log.info("========DELETE COUNT : " + mapper.delete(5L));
//	}
	
//	@Test
//	public void testUpdate() {
//		BoardVO board = new BoardVO();
//		
//		board.setBno(4L);
//		board.setTitle("수정된 제목");
//		board.setContent("수정된 내용");
//		board.setWriter("박비듬");
//		
//		int count = mapper.update(board);
//		log.info("UPDATE COUNT " + count);
//	}
	
//	@Test
//	public void testPaging() {
//		Criteria cri = new Criteria();
//		
//		cri.setPageNum(3);
//		cri.setAmount(10);
//		
//		List<BoardVO> list = mapper.getListWithPaging(cri);
//		
//		list.forEach(board -> log.info(board.getBno()));
//	}
	
	
	
	
}
