package com.example.spring.microservices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class SpringH2MarcApplication {

	@Autowired
	StudentRepository repository;
		
	@RequestMapping("/all-students")
	public List<Student> allStudents() {

		List<Student> students = repository.findAll();
		
		for(Student student : students) {
			System.out.println("-> " + student);
		}
		
		return students;
	}
	
	@RequestMapping("/one-student")
	public Student oneStudent() {
		List<Student> students = repository.findAll();
		System.out.println(students.get(0).getName());
		
		return students.get(0);
	}
		
	public static void main(String[] args) {
		SpringApplication.run(SpringH2MarcApplication.class, args);
	}
}

// http://localhost:8080/h2-console
// http://localhost:8080/students
// http://localhost:8080/students/10001
// http://localhost:8080/all-students
