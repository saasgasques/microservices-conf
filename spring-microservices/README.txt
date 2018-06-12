https://www.safaribooksonline.com/library/view/building-microservices-with/9781491977101/video296214.html
https://www.safaribooksonline.com/library/view/building-microservices-with/9781491977101/video296216.html
# MICROSERVICES
https://www.safaribooksonline.com/library/view/building-microservices-with/9781491977101/video296218.html
https://www.safaribooksonline.com/library/view/building-microservices-with/9781491977101/video296220.html


#########
# CREATE 
Default settings, add web nature.

###################
# RUN FROM ECLIPSE
Boot Dashboard

#################
# RUN FROM MAVEN
$ export MAVEN_OPTS=-Xmx1024m
$ mvn spring-boot:run
$ mvn spring-boot:stop
$ mvn package
$ lsof -i -n -P | grep java
$ kill -9 9209

################
# RUN FROM JAVA
$ mvn package
$ java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8000,suspend=n \
       -jar target/myapplication-0.0.1-SNAPSHOT.jar

#######################
# ADD REST CONTROLLERS
"SpringMicroservicesApplication"

@RestController // Class annotation 
@RequestMapping("/") // Method annotation
public String hello() {
	return "Hello World! \n";
}

$ curl http://localhost:8080

###################
# OVERRIDE DEFAULT 
"application.properties"
server.servlet.context-path=/app

"application.yml"
server:
  port: 9090
  
###############  
# DECLARE BEAN
@Autowired
@Resource(name="cats")
public List<String> cats;

@Bean
public List<String> cats() {
	return Arrays.asList("Bengal", "Lion");
}

@RequestMapping("/cats")
public String gats() {
	return String.join(", ", cats);
}

############################
# EXTERNALIZE CONFIGURATION (BEANS)
Move from "SpringMicroservicesApplication" to "DemoConfiguration.java"
@Bean
public List<String> cats() {
	return Arrays.asList("Bengal", "Lion");
}
And add annotation to "SpringMicroservicesApplication" at class level
@Import(DemoConfiguration.class)

Replace the import with this annotation at class level in "DemoConfiguration.java" 
@Configuration

###########################
# IMPORT XML CONFIGURATION (BEANS)
Create resource spring bean file "simple-context.xml" in the resources folder
Enable util namespace in the "simple-context.xml" file view on namespaces tab
<util:list id="circus">
	<value>Tiger</value>
	<value>Beard</value>
</util:list>

@Autowired
@Resource(name="circus")
public List<String> circus;

@RequestMapping("/circus")
public String circ() {
	return String.join(", ", circus);
}

###################
# ADD DEPENDENCIES
"pom.xml" :: Depencies tab :: Add org.springframework.security spring-security-code
Remove previous and add spring boot dependency org.springframework.boot spring-boot-starter-security

Run de application and get the security token from the console user / dba2776a-dc6b-43aa-b540-7a268e8dc621
"Using generated security password: dba2776a-dc6b-43aa-b540-7a268e8dc621"
The security is instantiated via auto configuration

################################
# AUTOCONFIGURATION OVERWRITING
Servlet: org.springframework.boot.autoconfigure.web.servlet.DispatcherServletAutoConfiguration
Method: dispatcherServletRegistration 

In "SpringMicroservicesApplication" add overwritting beans

@Bean
public DispatcherServlet dispatcherServlet() {
	return new DispatcherServlet();
}

@Bean
public ServletRegistrationBean registration() {
	ServletRegistrationBean registration = new ServletRegistrationBean(dispatcherServlet(), "/servlet/*");
	registration.setName(DispatcherServletAutoConfiguration.DEFAULT_DISPATCHER_SERVLET_BEAN_NAME);
	return registration;
}

curl http://localhost:9090/app/servlet/cats

--------------------------------------------------------------------------
TODO: Video 9 of 58 from Building Microservices with Spring


