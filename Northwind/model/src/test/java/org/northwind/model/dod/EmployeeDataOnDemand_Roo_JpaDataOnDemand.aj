// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.northwind.model.dod;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.northwind.model.Employee;
import org.northwind.model.dod.EmployeeDataOnDemand;
import org.northwind.model.dod.EmployeeFactory;

privileged aspect EmployeeDataOnDemand_Roo_JpaDataOnDemand {
    
    /**
     * Random generator for the entities index.
     * 
     */
    private Random EmployeeDataOnDemand.rnd = new SecureRandom();
    
    /**
     * List of created entities.
     * 
     */
    private List<Employee> EmployeeDataOnDemand.data;
    
    /**
     * EntityManager to persist the entities.
     * 
     */
    private EntityManager EmployeeDataOnDemand.entityManager;
    
    /**
     * Number of elements to create and persist.
     * 
     */
    private int EmployeeDataOnDemand.size;
    
    /**
     * Factory to create entity instances.
     * 
     */
    private EmployeeFactory EmployeeDataOnDemand.factory = new EmployeeFactory();
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param entityManager
     */
    public EmployeeDataOnDemand.new(EntityManager entityManager) {
        this(entityManager, 10);
    }

    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param entityManager
     * @param size
     */
    public EmployeeDataOnDemand.new(EntityManager entityManager, int size) {
        setEntityManager(entityManager);
        setSize(size);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return Random
     */
    public Random EmployeeDataOnDemand.getRnd() {
        return rnd;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param rnd
     */
    public void EmployeeDataOnDemand.setRnd(Random rnd) {
        this.rnd = rnd;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public List<Employee> EmployeeDataOnDemand.getData() {
        return data;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param data
     */
    public void EmployeeDataOnDemand.setData(List<Employee> data) {
        this.data = data;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return EntityManager
     */
    public EntityManager EmployeeDataOnDemand.getEntityManager() {
        return entityManager;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entityManager
     */
    public void EmployeeDataOnDemand.setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Integer
     */
    public int EmployeeDataOnDemand.getSize() {
        return size;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param size
     */
    public void EmployeeDataOnDemand.setSize(int size) {
        this.size = size;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return EmployeeFactory
     */
    public EmployeeFactory EmployeeDataOnDemand.getFactory() {
        return factory;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param factory
     */
    public void EmployeeDataOnDemand.setFactory(EmployeeFactory factory) {
        this.factory = factory;
    }
    
    /**
     * Creates a new transient Employee in a random index out of the initial list of the created entities,
     * with an index greater than {@link EmployeeDataOnDemand#getSize()} - 1.
     * 
     * @return Employee the generated transient {@link Employee}
     */
    public Employee EmployeeDataOnDemand.getNewRandomTransientEmployee() {
        int randomIndex = getSize() + getRnd().nextInt(Integer.MAX_VALUE - getSize());
        return getFactory().create(randomIndex);
    }
    
    /**
     * Returns a generated and persisted {@link Employee} in a given index.
     * 
     * @param index the position of the {@link Employee} to return
     * @return Employee the specific {@link Employee}
     */
    public Employee EmployeeDataOnDemand.getSpecificEmployee(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (getData().size() - 1)) {
            index = getData().size() - 1;
        }
        return getData().get(index);
    }
    
    /**
     * Returns a generated and persisted {@link Employee} in a random index.
     * 
     * @return Employee a random {@link Employee}
     */
    public Employee EmployeeDataOnDemand.getRandomEmployee() {
        init();
        return getData().get(getRnd().nextInt(getData().size()));
    }
    
    /**
     * Creates the initial list of generated entities.
     * 
     */
    public void EmployeeDataOnDemand.init() {
        int from = 0;
        int to = 10;
        
        CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
        CriteriaQuery<Employee> cq = cb.createQuery(Employee.class);
        Root<Employee> rootEntry = cq.from(Employee.class);
        CriteriaQuery<Employee> all = cq.select(rootEntry);
        TypedQuery<Employee> allQuery = 
            getEntityManager().createQuery(all).setFirstResult(from).setMaxResults(to);
        setData(allQuery.getResultList());
        if (getData() == null) {
            throw new IllegalStateException(
                "Find entries implementation for 'Employee' illegally returned null");
        }
        if (!getData().isEmpty()) {
            return;
        }
        
        setData(new ArrayList<Employee>());
        for (int i = from; i < to; i++) {
            Employee obj = getFactory().create(i);
            try {
                getEntityManager().persist(obj);
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
            getEntityManager().flush();
            getData().add(obj);
        }
    }
    
}