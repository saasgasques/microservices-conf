// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.northwind.model.dod;

import org.northwind.model.SoldProduct;
import org.northwind.model.dod.SoldProductFactory;

privileged aspect SoldProductFactory_Roo_JpaEntityFactory {
    
    /**
     * Creates a new {@link SoldProduct} with the given index.
     * 
     * @param index position of the SoldProduct
     * @return a new transient SoldProduct
     */
    public SoldProduct SoldProductFactory.create(int index) {
        SoldProduct obj = new SoldProduct();
        return obj;
    }
    
}