package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Criteria;
import com.spring.domain.ReservVO;
import com.spring.mapper.ReservMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
@Service
@AllArgsConstructor
public class ReservServiceImpl implements ReservService{

	@Setter(onMethod_ = @Autowired)
	private ReservMapper mapper;
	
	@Override
	public void insert(ReservVO reserv) {
		mapper.insert(reserv);
	}

	@Override
	public ReservVO get(Long reserv_idx) {
		return mapper.read(reserv_idx);
	}

	@Override
	public boolean remove(Long reserv_idx) {
		return mapper.delete(reserv_idx) == 1;
	}


	@Override
	public boolean modify(ReservVO reserv) {
		return mapper.update(reserv) == 1;
	}

	@Override
	public ReservVO getMyReservation(String reserv_email) {
		// TODO Auto-generated method stub
		return mapper.getMyReservation(reserv_email);
	}

	@Override
	public List<ReservVO> getList(ReservVO reserv) {
		// TODO Auto-generated method stub
		return mapper.getList(reserv);
	}


}
