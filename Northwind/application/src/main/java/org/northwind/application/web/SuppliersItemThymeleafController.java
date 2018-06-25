package org.northwind.application.web;
import io.springlets.web.mvc.util.concurrency.ConcurrencyManager;
import org.northwind.model.Supplier;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;

/**
 * = SuppliersItemThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Supplier.class, type = ControllerType.ITEM)
@RooThymeleaf
public class SuppliersItemThymeleafController implements ConcurrencyManager<Supplier> {
}
