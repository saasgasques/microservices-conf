// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.northwind.application.web;

import io.springlets.web.mvc.util.MethodLinkFactory;
import io.springlets.web.mvc.util.SpringletsMvcUriComponentsBuilder;
import java.util.Map;
import org.northwind.application.web.ShippersSearchThymeleafController;
import org.northwind.application.web.ShippersSearchThymeleafLinkFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.util.UriComponents;

privileged aspect ShippersSearchThymeleafLinkFactory_Roo_LinkFactory {
    
    declare parents: ShippersSearchThymeleafLinkFactory implements MethodLinkFactory<ShippersSearchThymeleafController>;
    
    declare @type: ShippersSearchThymeleafLinkFactory: @Component;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ShippersSearchThymeleafLinkFactory.BYPHONEFORM = "byPhoneForm";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ShippersSearchThymeleafLinkFactory.BYPHONE = "byPhone";
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    public static final String ShippersSearchThymeleafLinkFactory.BYPHONEDT = "byPhoneDt";
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return Class
     */
    public Class<ShippersSearchThymeleafController> ShippersSearchThymeleafLinkFactory.getControllerClass() {
        return ShippersSearchThymeleafController.class;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param methodName
     * @param parameters
     * @param pathVariables
     * @return UriComponents
     */
    public UriComponents ShippersSearchThymeleafLinkFactory.toUri(String methodName, Object[] parameters, Map<String, Object> pathVariables) {
        if (methodName.equals(BYPHONEFORM)) {
            return SpringletsMvcUriComponentsBuilder.fromMethodCall(SpringletsMvcUriComponentsBuilder.on(getControllerClass()).byPhoneForm(null, null)).buildAndExpand(pathVariables);
        }
        if (methodName.equals(BYPHONE)) {
            return SpringletsMvcUriComponentsBuilder.fromMethodCall(SpringletsMvcUriComponentsBuilder.on(getControllerClass()).byPhone(null, null)).buildAndExpand(pathVariables);
        }
        if (methodName.equals(BYPHONEDT)) {
            return SpringletsMvcUriComponentsBuilder.fromMethodCall(SpringletsMvcUriComponentsBuilder.on(getControllerClass()).byPhoneDt(null, null, null, null, null)).buildAndExpand(pathVariables);
        }
        throw new IllegalArgumentException("Invalid method name: " + methodName);
    }
    
}
