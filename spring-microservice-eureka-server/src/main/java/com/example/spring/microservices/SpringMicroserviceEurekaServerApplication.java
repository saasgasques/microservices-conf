package com.example.spring.microservices;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;


@EnableEurekaServer
@SpringBootApplication
public class SpringMicroserviceEurekaServerApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(SpringMicroserviceEurekaServerApplication.class, args);
	}
}
