package com.yndg.star.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.yndg.star.model.user.User;
import com.yndg.star.repository.UserRepository;

@Service
public class MyUserDetailService implements UserDetailsService {
	
	@Autowired
	UserRepository userRepository;
	
	private User user;
	
	public User getPrincipal() {
		return user;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		user = userRepository.authentication(username);
	
		if(user == null) {
			throw new UsernameNotFoundException("유저네임을 찾을 수 없습니다.");
		}
		
		return user;
	}


	
	
	
}
