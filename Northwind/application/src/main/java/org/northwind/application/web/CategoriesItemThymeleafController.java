package org.northwind.application.web;
import io.springlets.web.mvc.util.concurrency.ConcurrencyManager;
import org.northwind.model.Category;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;

/**
 * = CategoriesItemThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Category.class, type = ControllerType.ITEM)
@RooThymeleaf
public class CategoriesItemThymeleafController implements ConcurrencyManager<Category> {
}
