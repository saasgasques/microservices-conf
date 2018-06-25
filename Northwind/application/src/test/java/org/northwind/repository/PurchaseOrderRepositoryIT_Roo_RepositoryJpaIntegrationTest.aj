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
import org.northwind.model.PurchaseOrder;
import org.northwind.model.dod.DataOnDemandConfiguration;
import org.northwind.model.dod.PurchaseOrderDataOnDemand;
import org.northwind.repository.PurchaseOrderRepository;
import org.northwind.repository.PurchaseOrderRepositoryIT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.Import;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.junit4.SpringRunner;

privileged aspect PurchaseOrderRepositoryIT_Roo_RepositoryJpaIntegrationTest {
    
    declare @type: PurchaseOrderRepositoryIT: @RunWith(SpringRunner.class);
    
    declare @type: PurchaseOrderRepositoryIT: @DataJpaTest;
    
    declare @type: PurchaseOrderRepositoryIT: @Import({ DataOnDemandConfiguration.class, SpringDataJpaDetachableRepositoryConfiguration.class });
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @Rule
    public ExpectedException PurchaseOrderRepositoryIT.thrown = ExpectedException.none();
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @Autowired
    private PurchaseOrderRepository PurchaseOrderRepositoryIT.repository;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @Autowired
    private PurchaseOrderDataOnDemand PurchaseOrderRepositoryIT.dod;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return PurchaseOrderRepository
     */
    public PurchaseOrderRepository PurchaseOrderRepositoryIT.getRepository() {
        return repository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return PurchaseOrderDataOnDemand
     */
    public PurchaseOrderDataOnDemand PurchaseOrderRepositoryIT.getDod() {
        return dod;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Before
    public void PurchaseOrderRepositoryIT.checkDataOnDemandHasInitializedCorrectly() {
        assertThat(getDod().getRandomPurchaseOrder())
            .as("Check data on demand for 'PurchaseOrder' initializes correctly by getting a random PurchaseOrder")
            .isNotNull();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void PurchaseOrderRepositoryIT.countShouldReturnExpectedValue() {
        // Verify
        assertThat(getRepository().count()).as("Check there are available 'PurchaseOrder' entries").isGreaterThan(0);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void PurchaseOrderRepositoryIT.findOneShouldReturnExistingPurchaseOrder() {
        // Setup
        Long id = getRandomPurchaseOrderId();
        
        // Exercise
        PurchaseOrder purchaseOrder = getRepository().findOne(id);
        
        // Verify
        assertThat(purchaseOrder).as("Check that findOne illegally returned null for id %s", id).isNotNull();
        assertThat(id).as("Check the identifier of the found 'PurchaseOrder' is the same used to look for it")
            .isEqualTo(purchaseOrder.getId());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void PurchaseOrderRepositoryIT.findAllShouldReturnAllPurchaseOrders() {
        // Setup
        assertThat(getRepository().count())
            .as("Check the number of entries is not too big (250 entries). "
                + "If it is, please review the tests so it doesn't take too long to run them")
            .isLessThan(250);
        
        // Exercise
        List<PurchaseOrder> result = getRepository().findAll();
        
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
    public void PurchaseOrderRepositoryIT.persistShouldGenerateIdValue() {
        // Setup
        // Exercise
        PurchaseOrder purchaseOrder = getDod().getNewRandomTransientPurchaseOrder();
        
        // Verify
        assertThat(purchaseOrder).as("Check the Data on demand generated a new non null 'PurchaseOrder'").isNotNull();
        assertThat(purchaseOrder.getId()).as("Check the Data on demand generated a new 'PurchaseOrder' whose id is null")
            .isNull();
        try {
            purchaseOrder = getRepository().saveAndFlush(purchaseOrder);
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
        assertThat(purchaseOrder.getId()).as("Check a 'PurchaseOrder' (%s) id is not null after been persisted", purchaseOrder)
            .isNotNull();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void PurchaseOrderRepositoryIT.deleteShouldMakePurchaseOrderUnavailable() {
        // Setup
        Long id = getRandomPurchaseOrderId();
        PurchaseOrder purchaseOrder = getRepository().findOne(id);
        
        // Exercise
        getRepository().delete(purchaseOrder);
        
        // Verify
        assertThat(getRepository().findOne(id))
        .as("Check the deleted 'PurchaseOrder' %s is no longer available with 'findOne'", purchaseOrder).isNull();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void PurchaseOrderRepositoryIT.findAllCustomNotFilteredNotPagedShouldReturnAllPurchaseOrders() {
        // Exercise
        Page<PurchaseOrder> all = getRepository().findAll((GlobalSearch) null, new PageRequest(0, getDod().getSize()));
        
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
    public void PurchaseOrderRepositoryIT.findAllCustomNotFilteredPagedShouldReturnAPurchaseOrdersPage() {
        // Exercise
        Page<PurchaseOrder> all = getRepository().findAll((GlobalSearch) null, new PageRequest(0, 3));
        
        // Verify
        assertThat(all.getNumberOfElements())
            .as("Check result number is not greater than the page size").isLessThanOrEqualTo(3);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    private Long PurchaseOrderRepositoryIT.getRandomPurchaseOrderId() {
        PurchaseOrder purchaseOrder = getDod().getRandomPurchaseOrder();
        Long id = purchaseOrder.getId();
        assertThat(id).as("Check the Data on demand generated a 'PurchaseOrder' with an identifier").isNotNull();
        return id;
    }
    
}
