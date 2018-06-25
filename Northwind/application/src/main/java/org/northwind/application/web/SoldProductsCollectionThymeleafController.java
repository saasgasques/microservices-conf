package org.northwind.application.web;
import org.northwind.model.SoldProduct;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;

/**
 * = SoldProductsCollectionThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = SoldProduct.class, type = ControllerType.COLLECTION)
@RooThymeleaf
public class SoldProductsCollectionThymeleafController {
}
