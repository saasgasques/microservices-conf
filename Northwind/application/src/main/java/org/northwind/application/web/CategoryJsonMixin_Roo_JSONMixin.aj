// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.northwind.application.web;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.Set;
import org.northwind.application.web.CategoryJsonMixin;
import org.northwind.model.Product;

privileged aspect CategoryJsonMixin_Roo_JSONMixin {
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @JsonIgnore
    private Set<Product> CategoryJsonMixin.products;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Set
     */
    public Set<Product> CategoryJsonMixin.getProducts() {
        return products;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param products
     */
    public void CategoryJsonMixin.setProducts(Set<Product> products) {
        this.products = products;
    }
    
}
