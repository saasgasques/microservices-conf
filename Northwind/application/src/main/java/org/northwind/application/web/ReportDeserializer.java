package org.northwind.application.web;
import org.northwind.model.Report;
import org.northwind.service.api.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.jackson.JsonObjectDeserializer;
import org.springframework.context.annotation.Lazy;
import org.springframework.core.convert.ConversionService;
import org.springframework.roo.addon.web.mvc.controller.annotations.config.RooDeserializer;

/**
 * = ReportDeserializer
 *
 * TODO Auto-generated class documentation
 *
 */
@RooDeserializer(entity = Report.class)
public class ReportDeserializer extends JsonObjectDeserializer<Report> {

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ReportService reportService;

    /**
     * TODO Auto-generated attribute documentation
     *
     */
    private ConversionService conversionService;

    /**
     * TODO Auto-generated constructor documentation
     *
     * @param reportService
     * @param conversionService
     */
    @Autowired
    public ReportDeserializer(@Lazy ReportService reportService, ConversionService conversionService) {
        this.reportService = reportService;
        this.conversionService = conversionService;
    }
}
