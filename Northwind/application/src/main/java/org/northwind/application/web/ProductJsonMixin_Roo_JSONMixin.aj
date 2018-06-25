// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.northwind.application.web;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import java.util.Set;
import org.northwind.application.web.CategoryDeserializer;
import org.northwind.application.web.ProductJsonMixin;
import org.northwind.application.web.SupplierDeserializer;
import org.northwind.model.Category;
import org.northwind.model.OrderDetail;
import org.northwind.model.PurchaseOrder;
import org.northwind.model.Supplier;

privileged aspect ProductJsonMixin_Roo_JSONMixin {
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @JsonIgnore
    private Set<OrderDetail> ProductJsonMixin.orderDetails;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @JsonIgnore
    private Set<PurchaseOrder> ProductJsonMixin.purchaseOrders;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @JsonDeserialize(using = CategoryDeserializer.class)
    private Category ProductJsonMixin.category;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @JsonDeserialize(using = SupplierDeserializer.class)
    private Supplier ProductJsonMixin.supplier;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Set
     */
    public Set<OrderDetail> ProductJsonMixin.getOrderDetails() {
        return orderDetails;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param orderDetails
     */
    public void ProductJsonMixin.setOrderDetails(Set<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Set
     */
    public Set<PurchaseOrder> ProductJsonMixin.getPurchaseOrders() {
        return purchaseOrders;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param purchaseOrders
     */
    public void ProductJsonMixin.setPurchaseOrders(Set<PurchaseOrder> purchaseOrders) {
        this.purchaseOrders = purchaseOrders;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Category
     */
    public Category ProductJsonMixin.getCategory() {
        return category;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param category
     */
    public void ProductJsonMixin.setCategory(Category category) {
        this.category = category;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Supplier
     */
    public Supplier ProductJsonMixin.getSupplier() {
        return supplier;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param supplier
     */
    public void ProductJsonMixin.setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }
    
}
