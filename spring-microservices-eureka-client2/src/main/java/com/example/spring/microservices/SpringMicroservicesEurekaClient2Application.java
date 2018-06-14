package com.example.spring.microservices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.netflix.appinfo.InstanceInfo;
import com.netflix.discovery.EurekaClient;

@RestController
@EnableEurekaClient
@SpringBootApplication
public class SpringMicroservicesEurekaClient2Application {

	@Autowired
	private EurekaClient client;

	@RequestMapping("/serviceinfo")
	public String serviceInfo() {
		String virtualHostname = "MyClient"; // App client 1 name
		Boolean secure = false; // Secure access
		InstanceInfo instance = client.getNextServerFromEureka(virtualHostname, secure);
		
		return instance.getHomePageUrl().toString();
	}
	
	
	public static void main(String[] args) {
		SpringApplication.run(SpringMicroservicesEurekaClient2Application.class, args);
	}
}