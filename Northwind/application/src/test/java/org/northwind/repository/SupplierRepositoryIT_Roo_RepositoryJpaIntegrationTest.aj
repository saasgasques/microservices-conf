// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.northwind.repository;

import static org.assertj.core.api.Assertions.assertThat;

import io.springlets.data.domain.GlobalSearch;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.northwind.application.config.SpringDataJpaDetachableRepositoryConfiguration;
import org.northwind.model.Supplier;
import org.northwind.model.dod.DataOnDemandConfiguration;
import org.northwind.model.dod.SupplierDataOnDemand;
import org.northwind.repository.SupplierRepository;
import org.northwind.repository.SupplierRepositoryIT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.Import;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.junit4.SpringRunner;

privileged aspect SupplierRepositoryIT_Roo_RepositoryJpaIntegrationTest {
    
    declare @type: SupplierRepositoryIT: @RunWith(SpringRunner.class);
    
    declare @type: SupplierRepositoryIT: @DataJpaTest;
    
    declare @type: SupplierRepositoryIT: @Import({ DataOnDemandConfiguration.class, SpringDataJpaDetachableRepositoryConfiguration.class });
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @Rule
    public ExpectedException SupplierRepositoryIT.thrown = ExpectedException.none();
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @Autowired
    private SupplierRepository SupplierRepositoryIT.repository;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @Autowired
    private SupplierDataOnDemand SupplierRepositoryIT.dod;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return SupplierRepository
     */
    public SupplierRepository SupplierRepositoryIT.getRepository() {
        return repository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return SupplierDataOnDemand
     */
    public SupplierDataOnDemand SupplierRepositoryIT.getDod() {
        return dod;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Before
    public void SupplierRepositoryIT.checkDataOnDemandHasInitializedCorrectly() {
        assertThat(getDod().getRandomSupplier())
            .as("Check data on demand for 'Supplier' initializes correctly by getting a random Supplier")
            .isNotNull();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void SupplierRepositoryIT.countShouldReturnExpectedValue() {
        // Verify
        assertThat(getRepository().count()).as("Check there are available 'Supplier' entries").isGreaterThan(0);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void SupplierRepositoryIT.findOneShouldReturnExistingSupplier() {
        // Setup
        Long id = getRandomSupplierId();
        
        // Exercise
        Supplier supplier = getRepository().findOne(id);
        
        // Verify
        assertThat(supplier).as("Check that findOne illegally returned null for id %s", id).isNotNull();
        assertThat(id).as("Check the identifier of the found 'Supplier' is the same used to look for it")
            .isEqualTo(supplier.getId());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void SupplierRepositoryIT.findAllShouldReturnAllSuppliers() {
        // Setup
        assertThat(getRepository().count())
            .as("Check the number of entries is not too big (250 entries). "
                + "If it is, please review the tests so it doesn't take too long to run them")
            .isLessThan(250);
        
        // Exercise
        List<Supplier> result = getRepository().findAll();
        
        // Verify
        assertThat(result).as("Check 'findAll' returns a not null list of entries").isNotNull();
        assertThat(result.size()).as("Check 'findAll' returns a not empty list of entries")
            .isGreaterThan(0);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void SupplierRepositoryIT.persistShouldGenerateIdValue() {
        // Setup
        // Exercise
        Supplier supplier = getDod().getNewRandomTransientSupplier();
        
        // Verify
        assertThat(supplier).as("Check the Data on demand generated a new non null 'Supplier'").isNotNull();
        assertThat(supplier.getId()).as("Check the Data on demand generated a new 'Supplier' whose id is null")
            .isNull();
        try {
            supplier = getRepository().saveAndFlush(supplier);
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter
                .hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".")
                    .append(cv.getPropertyPath()).append(": ").append(cv.getMessage())
                    .append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        assertThat(supplier.getId()).as("Check a 'Supplier' (%s) id is not null after been persisted", supplier)
            .isNotNull();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void SupplierRepositoryIT.deleteShouldMakeSupplierUnavailable() {
        // Setup
        Long id = getRandomSupplierId();
        Supplier supplier = getRepository().findOne(id);
        
        // Exercise
        getRepository().delete(supplier);
        
        // Verify
        assertThat(getRepository().findOne(id))
        .as("Check the deleted 'Supplier' %s is no longer available with 'findOne'", supplier).isNull();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void SupplierRepositoryIT.findAllCustomNotFilteredNotPagedShouldReturnAllSuppliers() {
        // Exercise
        Page<Supplier> all = getRepository().findAll((GlobalSearch) null, new PageRequest(0, getDod().getSize()));
        
        // Verify
        assertThat(all.getNumberOfElements())
            .as("Check 'findAll' with null 'GlobalSearch' and no pagination returns all entries")
            .isEqualTo(getDod().getSize());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void SupplierRepositoryIT.findAllCustomNotFilteredPagedShouldReturnASuppliersPage() {
        // Exercise
        Page<Supplier> all = getRepository().findAll((GlobalSearch) null, new PageRequest(0, 3));
        
        // Verify
        assertThat(all.getNumberOfElements())
            .as("Check result number is not greater than the page size").isLessThanOrEqualTo(3);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    private Long SupplierRepositoryIT.getRandomSupplierId() {
        Supplier supplier = getDod().getRandomSupplier();
        Long id = supplier.getId();
        assertThat(id).as("Check the Data on demand generated a 'Supplier' with an identifier").isNotNull();
        return id;
    }
    
}
