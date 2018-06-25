package org.northwind.application.web;
import io.springlets.web.mvc.util.concurrency.ConcurrencyManager;
import org.northwind.model.Region;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;

/**
 * = RegionsItemThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Region.class, type = ControllerType.ITEM)
@RooThymeleaf
public class RegionsItemThymeleafController implements ConcurrencyManager<Region> {
}
