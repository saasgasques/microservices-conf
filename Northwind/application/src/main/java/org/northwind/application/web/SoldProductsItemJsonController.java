package org.northwind.application.web;
import org.northwind.model.SoldProduct;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.controller.annotations.responses.json.RooJSON;

/**
 * = SoldProductsItemJsonController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = SoldProduct.class, pathPrefix = "/api", type = ControllerType.ITEM)
@RooJSON
public class SoldProductsItemJsonController {
}
