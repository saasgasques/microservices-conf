package org.northwind.application.web;
import io.springlets.web.mvc.util.concurrency.ConcurrencyManager;
import org.northwind.model.PurchaseOrder;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;

/**
 * = PurchaseOrdersItemThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = PurchaseOrder.class, type = ControllerType.ITEM)
@RooThymeleaf
public class PurchaseOrdersItemThymeleafController implements ConcurrencyManager<PurchaseOrder> {
}
