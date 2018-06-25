package com.example.spring.microservices;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
//@EnableResourceServer
@EnableAuthorizationServer
@SpringBootApplication
//@EnableGlobalMethodSecurity(prePostEnabled=true)
public class SpringMicroservicesOauthServerApplication {

//	@PreAuthorize("hasRole('ADMIN')")
//	@RequestMapping("/resource/endpoint")
//	public String endpoint() {
//		return "This message is protected by the resource server.";
//	}
	
	public static void main(String[] args) {
		SpringApplication.run(SpringMicroservicesOauthServerApplication.class, args);
	}
}