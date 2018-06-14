package com.example.spring.microservices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class ExampleController {
	
	@Autowired
	private RestTemplate restTemplate;
	
	@RequestMapping("execute")
	public String execute() {
		String url = "http://MYCLIENT2/serviceinfo";
		Class<String> responseType = String.class;
		
		return this.restTemplate.getForObject(url, responseType);
	}
}
