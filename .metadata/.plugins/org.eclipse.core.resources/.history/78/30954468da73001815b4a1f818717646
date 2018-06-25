package com.example.spring.microservices;

import java.net.URI;
import java.net.URISyntaxException;
import java.security.Principal;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.http.RequestEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.client.DefaultOAuth2ClientContext;
import org.springframework.security.oauth2.client.OAuth2RestTemplate;
import org.springframework.security.oauth2.client.resource.OAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.client.token.AccessTokenRequest;
import org.springframework.security.oauth2.client.token.grant.password.ResourceOwnerPasswordResourceDetails;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableOAuth2Client;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@EnableOAuth2Client
@RestController
@SpringBootApplication
public class SpringMicroservicesOauthClientApplication {

	@Autowired
	private OAuth2RestTemplate restTemplate;
	
	@Bean
	public OAuth2RestTemplate restTemplate() {
//		return new OAuth2RestTemplate(resource(), new DefaultOAuth2ClientContext());
		
		OAuth2RestTemplate template = new OAuth2RestTemplate(resource(), new DefaultOAuth2ClientContext());
		template.setInterceptors(Collections.singletonList(new RequestResponseLoggingInterceptor()));
		
		return template;
	}
	
	@Bean
	protected OAuth2ProtectedResourceDetails resource() {
		ResourceOwnerPasswordResourceDetails details = new ResourceOwnerPasswordResourceDetails();
		details.setAccessTokenUri("http://localhost:9090/oauth/token");
		details.setClientId("webapp");
		details.setClientSecret("websecret");
		details.setGrantType("password");

		return details;
	}
	
	@RequestMapping("/execute")
	public String execute(Principal principal) throws URISyntaxException {
		
		System.out.println("-> Execute IN");
		
		User user = (User)((Authentication)principal).getPrincipal();
		//URI uri = new URI("http://localhost:9090/resource/endpoint");
		URI uri = new URI("http://localhost:7070/resource/endpoint"); // Set the endpoint in the resource server
		RequestEntity<String> request = new RequestEntity<String>(HttpMethod.POST, uri);
		
		// Set basic user/password token
		AccessTokenRequest accessTokenRequest = this.restTemplate.getOAuth2ClientContext().getAccessTokenRequest();
		accessTokenRequest.set("username", user.getUsername());
		accessTokenRequest.set("password", user.getPassword());
		
		System.out.println("-> Username:"+user.getUsername()+" Password:"+user.getPassword());
		
		return restTemplate.exchange(request, String.class).getBody();
	}
	
	public static void main(String[] args) {
		SpringApplication.run(SpringMicroservicesOauthClientApplication.class, args);
	}
}
