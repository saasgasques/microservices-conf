package org.northwind.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import org.northwind.model.Supplier;

/**
 * = SupplierRepositoryImpl
 *
 * Implementation of SupplierRepositoryCustom
 *
 */
@RooJpaRepositoryCustomImpl(repository = SupplierRepositoryCustom.class)
public class SupplierRepositoryImpl extends QueryDslRepositorySupportExt<Supplier> implements SupplierRepositoryCustom{

    /**
     * Default constructor
     */
    SupplierRepositoryImpl() {
        super(Supplier.class);
    }
}