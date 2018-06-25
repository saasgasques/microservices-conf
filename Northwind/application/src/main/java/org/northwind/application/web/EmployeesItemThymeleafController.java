package org.northwind.application.web;
import io.springlets.web.mvc.util.concurrency.ConcurrencyManager;
import org.northwind.model.Employee;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;

/**
 * = EmployeesItemThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Employee.class, type = ControllerType.ITEM)
@RooThymeleaf
public class EmployeesItemThymeleafController implements ConcurrencyManager<Employee> {
}
