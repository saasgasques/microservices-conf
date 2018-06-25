package org.northwind.application.web;
import org.northwind.model.Party;
import org.northwind.service.api.PartyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = PartyDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = Party.class)
public class PartyDeserializer extends JsonObjectDeserializer<Party> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private PartyService partyService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param partyService
     * @param conversionService
     */
    @Autowired
    public PartyDeserializer(@Lazy PartyService partyService, ConversionService conversionService) {
        this.partyService = partyService;
        this.conversionService = conversionService;
    }
}
