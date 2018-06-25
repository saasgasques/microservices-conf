package org.northwind.application.web;
import org.northwind.model.Product;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooDetail;
import org.springframework.roo.addon.web.mvc.thymeleaf.annotations.RooThymeleaf;

/**
 * = ProductsItemPurchaseOrdersThymeleafController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = Product.class, type = ControllerType.DETAIL)
@RooDetail(relationField = "purchaseOrders", views = { "list", "show" })
@RooThymeleaf
public class ProductsItemPurchaseOrdersThymeleafController {
}
