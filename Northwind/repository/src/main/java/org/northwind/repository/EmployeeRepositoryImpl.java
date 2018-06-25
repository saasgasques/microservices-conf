package org.northwind.repository;

import io.springlets.data.jpa.repository.support.QueryDslRepositorySupportExt;
import org.springframework.roo.addon.layers.repository.jpa.annotations.RooJpaRepositoryCustomImpl;
import org.northwind.model.Employee;

/**
 * = EmployeeRepositoryImpl
 *
 * Implementation of EmployeeRepositoryCustom
 *
 */
@RooJpaRepositoryCustomImpl(repository = EmployeeRepositoryCustom.class)
public class EmployeeRepositoryImpl extends QueryDslRepositorySupportExt<Employee> implements EmployeeRepositoryCustom{

    /**
     * Default constructor
     */
    EmployeeRepositoryImpl() {
        super(Employee.class);
    }
}