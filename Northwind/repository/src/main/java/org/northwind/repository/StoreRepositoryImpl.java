package org.northwind.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import org.northwind.model.Store;

/**
 * = StoreRepositoryImpl
 *
 * Implementation of StoreRepositoryCustom
 *
 */
@RooJpaRepositoryCustomImpl(repository = StoreRepositoryCustom.class)
public class StoreRepositoryImpl extends QueryDslRepositorySupportExt<Store> implements StoreRepositoryCustom{

    /**
     * Default constructor
     */
    StoreRepositoryImpl() {
        super(Store.class);
    }
}