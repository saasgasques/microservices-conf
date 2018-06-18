package com.example.spring.microservices;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

@EnableZuulProxy 
@SpringBootApplication
public class SpringMicroservicesZuulApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringMicroservicesZuulApplication.class, args);
	}
}
