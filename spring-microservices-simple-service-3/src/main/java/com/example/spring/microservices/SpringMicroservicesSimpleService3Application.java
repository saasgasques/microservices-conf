package com.example.spring.microservices;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class SpringMicroservicesSimpleService3Application {

	@RequestMapping("/execute")
	public String execute() {
		return "Executed...";
	}
	
	public static void main(String[] args) {
		SpringApplication.run(SpringMicroservicesSimpleService3Application.class, args);
	}
}
