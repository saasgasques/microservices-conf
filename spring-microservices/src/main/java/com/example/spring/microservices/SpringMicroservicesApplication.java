package com.example.spring.microservices;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
@ImportResource("/simple-context.xml")
//@Import(DemoConfiguration.class) replaced with @Configuration in the original class
public class SpringMicroservicesApplication {

	
	// OVERWRITE CONFIGURATION
//	
//	@Bean
//	public ServletRegistrationBean registration() {
//		ServletRegistrationBean registration = new ServletRegistrationBean(dispatcherServlet(), "/servlet/*");
//		registration.setName(DispatcherServletAutoConfiguration.DEFAULT_DISPATCHER_SERVLET_BEAN_NAME);
//		return registration;
//	}
		
	@Autowired
	@Resource(name="cats")
	public List<String> cats;
	
	@Autowired
	@Resource(name="circus")
	public List<String> circus;
	
//	@Bean
//	public List<String> cats() {
//		return Arrays.asList("Bengal", "Lion");
//	}
		
	@RequestMapping("/")
	public String hello() {
		return "Hello World! \n";
	}
	
	@RequestMapping("/cats")
	public String gats() {
		return String.join(", ", cats);
	}
	
	@RequestMapping("/circus")
	public String circ() {
		return String.join(", ", circus);
	}
	
	public static void main(String[] args) {
		SpringApplication.run(SpringMicroservicesApplication.class, args);
	}
}
