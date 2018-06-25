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
import org.northwind.model.CustomerOrder;
import org.northwind.model.dod.CustomerOrderDataOnDemand;
import org.northwind.model.dod.DataOnDemandConfiguration;
import org.northwind.repository.CustomerOrderRepository;
import org.northwind.repository.CustomerOrderRepositoryIT;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.Import;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.junit4.SpringRunner;

privileged aspect CustomerOrderRepositoryIT_Roo_RepositoryJpaIntegrationTest {
    
    declare @type: CustomerOrderRepositoryIT: @RunWith(SpringRunner.class);
    
    declare @type: CustomerOrderRepositoryIT: @DataJpaTest;
    
    declare @type: CustomerOrderRepositoryIT: @Import({ DataOnDemandConfiguration.class, SpringDataJpaDetachableRepositoryConfiguration.class });
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @Rule
    public ExpectedException CustomerOrderRepositoryIT.thrown = ExpectedException.none();
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @Autowired
    private CustomerOrderRepository CustomerOrderRepositoryIT.repository;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    @Autowired
    private CustomerOrderDataOnDemand CustomerOrderRepositoryIT.dod;
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return CustomerOrderRepository
     */
    public CustomerOrderRepository CustomerOrderRepositoryIT.getRepository() {
        return repository;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return CustomerOrderDataOnDemand
     */
    public CustomerOrderDataOnDemand CustomerOrderRepositoryIT.getDod() {
        return dod;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Before
    public void CustomerOrderRepositoryIT.checkDataOnDemandHasInitializedCorrectly() {
        assertThat(getDod().getRandomCustomerOrder())
            .as("Check data on demand for 'CustomerOrder' initializes correctly by getting a random CustomerOrder")
            .isNotNull();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void CustomerOrderRepositoryIT.countShouldReturnExpectedValue() {
        // Verify
        assertThat(getRepository().count()).as("Check there are available 'CustomerOrder' entries").isGreaterThan(0);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void CustomerOrderRepositoryIT.findOneShouldReturnExistingCustomerOrder() {
        // Setup
        Long id = getRandomCustomerOrderId();
        
        // Exercise
        CustomerOrder customerOrder = getRepository().findOne(id);
        
        // Verify
        assertThat(customerOrder).as("Check that findOne illegally returned null for id %s", id).isNotNull();
        assertThat(id).as("Check the identifier of the found 'CustomerOrder' is the same used to look for it")
            .isEqualTo(customerOrder.getId());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void CustomerOrderRepositoryIT.findAllShouldReturnAllCustomerOrders() {
        // Setup
        assertThat(getRepository().count())
            .as("Check the number of entries is not too big (250 entries). "
                + "If it is, please review the tests so it doesn't take too long to run them")
            .isLessThan(250);
        
        // Exercise
        List<CustomerOrder> result = getRepository().findAll();
        
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
    public void CustomerOrderRepositoryIT.persistShouldGenerateIdValue() {
        // Setup
        // Exercise
        CustomerOrder customerOrder = getDod().getNewRandomTransientCustomerOrder();
        
        // Verify
        assertThat(customerOrder).as("Check the Data on demand generated a new non null 'CustomerOrder'").isNotNull();
        assertThat(customerOrder.getId()).as("Check the Data on demand generated a new 'CustomerOrder' whose id is null")
            .isNull();
        try {
            customerOrder = getRepository().saveAndFlush(customerOrder);
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
        assertThat(customerOrder.getId()).as("Check a 'CustomerOrder' (%s) id is not null after been persisted", customerOrder)
            .isNotNull();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void CustomerOrderRepositoryIT.deleteShouldMakeCustomerOrderUnavailable() {
        // Setup
        Long id = getRandomCustomerOrderId();
        CustomerOrder customerOrder = getRepository().findOne(id);
        
        // Exercise
        getRepository().delete(customerOrder);
        
        // Verify
        assertThat(getRepository().findOne(id))
        .as("Check the deleted 'CustomerOrder' %s is no longer available with 'findOne'", customerOrder).isNull();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     */
    @Test
    public void CustomerOrderRepositoryIT.findAllCustomNotFilteredNotPagedShouldReturnAllCustomerOrders() {
        // Exercise
        Page<CustomerOrder> all = getRepository().findAll((GlobalSearch) null, new PageRequest(0, getDod().getSize()));
        
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
    public void CustomerOrderRepositoryIT.findAllCustomNotFilteredPagedShouldReturnACustomerOrdersPage() {
        // Exercise
        Page<CustomerOrder> all = getRepository().findAll((GlobalSearch) null, new PageRequest(0, 3));
        
        // Verify
        assertThat(all.getNumberOfElements())
            .as("Check result number is not greater than the page size").isLessThanOrEqualTo(3);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Long
     */
    private Long CustomerOrderRepositoryIT.getRandomCustomerOrderId() {
        CustomerOrder customerOrder = getDod().getRandomCustomerOrder();
        Long id = customerOrder.getId();
        assertThat(id).as("Check the Data on demand generated a 'CustomerOrder' with an identifier").isNotNull();
        return id;
    }
    
}
