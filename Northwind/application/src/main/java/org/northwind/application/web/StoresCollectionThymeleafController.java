package org.northwind.application.web;
import org.northwind.model.Store;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;

/**
 * = StoresCollectionThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Store.class, type = ControllerType.COLLECTION)
@RooThymeleaf
public class StoresCollectionThymeleafController {
}
