package com.example.spring.microservices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@SpringBootApplication
public class SpringMicorserviceHystrixApplication {

	@Autowired
	private RestTemplate restTemplate;

	@Bean
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}
	 
	@SuppressWarnings("unchecked")
	@RequestMapping("/startClient")
	public List<String> startClient() {
		String url = "http://localhost:8888/service";
		@SuppressWarnings("rawtypes")
		Class<List> responseType = List.class;
		
		return this.restTemplate.getForObject(url, responseType);
	}	
		
	public static void main(String[] args) {
		SpringApplication.run(SpringMicorserviceHystrixApplication.class, args);
	}
}
