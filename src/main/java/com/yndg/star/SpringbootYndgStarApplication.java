package com.yndg.star;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.HiddenHttpMethodFilter;

@SpringBootApplication
public class SpringbootYndgStarApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringbootYndgStarApplication.class, args);
	}

	@Bean
	public HiddenHttpMethodFilter hiddenHttpMethodFilter(){
	    HiddenHttpMethodFilter filter = new HiddenHttpMethodFilter();
	    return filter;
	}
	
}
