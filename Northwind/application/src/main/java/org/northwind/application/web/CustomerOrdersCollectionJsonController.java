package org.northwind.application.web;
import org.northwind.model.CustomerOrder;
import org.springframework.roo.addon.web.mvc.controller.annotations.ControllerType;
import org.springframework.roo.addon.web.mvc.controller.annotations.RooController;
import org.springframework.roo.addon.web.mvc.controller.annotations.responses.json.RooJSON;

/**
 * = CustomerOrdersCollectionJsonController
 *
 * TODO Auto-generated class documentation
 *
 */
@RooController(entity = CustomerOrder.class, pathPrefix = "/api", type = ControllerType.COLLECTION)
@RooJSON
public class CustomerOrdersCollectionJsonController {
}
