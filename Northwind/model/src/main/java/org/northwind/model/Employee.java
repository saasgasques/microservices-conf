package org.northwind.model;
import org.springframework.roo.addon.javabean.annotations.RooJavaBean;
import org.springframework.roo.addon.javabean.annotations.RooToString;
import org.springframework.roo.addon.jpa.annotations.entity.RooJpaEntity;
import java.util.Calendar;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import org.springframework.roo.addon.jpa.annotations.entity.JpaRelationType;
import org.springframework.roo.addon.jpa.annotations.entity.RooJpaRelation;
import org.springframework.roo.addon.ws.annotations.jaxb.RooJaxbEntity;
import io.springlets.format.EntityFormat;
import javax.persistence.Entity;
import javax.xml.bind.annotation.XmlRootElement;
import org.springframework.util.Assert;

/**
 * = Employee
 *
 * TODO Auto-generated class documentation
 *
 */
@RooJavaBean
@RooToString
@RooJpaEntity
@RooJaxbEntity
@Entity
@EntityFormat
@XmlRootElement(name = "employee", namespace = "http://ws.northwind.org/")
public class Employee extends Party {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private String firstName;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private String lastName;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private String title;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Calendar birthDate;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Calendar hireDate;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private String extension;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private String photo;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private String notes;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @OneToMany(cascade = { javax.persistence.CascadeType.MERGE, javax.persistence.CascadeType.PERSIST }, fetch = FetchType.LAZY, mappedBy = "employee")
    @RooJpaRelation(type = JpaRelationType.AGGREGATION)
    private Set<PurchaseOrder> purchaseOrders = new HashSet<PurchaseOrder>();

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    @OneToMany(cascade = { javax.persistence.CascadeType.MERGE, javax.persistence.CascadeType.PERSIST }, fetch = FetchType.LAZY, mappedBy = "employee")
    @RooJpaRelation(type = JpaRelationType.AGGREGATION)
    private Set<CustomerOrder> customerOrders = new HashSet<CustomerOrder>();

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    public static final String ITERABLE_TO_ADD_CANT_BE_NULL_MESSAGE = "The given Iterable of items to add can't be null!";

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    public static final String ITERABLE_TO_REMOVE_CANT_BE_NULL_MESSAGE = "The given Iterable of items to add can't be null!";

    /**
     * Gets firstName value
     *
     * @return String
     */
    public String getFirstName() {
        return this.firstName;
    }

    /**
     * Sets firstName value
     *
     * @param firstName
     * @return Employee
     */
    public Employee setFirstName(String firstName) {
        this.firstName = firstName;
        return this;
    }

    /**
     * Gets lastName value
     *
     * @return String
     */
    public String getLastName() {
        return this.lastName;
    }

    /**
     * Sets lastName value
     *
     * @param lastName
     * @return Employee
     */
    public Employee setLastName(String lastName) {
        this.lastName = lastName;
        return this;
    }

    /**
     * Gets title value
     *
     * @return String
     */
    public String getTitle() {
        return this.title;
    }

    /**
     * Sets title value
     *
     * @param title
     * @return Employee
     */
    public Employee setTitle(String title) {
        this.title = title;
        return this;
    }

    /**
     * Gets birthDate value
     *
     * @return Calendar
     */
    public Calendar getBirthDate() {
        return this.birthDate;
    }

    /**
     * Sets birthDate value
     *
     * @param birthDate
     * @return Employee
     */
    public Employee setBirthDate(Calendar birthDate) {
        this.birthDate = birthDate;
        return this;
    }

    /**
     * Gets hireDate value
     *
     * @return Calendar
     */
    public Calendar getHireDate() {
        return this.hireDate;
    }

    /**
     * Sets hireDate value
     *
     * @param hireDate
     * @return Employee
     */
    public Employee setHireDate(Calendar hireDate) {
        this.hireDate = hireDate;
        return this;
    }

    /**
     * Gets extension value
     *
     * @return String
     */
    public String getExtension() {
        return this.extension;
    }

    /**
     * Sets extension value
     *
     * @param extension
     * @return Employee
     */
    public Employee setExtension(String extension) {
        this.extension = extension;
        return this;
    }

    /**
     * Gets photo value
     *
     * @return String
     */
    public String getPhoto() {
        return this.photo;
    }

    /**
     * Sets photo value
     *
     * @param photo
     * @return Employee
     */
    public Employee setPhoto(String photo) {
        this.photo = photo;
        return this;
    }

    /**
     * Gets notes value
     *
     * @return String
     */
    public String getNotes() {
        return this.notes;
    }

    /**
     * Sets notes value
     *
     * @param notes
     * @return Employee
     */
    public Employee setNotes(String notes) {
        this.notes = notes;
        return this;
    }

    /**
     * Gets purchaseOrders value
     *
     * @return Set
     */
    public Set<PurchaseOrder> getPurchaseOrders() {
        return this.purchaseOrders;
    }

    /**
     * Sets purchaseOrders value
     *
     * @param purchaseOrders
     * @return Employee
     */
    public Employee setPurchaseOrders(Set<PurchaseOrder> purchaseOrders) {
        this.purchaseOrders = purchaseOrders;
        return this;
    }

    /**
     * Gets customerOrders value
     *
     * @return Set
     */
    public Set<CustomerOrder> getCustomerOrders() {
        return this.customerOrders;
    }

    /**
     * Sets customerOrders value
     *
     * @param customerOrders
     * @return Employee
     */
    public Employee setCustomerOrders(Set<CustomerOrder> customerOrders) {
        this.customerOrders = customerOrders;
        return this;
    }

    /**
     * TODO Auto-generated method documentation
     *
     * @return String
     */
    public String toString() {
        return "Employee {" + "firstName='" + firstName + '\'' + ", lastName='" + lastName + '\'' + ", title='" + title + '\'' + ", birthDate='" + birthDate == null ? null : java.text.DateFormat.getDateTimeInstance().format(birthDate.getTime()) + '\'' + ", hireDate='" + hireDate == null ? null : java.text.DateFormat.getDateTimeInstance().format(hireDate.getTime()) + '\'' + ", extension='" + extension + '\'' + ", photo='" + photo + '\'' + ", notes='" + notes + '\'' + "}" + super.toString();
    }

    /**
     * TODO Auto-generated method documentation
     *
     * @param purchaseOrdersToAdd
     */
    public void addToPurchaseOrders(Iterable<PurchaseOrder> purchaseOrdersToAdd) {
        Assert.notNull(purchaseOrdersToAdd, ITERABLE_TO_ADD_CANT_BE_NULL_MESSAGE);
        for (PurchaseOrder item : purchaseOrdersToAdd) {
            this.purchaseOrders.add(item);
            item.setEmployee(this);
        }
    }

    /**
     * TODO Auto-generated method documentation
     *
     * @param purchaseOrdersToRemove
     */
    public void removeFromPurchaseOrders(Iterable<PurchaseOrder> purchaseOrdersToRemove) {
        Assert.notNull(purchaseOrdersToRemove, ITERABLE_TO_REMOVE_CANT_BE_NULL_MESSAGE);
        for (PurchaseOrder item : purchaseOrdersToRemove) {
            this.purchaseOrders.remove(item);
            item.setEmployee(null);
        }
    }

    /**
     * TODO Auto-generated method documentation
     *
     * @param customerOrdersToAdd
     */
    public void addToCustomerOrders(Iterable<CustomerOrder> customerOrdersToAdd) {
        Assert.notNull(customerOrdersToAdd, ITERABLE_TO_ADD_CANT_BE_NULL_MESSAGE);
        for (CustomerOrder item : customerOrdersToAdd) {
            this.customerOrders.add(item);
            item.setEmployee(this);
        }
    }

    /**
     * TODO Auto-generated method documentation
     *
     * @param customerOrdersToRemove
     */
    public void removeFromCustomerOrders(Iterable<CustomerOrder> customerOrdersToRemove) {
        Assert.notNull(customerOrdersToRemove, ITERABLE_TO_REMOVE_CANT_BE_NULL_MESSAGE);
        for (CustomerOrder item : customerOrdersToRemove) {
            this.customerOrders.remove(item);
            item.setEmployee(null);
        }
    }
}
