package com.spring.mapper;

import java.util.List;

import com.spring.domain.ReservVO;

public interface ReservMapper {

	public List<ReservVO> getList();
	
	public void insert(ReservVO reserv);
	
	public ReservVO read(Long reserv_idx);
	
	public int delete(Long reserv_idx);
	
	public int update(ReservVO reserv);

	public ReservVO getMyReservation(String reserv_email);
	
	
	
}
