package org.northwind.application.web;
import org.northwind.model.PurchaseOrder;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.controller.annotations.responses.json.RooJSON;

/**
 * = PurchaseOrdersItemJsonController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = PurchaseOrder.class, pathPrefix = "/api", type = ControllerType.ITEM)
@RooJSON
public class PurchaseOrdersItemJsonController {
}
