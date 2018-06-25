package com.example.spring.microservices;

import java.security.Principal;

import javax.sql.DataSource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.provider.token.RemoteTokenServices;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JdbcTokenStore;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@EnableResourceServer
@EnableGlobalMethodSecurity(prePostEnabled=true)
@RestController
@SpringBootApplication
public class SpringMicroservicesOauthResourceApplication {

	@PreAuthorize("hasRole('ADMIN')")
	@RequestMapping("/resource/endpoint")
	public String endpoint(Principal principal) {
		return "Welcome" + principal.getName() + ", This message is protected by the resource server.";
	}
	
	@Bean
	@Primary
	public RemoteTokenServices tokenService() {
		RemoteTokenServices srv = new RemoteTokenServices();
		srv.setCheckTokenEndpointUrl("http://localhost:9090/oauth/check_token");
		srv.setClientId("resource1");
		srv.setClientSecret("secret");
		
		return srv;
	}
	
	@Bean
	public TokenStore tokenStore() {
		return new JdbcTokenStore(dataSource());
	}
	
	@Bean
	public DataSource dataSource() {		
		DriverManagerDataSource ds = new DriverManagerDataSource();
		ds.setDriverClassName("org.hsqldb.jdbcDriver");
		ds.setUrl("jdbc:hsqldb:hsql://localhost/testdb");
		ds.setUsername("SA");
		ds.setPassword("");
		
		return ds;
	}
	
	public static void main(String[] args) {
		SpringApplication.run(SpringMicroservicesOauthResourceApplication.class, args);
	}
}
