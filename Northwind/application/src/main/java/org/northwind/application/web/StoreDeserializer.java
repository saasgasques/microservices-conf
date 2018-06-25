package org.northwind.application.web;
import org.northwind.model.Store;
import org.northwind.service.api.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = StoreDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = Store.class)
public class StoreDeserializer extends JsonObjectDeserializer<Store> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private StoreService storeService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param storeService
     * @param conversionService
     */
    @Autowired
    public StoreDeserializer(@Lazy StoreService storeService, ConversionService conversionService) {
        this.storeService = storeService;
        this.conversionService = conversionService;
    }
}
