package org.northwind.application.web;
import io.springlets.web.mvc.util.concurrency.ConcurrencyManager;
import org.northwind.model.Customer;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;

/**
 * = CustomersItemThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Customer.class, type = ControllerType.ITEM)
@RooThymeleaf
public class CustomersItemThymeleafController implements ConcurrencyManager<Customer> {
}
