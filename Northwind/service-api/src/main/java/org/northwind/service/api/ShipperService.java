package org.northwind.service.api;
import io.springlets.data.web.validation.ValidatorService;
import io.springlets.format.EntityResolver;
import org.northwind.model.Shipper;
import org.springframework.roo.addon.layers.service.annotations.RooService;
import io.springlets.data.domain.GlobalSearch;
import java.util.List;
import org.northwind.model.ShipperPhoneFormBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * = ShipperService
 *
 * TODO Auto-generated class documentation
 *
 */
@RooService(entity = Shipper.class)
public interface ShipperService extends EntityResolver<Shipper, Long>, ValidatorService<Shipper> {

    /**
     * TODO Auto-generated method documentation
     *
     * @param id
     * @return Shipper
     */
    public abstract Shipper findOne(Long id);

    /**
     * TODO Auto-generated method documentation
     *
     * @param shipper
     */
    public abstract void delete(Shipper shipper);

    /**
     * TODO Auto-generated method documentation
     *
     * @param entities
     * @return List
     */
    public abstract List<Shipper> save(Iterable<Shipper> entities);

    /**
     * TODO Auto-generated method documentation
     *
     * @param ids
     */
    public abstract void delete(Iterable<Long> ids);

    /**
     * TODO Auto-generated method documentation
     *
     * @param entity
     * @return Shipper
     */
    public abstract Shipper save(Shipper entity);

    /**
     * TODO Auto-generated method documentation
     *
     * @param id
     * @return Shipper
     */
    public abstract Shipper findOneForUpdate(Long id);

    /**
     * TODO Auto-generated method documentation
     *
     * @param ids
     * @return List
     */
    public abstract List<Shipper> findAll(Iterable<Long> ids);

    /**
     * TODO Auto-generated method documentation
     *
     * @return List
     */
    public abstract List<Shipper> findAll();

    /**
     * TODO Auto-generated method documentation
     *
     * @return Long
     */
    public abstract long count();

    /**
     * TODO Auto-generated method documentation
     *
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<Shipper> findAll(GlobalSearch globalSearch, Pageable pageable);

    /**
     * TODO Auto-generated method documentation
     *
     * @param ids
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<Shipper> findAllByIdsIn(List<Long> ids, GlobalSearch globalSearch, Pageable pageable);

    /**
     * TODO Auto-generated method documentation
     *
     * @param shipper
     * @param customerOrdersToAdd
     * @return Shipper
     */
    public abstract Shipper addToCustomerOrders(Shipper shipper, Iterable<Long> customerOrdersToAdd);

    /**
     * TODO Auto-generated method documentation
     *
     * @param shipper
     * @param customerOrdersToRemove
     * @return Shipper
     */
    public abstract Shipper removeFromCustomerOrders(Shipper shipper, Iterable<Long> customerOrdersToRemove);

    /**
     * TODO Auto-generated method documentation
     *
     * @param shipper
     * @param customerOrders
     * @return Shipper
     */
    public abstract Shipper setCustomerOrders(Shipper shipper, Iterable<Long> customerOrders);

    /**
     * TODO Auto-generated method documentation
     *
     * @param companyName
     * @param pageable
     * @return Page
     */
    public abstract Page<Shipper> findByCompanyName(String companyName, Pageable pageable);

    /**
     * TODO Auto-generated method documentation
     *
     * @param formBean
     * @param globalSearch
     * @param pageable
     * @return Page
     */
    public abstract Page<Shipper> findByPhone(ShipperPhoneFormBean formBean, GlobalSearch globalSearch, Pageable pageable);

    /**
     * TODO Auto-generated method documentation
     *
     * @param companyName
     * @return Long
     */
    public abstract long countByCompanyName(String companyName);

    /**
     * TODO Auto-generated method documentation
     *
     * @param formBean
     * @return Long
     */
    public abstract long countByPhone(ShipperPhoneFormBean formBean);
}
