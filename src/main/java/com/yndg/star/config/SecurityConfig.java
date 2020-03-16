package com.yndg.star.config;


import java.io.IOException;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;

import com.yndg.star.model.user.MyUserDetails;

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
		auth.authenticationProvider(new AuthenticationProvider() {
			
			@Override
			public boolean supports(Class<?> authentication) {
				return true;
			}
			
			@Override
			public Authentication authenticate(Authentication authentication) throws AuthenticationException {
				
				String username = (String) authentication.getPrincipal();
				String password = (String) authentication.getCredentials();
				MyUserDetails user = (MyUserDetails) userDetailsService.loadUserByUsername(username);
				
				if(!matchPassword(password, user.getPassword())) {
		            throw new BadCredentialsException(username);
		        }

				return new UsernamePasswordAuthenticationToken(username, password, user.getAuthorities());
			}

			private boolean matchPassword(String loginPassword, String password2) {
				
				return loginPassword.equals(password2);
			}
		});
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
//		http.csrf().disable();
		http.csrf().csrfTokenRepository(new CookieCsrfTokenRepository());
		http.authorizeRequests() // request 요청을
				.antMatchers("/board/list", "/user/profile") // 이 주소는 인증해야한다
				
				.authenticated().antMatchers("/admin/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_MANAGER')")
				.anyRequest().permitAll()

				.and()
				.formLogin()
				.loginPage("/login")
				.loginProcessingUrl("/login") // post 만 낚아챔
//				.failureHandler(new AuthenticationFailureHandler() {
//					
//					@Override
//					public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
//							AuthenticationException exception) throws IOException, ServletException {
//						String errormsgname = null;
//						String errormsg = null;
//						
//						 if(exception instanceof BadCredentialsException) {
//					            errormsg = MessageUtils.getMessage("error.BadCredentials");
//					        } else if(exception instanceof InternalAuthenticationServiceException) {
//					            errormsg = MessageUtils.getMessage("error.BadCredentials");
//					        } else if(exception instanceof DisabledException) {
//					            errormsg = MessageUtils.getMessage("error.Disaled");
//					        } else if(exception instanceof CredentialsExpiredException) {
//					            errormsg = MessageUtils.getMessage("error.CredentialsExpired");
//					        }
//						 	request.setAttribute(errormsgname, errormsg);
//						 
//					        request.getRequestDispatcher("/login").forward(request, response);
//
//						 
//					}
//				})
				
				.successHandler(new AuthenticationSuccessHandler() {
					
					@Override
					public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
							Authentication authentication) throws IOException, ServletException {
						
						String username = request.getParameter("username");
						String rememberMe = Optional.ofNullable(request.getParameter("rememberMe")).orElse("off");
//						System.out.println(rememberMe);
//						System.out.println("usernameCookie" + username);
						if(rememberMe.equals("on")) {
							Cookie cookie = new Cookie("usernameCookie", username);
							cookie.setMaxAge(60*60);
							response.addCookie(cookie);
							response.sendRedirect("/explore");
						}else {
							Cookie cookie = new Cookie("usernameCookie", "");
							cookie.setMaxAge(0);
							response.addCookie(cookie);
							response.sendRedirect("/explore");
						}
						
						
					}
				})
//				.defaultSuccessUrl("/board/myList", true) // successHandler를 사용할 수 있음
				
				.and()
				.rememberMe()
				.rememberMeCookieName("login")
				.rememberMeParameter("autoLogin");
				
		
		
		http.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/login")
			.deleteCookies("usernameCookie")
			.invalidateHttpSession(true);
		

	}
}
