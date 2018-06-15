package com.example.spring.microservices;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixProperty;

//@EnableCircuitBreaker
@EnableHystrix
@EnableHystrixDashboard
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
	@HystrixCommand(fallbackMethod="failover", commandProperties= {
		@HystrixProperty(name="execution.isolation.thread.timeoutInMilliseconds", value="500")	
	})
//	public List<String> startClient() {
	public List<String> startClient(@RequestParam long time) throws InterruptedException {
		System.out.println("-> Sleeping " + time + "ms");
		Thread.sleep(time);
		
		String url = "http://localhost:8888/service";
		@SuppressWarnings("rawtypes")
		Class<List> responseType = List.class;
		
		return this.restTemplate.getForObject(url, responseType);
	}	
	
//	public List<String> failover() {
	public List<String> failover(long time) {
		return Arrays.asList("Default1", "Default2");
	}
		
	public static void main(String[] args) {
		SpringApplication.run(SpringMicorserviceHystrixApplication.class, args);
	}
}
