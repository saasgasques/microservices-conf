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
import org.northwind.model.Supplier;
import org.northwind.model.dod.SupplierDataOnDemand;
import org.northwind.model.dod.SupplierFactory;

privileged aspect SupplierDataOnDemand_Roo_JpaDataOnDemand {
    
    /**
     * Random generator for the entities index.
     * 
     */
    private Random SupplierDataOnDemand.rnd = new SecureRandom();
    
    /**
     * List of created entities.
     * 
     */
    private List<Supplier> SupplierDataOnDemand.data;
    
    /**
     * EntityManager to persist the entities.
     * 
     */
    private EntityManager SupplierDataOnDemand.entityManager;
    
    /**
     * Number of elements to create and persist.
     * 
     */
    private int SupplierDataOnDemand.size;
    
    /**
     * Factory to create entity instances.
     * 
     */
    private SupplierFactory SupplierDataOnDemand.factory = new SupplierFactory();
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param entityManager
     */
    public SupplierDataOnDemand.new(EntityManager entityManager) {
        this(entityManager, 10);
    }

    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param entityManager
     * @param size
     */
    public SupplierDataOnDemand.new(EntityManager entityManager, int size) {
        setEntityManager(entityManager);
        setSize(size);
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return Random
     */
    public Random SupplierDataOnDemand.getRnd() {
        return rnd;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param rnd
     */
    public void SupplierDataOnDemand.setRnd(Random rnd) {
        this.rnd = rnd;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return List
     */
    public List<Supplier> SupplierDataOnDemand.getData() {
        return data;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param data
     */
    public void SupplierDataOnDemand.setData(List<Supplier> data) {
        this.data = data;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return EntityManager
     */
    public EntityManager SupplierDataOnDemand.getEntityManager() {
        return entityManager;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entityManager
     */
    public void SupplierDataOnDemand.setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Integer
     */
    public int SupplierDataOnDemand.getSize() {
        return size;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param size
     */
    public void SupplierDataOnDemand.setSize(int size) {
        this.size = size;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return SupplierFactory
     */
    public SupplierFactory SupplierDataOnDemand.getFactory() {
        return factory;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param factory
     */
    public void SupplierDataOnDemand.setFactory(SupplierFactory factory) {
        this.factory = factory;
    }
    
    /**
     * Creates a new transient Supplier in a random index out of the initial list of the created entities,
     * with an index greater than {@link SupplierDataOnDemand#getSize()} - 1.
     * 
     * @return Supplier the generated transient {@link Supplier}
     */
    public Supplier SupplierDataOnDemand.getNewRandomTransientSupplier() {
        int randomIndex = getSize() + getRnd().nextInt(Integer.MAX_VALUE - getSize());
        return getFactory().create(randomIndex);
    }
    
    /**
     * Returns a generated and persisted {@link Supplier} in a given index.
     * 
     * @param index the position of the {@link Supplier} to return
     * @return Supplier the specific {@link Supplier}
     */
    public Supplier SupplierDataOnDemand.getSpecificSupplier(int index) {
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
     * Returns a generated and persisted {@link Supplier} in a random index.
     * 
     * @return Supplier a random {@link Supplier}
     */
    public Supplier SupplierDataOnDemand.getRandomSupplier() {
        init();
        return getData().get(getRnd().nextInt(getData().size()));
    }
    
    /**
     * Creates the initial list of generated entities.
     * 
     */
    public void SupplierDataOnDemand.init() {
        int from = 0;
        int to = 10;
        
        CriteriaBuilder cb = getEntityManager().getCriteriaBuilder();
        CriteriaQuery<Supplier> cq = cb.createQuery(Supplier.class);
        Root<Supplier> rootEntry = cq.from(Supplier.class);
        CriteriaQuery<Supplier> all = cq.select(rootEntry);
        TypedQuery<Supplier> allQuery = 
            getEntityManager().createQuery(all).setFirstResult(from).setMaxResults(to);
        setData(allQuery.getResultList());
        if (getData() == null) {
            throw new IllegalStateException(
                "Find entries implementation for 'Supplier' illegally returned null");
        }
        if (!getData().isEmpty()) {
            return;
        }
        
        setData(new ArrayList<Supplier>());
        for (int i = from; i < to; i++) {
            Supplier obj = getFactory().create(i);
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
