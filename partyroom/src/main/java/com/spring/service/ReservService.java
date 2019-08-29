package com.spring.service;

import java.util.List;

import com.spring.domain.Criteria;
import com.spring.domain.ReservVO;

public interface ReservService {
	
	public void insert(ReservVO reserv);
	
	public ReservVO get (Long reserv_idx);
	
	public boolean remove(Long reserv_idx);
	
	public List<ReservVO> getList(Criteria cri);
	
	public boolean modify(ReservVO reserv);

	public void getMyReservation(ReservVO reserv);
	
	
	
}
