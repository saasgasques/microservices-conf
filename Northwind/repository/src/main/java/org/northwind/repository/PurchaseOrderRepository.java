package org.northwind.repository;
import io.springlets.data.jpa.repository.DetachableJpaRepository;
import org.northwind.model.PurchaseOrder;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepository;

/**
 * = PurchaseOrderRepository
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJpaRepository(entity = PurchaseOrder.class)
public interface PurchaseOrderRepository extends DetachableJpaRepository<PurchaseOrder, Long>, PurchaseOrderRepositoryCustom {
}
