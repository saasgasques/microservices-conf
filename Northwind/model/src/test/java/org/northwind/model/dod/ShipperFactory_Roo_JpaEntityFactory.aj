// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.northwind.model.dod;

import org.northwind.model.Shipper;
import org.northwind.model.dod.ShipperFactory;

privileged aspect ShipperFactory_Roo_JpaEntityFactory {
    
    /**
     * Creates a new {@link Shipper} with the given index.
     * 
     * @param index position of the Shipper
     * @return a new transient Shipper
     */
    public Shipper ShipperFactory.create(int index) {
        Shipper obj = new Shipper();
        setCompanyName(obj, index);
        setPhone(obj, index);
        return obj;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param obj
     * @param index
     */
    public void ShipperFactory.setCompanyName(Shipper obj, int index) {
        String companyName = "companyName_" + index;
        obj.setCompanyName(companyName);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param obj
     * @param index
     */
    public void ShipperFactory.setPhone(Shipper obj, int index) {
        String phone = "phone_" + index;
        obj.setPhone(phone);
    }
    
}
