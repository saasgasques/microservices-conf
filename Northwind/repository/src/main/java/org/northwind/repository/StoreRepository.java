package org.northwind.repository;
import io.springlets.data.jpa.repository.DetachableJpaRepository;
import org.northwind.model.Store;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepository;

/**
 * = StoreRepository
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJpaRepository(entity = Store.class)
public interface StoreRepository extends DetachableJpaRepository<Store, Long>, StoreRepositoryCustom {
}
