https://www.safaribooksonline.com/library/view/building-microservices-with/9781491977101/video296221.html
https://www.safaribooksonline.com/library/view/building-microservices-with/9781491977101/video296222.html
https://www.safaribooksonline.com/library/view/building-microservices-with/9781491977101/video296226.html
https://resources.oreilly.com/examples/0636920061946/tree/master/Building%20Microservices%20with%20Spring%20-%20Working%20Files/Chapter%203/Microservice%20Demonstration/Library%20Start/src/main/java/com/oreilly/cloud

###########
# NAVIGATE
$ curl http://localhost:8080/book.html
$ curl http://localhost:8080/book/search/title?title=1984
$ curl http://localhost:8080/book/2

MONOLITH 
spring-micorservices-library

MICROSERVICES 
spring-microservices-catalog
Starter : jpa+h2+rest repositories

Move Book, BookRepository and data.sql from "spring-microservices-library" to "spring-microservices-catalog"

"catalog"."application.properties"
server.port=9090

$ curl http://localhost:9090/book/2

################
# COMMUNICATION
Create a new class BookController in "library" to communicate to "catalog"

#######################
# CONFIGURATION SERVER
"spring-microservices-config-server"
Cloud Config:Config Server

In github "microservices-conf" crete the file "config-client-development.properties"
projetc "config-client" and profile "development"
https://github.com/saasgasques/microservices-conf.git

Edit "config-client-development.properties" and add a message=Hello World!

Edit "application.properties" and set (it could be a C:\local\mmmm.git)
	spring.cloud.config.server.git.uri=https://github.com/saasgasques/microservices-conf.git
	server.port=8888
	
##############################	
# ENABLE CONFIGURATION SERVER
Add @EnableConfigServer annotation to the SpringMicroservicesConfigServerApplication

$ curl http://localhost:8888/actuator/health
$ curl http://localhost:8888/config-client-development.properties
$ curl http://localhost:8888/config-client-development.json

##############################
# CREATE CONFIGURATION CLIENT
"spring-microservices-config-client"
Config Client + Web + Actuator

Define port on the application.properties
server.port=9999

Add to "SpringMicroservicesConfigClientApplication" @RestController at command level and add an attribute

@Value("${message}")
private String message; 

@RequestMapping("/message")
public String message() {
	return this.message;
}

Edit "bootstrap.properties" and define the profile
spring.profiles.active=development
spring.application.name=config-client
spring.cloud.config.uri=http://localhost:8888

$ curl http:/localhost:9999/message

##############
# ADD REFRESH
Add @RefreshScope annotations to the "SpringMicroservicesConfigClientApplication" and hit the actuator refresh with a post
$ curl --data '' http://localhost:8888/refresh
$ curl http://localhost:8888/actuator/refresh
$ curl --data '' http://localhost:9999/refresh
$ curl http:/localhost:9999/message



