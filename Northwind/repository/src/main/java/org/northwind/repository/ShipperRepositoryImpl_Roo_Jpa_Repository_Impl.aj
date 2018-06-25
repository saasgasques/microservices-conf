// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.northwind.repository;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Path;
import com.querydsl.jpa.JPQLQuery;
import io.springlets.data.domain.GlobalSearch;
import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt.AttributeMappingBuilder;
import java.util.List;
import org.northwind.model.QShipper;
import org.northwind.model.Shipper;
import org.northwind.model.ShipperPhoneFormBean;
import org.northwind.repository.ShipperRepositoryImpl;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ShipperRepositoryImpl_Roo_Jpa_Repository_Impl {
    
    declare @type: ShipperRepositoryImpl: @Transactional(readOnly = true);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ShipperRepositoryImpl.COMPANY_NAME = "companyName";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ShipperRepositoryImpl.PHONE = "phone";
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Shipper> ShipperRepositoryImpl.findAll(GlobalSearch globalSearch, Pageable pageable) {
        
        QShipper shipper = QShipper.shipper;
        
        JPQLQuery<Shipper> query = from(shipper);
        
        Path<?>[] paths = new Path<?>[] {shipper.companyName,shipper.phone};        
        applyGlobalSearch(globalSearch, query, paths);
        
        AttributeMappingBuilder mapping = buildMapper()
			.map(COMPANY_NAME, shipper.companyName)
			.map(PHONE, shipper.phone);
        
        applyPagination(pageable, query, mapping);
        applyOrderById(query);
        
        return loadPage(query, pageable, shipper);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param ids
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Shipper> ShipperRepositoryImpl.findAllByIdsIn(List<Long> ids, GlobalSearch globalSearch, Pageable pageable) {
        
        QShipper shipper = QShipper.shipper;
        
        JPQLQuery<Shipper> query = from(shipper);
        
        Path<?>[] paths = new Path<?>[] {shipper.companyName,shipper.phone};        
        applyGlobalSearch(globalSearch, query, paths);
        
        // Also, filter by the provided ids
        query.where(shipper.id.in(ids));
        
        AttributeMappingBuilder mapping = buildMapper()
			.map(COMPANY_NAME, shipper.companyName)
			.map(PHONE, shipper.phone);
        
        applyPagination(pageable, query, mapping);
        applyOrderById(query);
        
        return loadPage(query, pageable, shipper);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public Page<Shipper> ShipperRepositoryImpl.findByPhone(ShipperPhoneFormBean formBean, GlobalSearch globalSearch, Pageable pageable) {
        
        QShipper shipper = QShipper.shipper;
        
        JPQLQuery<Shipper> query = from(shipper);
        
        if (formBean != null) {
        BooleanBuilder searchCondition = new BooleanBuilder();
                if (formBean.getPhone() != null) {
                        searchCondition.and(shipper.phone.eq(formBean.getPhone()));
                }
        if (searchCondition.hasValue()) {
            query.where(searchCondition);
        }
        }
        
        Path<?>[] paths = new Path<?>[] {shipper.companyName,shipper.phone};        
        applyGlobalSearch(globalSearch, query, paths);
        
        AttributeMappingBuilder mapping = buildMapper()
			.map(COMPANY_NAME, shipper.companyName)
			.map(PHONE, shipper.phone);
        
        applyPagination(pageable, query, mapping);
        applyOrderById(query);
        
        return loadPage(query, pageable, shipper);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param formBean
     * @return Long
     */
    public long ShipperRepositoryImpl.countByPhone(ShipperPhoneFormBean formBean) {
        
        QShipper shipper = QShipper.shipper;
        
        JPQLQuery<Shipper> query = from(shipper);
        
        BooleanBuilder searchCondition = new BooleanBuilder();
                if (formBean.getPhone() != null) {
                        searchCondition.and(shipper.phone.eq(formBean.getPhone()));
                }
        if (searchCondition.hasValue()) {
            query.where(searchCondition);
        }
        return query.fetchCount();
    }
    
}
