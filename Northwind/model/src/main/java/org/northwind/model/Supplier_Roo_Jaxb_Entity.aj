// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.northwind.model;

import javax.xml.bind.annotation.XmlTransient;
import org.northwind.model.Supplier;
import org.northwind.model.Supplier_Roo_Jaxb_Entity;

privileged aspect Supplier_Roo_Jaxb_Entity {
    
    /*
     * This Aspect takes the lower precedence
     */
    declare precedence: *, Supplier_Roo_Jaxb_Entity;
    
    declare @method: public Long Supplier.getId(): @XmlTransient;
    
}