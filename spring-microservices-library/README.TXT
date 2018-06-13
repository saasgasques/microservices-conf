https://www.safaribooksonline.com/library/view/building-microservices-with/9781491977101/video296221.html
https://www.safaribooksonline.com/library/view/building-microservices-with/9781491977101/video296222.html
https://www.safaribooksonline.com/library/view/building-microservices-with/9781491977101/video296226.html
https://www.safaribooksonline.com/library/view/building-microservices-with/9781491977101/video296228.html
https://www.safaribooksonline.com/library/view/building-microservices-with/9781491977101/video296231.html
https://www.safaribooksonline.com/library/view/building-microservices-with/9781491977101/video296232.html
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
Add @RefreshScope annotations to the "SpringMicroservicesConfigClientApplication" and hit the actuator refresh with a post.
Expose the /refresh with the actuator in the appplication.properties
management.endpoints.web.exposure.include=refresh

$ curl http:/localhost:9999/message
$ curl -X POST http://localhost:9999/actuator/refresh
$ curl http:/localhost:9999/message

#############
# ENCRYPTION
JCE java 8 unlimited strength
$ locate jdk
$ cd /usr/lib/jvm/java-8-oracle 
$ cd /usr/lib/jvm/java-8-oracle/jre/lib/security
Backup local-policy and export-policy and install new jars.

/*
$ java -version

Java(TM) SE Runtime Environment (build 1.8.0_161-b12)

$ cat java.security | grep crypto

2.  If the "crypto.policy" property is not set and the traditional
#     and the "crypto.policy" Security property is not defined,
#     crypto.policy=unlimited)
*/

Set encryption on the server "application.properties" NOPE it must be placed in the "bootstrap.properties"
encrypt.key=secret

$ curl http://localhost:8888/encrypt -d Kevin
aeea544db95558311246bb1c2dc8a9fe3e509510a039641b10f69c92d88a5994
$ curl http://localhost:8888/decrypt --data-urlencode aeea544db95558311246bb1c2dc8a9fe3e509510a039641b10f69c92d88a5994
Kevin

Update "config-client-development.properties" in github and replace plain text
#message=Hello World! Spring Works 7!
message={cipher}aeea544db95558311246bb1c2dc8a9fe3e509510a039641b10f69c92d88a5994

$ curl http:/localhost:9999/message 
Kevin

################################
# Eureka, Hystrix, Ribbon, Zuul

################
# EUREKA SERVER
spring-microservice-eureka-server
Starter Eureka Server change to starter 1.5.13.RELEASE to avoid rxjava-1.3.8.jar error

Add @EnableEurekaServer annotation to "SpringMicroserviceEurekaServerApplication"

Add properties to "application.properties"
server.port=8761
eureka.client.register-with-eureka=false // do not allow a client to register
eureka.client.fetch-registry=false // do not fetch other registries information

Navigate to localhost:8761


mvn dependency:tree
mvn clean
mvn package

Archive for required library: '/home/ester/.m2/repository/io/reactivex/rxjava/1.3.8/rxjava-1.3.8.jar' 
in project 'spring-microservice-eureka-server' cannot be read or is not a valid ZIP file	
spring-microservice-eureka-server		Build path	Build Path Problem









