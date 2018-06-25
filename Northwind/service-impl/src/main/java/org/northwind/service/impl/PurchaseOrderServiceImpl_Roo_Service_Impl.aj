// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.northwind.service.impl;

import io.springlets.data.domain.GlobalSearch;
import io.springlets.data.web.validation.MessageI18n;
import java.util.List;
import java.util.Map;
import org.northwind.model.Employee;
import org.northwind.model.Product;
import org.northwind.model.PurchaseOrder;
import org.northwind.repository.PurchaseOrderRepository;
import org.northwind.service.impl.PurchaseOrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PurchaseOrderServiceImpl_Roo_Service_Impl {
    
    declare @type: PurchaseOrderServiceImpl: @Service;
    
    declare @type: PurchaseOrderServiceImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private PurchaseOrderRepository PurchaseOrderServiceImpl.purchaseOrderRepository;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param purchaseOrderRepository
     */
    @Autowired
    public PurchaseOrderServiceImpl.new(PurchaseOrderRepository purchaseOrderRepository) {
        setPurchaseOrderRepository(purchaseOrderRepository);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return PurchaseOrderRepository
     */
    public PurchaseOrderRepository PurchaseOrderServiceImpl.getPurchaseOrderRepository() {
        return purchaseOrderRepository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param purchaseOrderRepository
     */
    public void PurchaseOrderServiceImpl.setPurchaseOrderRepository(PurchaseOrderRepository purchaseOrderRepository) {
        this.purchaseOrderRepository = purchaseOrderRepository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param purchaseorder
     * @return Map
     */
    public Map<String, List<MessageI18n>> PurchaseOrderServiceImpl.validate(PurchaseOrder purchaseorder) {
        Map<String, List<MessageI18n>> messages = new java.util.HashMap<String, List<MessageI18n>>();
        
        // TODO: IMPLEMENT HERE THE VALIDATION OF YOUR ENTITY
        
        return messages;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param purchaseOrder
     */
    @Transactional
    public void PurchaseOrderServiceImpl.delete(PurchaseOrder purchaseOrder) {
        // Clear bidirectional many-to-one child relationship with Product
        if (purchaseOrder.getProduct() != null) {
            purchaseOrder.getProduct().getPurchaseOrders().remove(purchaseOrder);
        }
        
        // Clear bidirectional many-to-one child relationship with Employee
        if (purchaseOrder.getEmployee() != null) {
            purchaseOrder.getEmployee().getPurchaseOrders().remove(purchaseOrder);
        }
        
        getPurchaseOrderRepository().delete(purchaseOrder);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entities
     * @return List
     */
    @Transactional
    public List<PurchaseOrder> PurchaseOrderServiceImpl.save(Iterable<PurchaseOrder> entities) {
        return getPurchaseOrderRepository().save(entities);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     */
    @Transactional
    public void PurchaseOrderServiceImpl.delete(Iterable<Long> ids) {
        List<PurchaseOrder> toDelete = getPurchaseOrderRepository().findAll(ids);
        getPurchaseOrderRepository().deleteInBatch(toDelete);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @return PurchaseOrder
     */
    @Transactional
    public PurchaseOrder PurchaseOrderServiceImpl.save(PurchaseOrder entity) {
        return getPurchaseOrderRepository().save(entity);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return PurchaseOrder
     */
    public PurchaseOrder PurchaseOrderServiceImpl.findOne(Long id) {
        return getPurchaseOrderRepository().findOne(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @return PurchaseOrder
     */
    public PurchaseOrder PurchaseOrderServiceImpl.findOneForUpdate(Long id) {
        return getPurchaseOrderRepository().findOneDetached(id);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @return List
     */
    public List<PurchaseOrder> PurchaseOrderServiceImpl.findAll(Iterable<Long> ids) {
        return getPurchaseOrderRepository().findAll(ids);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public List<PurchaseOrder> PurchaseOrderServiceImpl.findAll() {
        return getPurchaseOrderRepository().findAll();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    public long PurchaseOrderServiceImpl.count() {
        return getPurchaseOrderRepository().count();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<PurchaseOrder> PurchaseOrderServiceImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        return getPurchaseOrderRepository().findAll(globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<PurchaseOrder> PurchaseOrderServiceImpl.findAllByIdsIn(List<Long> ids, GlobalSearch globalSearch, Pageable pageable) {
        return getPurchaseOrderRepository().findAllByIdsIn(ids, globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param employee
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<PurchaseOrder> PurchaseOrderServiceImpl.findByEmployee(Employee employee, GlobalSearch globalSearch, Pageable pageable) {
        return getPurchaseOrderRepository().findByEmployee(employee, globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param product
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<PurchaseOrder> PurchaseOrderServiceImpl.findByProduct(Product product, GlobalSearch globalSearch, Pageable pageable) {
        return getPurchaseOrderRepository().findByProduct(product, globalSearch, pageable);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param employee
     * @return Long
     */
    public long PurchaseOrderServiceImpl.countByEmployee(Employee employee) {
        return getPurchaseOrderRepository().countByEmployee(employee);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param product
     * @return Long
     */
    public long PurchaseOrderServiceImpl.countByProduct(Product product) {
        return getPurchaseOrderRepository().countByProduct(product);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<PurchaseOrder> PurchaseOrderServiceImpl.getEntityType() {
        return PurchaseOrder.class;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<Long> PurchaseOrderServiceImpl.getIdType() {
        return Long.class;
    }
    
}
