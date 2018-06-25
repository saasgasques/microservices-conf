package org.northwind.repository;
import org.northwind.model.dod.DataOnDemandConfiguration;
import org.northwind.model.dod.SoldProductDataOnDemand;
import org.springframework.roo.addon.layers.repository.jpa.annotations.test.RooRepositoryJpaIntegrationTest;

/**
 * = SoldProductRepositoryIT
 *
 * TODO Auto-generated class documentation
 *
 */
@RooRepositoryJpaIntegrationTest(targetClass = SoldProductRepository.class, dodConfigurationClass = DataOnDemandConfiguration.class, dodClass = SoldProductDataOnDemand.class)
public class SoldProductRepositoryIT {
}
