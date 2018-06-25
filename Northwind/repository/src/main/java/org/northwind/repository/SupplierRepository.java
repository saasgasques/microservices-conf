package org.northwind.repository;
import io.springlets.data.jpa.repository.DetachableJpaRepository;
import org.northwind.model.Supplier;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepository;

/**
 * = SupplierRepository
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJpaRepository(entity = Supplier.class)
public interface SupplierRepository extends DetachableJpaRepository<Supplier, Long>, SupplierRepositoryCustom {
}
