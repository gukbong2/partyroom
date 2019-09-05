package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.ReservVO;

public interface ReservService {
	
	public void insert(ReservVO reserv);
	
	public ReservVO get (Long reserv_idx);
	
	public boolean remove(Long reserv_idx);
	
	public boolean modify(ReservVO reserv);

	public ReservVO getMyReservation(String reserv_email);

	public List<ReservVO> getList(ReservVO reserv);

	
	
	
}
