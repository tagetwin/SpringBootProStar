package com.yndg.star.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration // 메모리에 띄우기
@EnableWebSecurity // 필터로 등록
@EnableGlobalMethodSecurity(prePostEnabled = true) // 진입직전에 낚아챈다
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Bean
	public BCryptPasswordEncoder encode() { // 비밀번호 암호
		return new BCryptPasswordEncoder();
	}
	
	@Autowired
	private UserDetailsService userDetailsService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(encode());
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring()
			 .antMatchers("/resources/**")
	         .antMatchers("/css/**")
	         .antMatchers("/vendor/**")
	         .antMatchers("/js/**")
	         .antMatchers("/favicon*/**")
	         .antMatchers("/img/**");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception { // http 를 관리
		http.csrf().disable();

		http.authorizeRequests() // request 요청을
				.antMatchers("/user/profile", "/post/write/**", "/post/delete/**", "/post/update/**") // 이
																															// 주소는
																															// .
																															// 인증해야한다.
				.authenticated().antMatchers("/admin/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_MANAGER')")
				.anyRequest().permitAll()

				.and()
				.formLogin()
				.loginPage("/login")
				.loginProcessingUrl("/login") // post 만 낚아챔
				.failureUrl("/login")
				.defaultSuccessUrl("/board/myList", true); // successHandler를 사용할 수 있음
		http.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/login")
			.invalidateHttpSession(true);
		

	}
}
