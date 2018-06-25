// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.northwind.application.web;

import io.springlets.data.web.validation.GenericValidator;
import io.springlets.web.NotFoundException;
import io.springlets.web.mvc.util.ControllerMethodLinkBuilderFactory;
import io.springlets.web.mvc.util.MethodLinkBuilderFactory;
import io.springlets.web.mvc.util.concurrency.ConcurrencyCallback;
import io.springlets.web.mvc.util.concurrency.ConcurrencyManager;
import io.springlets.web.mvc.util.concurrency.ConcurrencyTemplate;
import java.util.Locale;
import javax.validation.Valid;
import org.northwind.application.web.SuppliersCollectionThymeleafController;
import org.northwind.application.web.SuppliersItemThymeleafController;
import org.northwind.application.web.SuppliersItemThymeleafLinkFactory;
import org.northwind.model.Supplier;
import org.northwind.service.api.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;

privileged aspect SuppliersItemThymeleafController_Roo_Thymeleaf {
    
    declare @type: SuppliersItemThymeleafController: @Controller;
    
    declare @type: SuppliersItemThymeleafController: @RequestMapping(value = "/suppliers/{supplier}", name = "SuppliersItemThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private SupplierService SuppliersItemThymeleafController.supplierService;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MessageSource SuppliersItemThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<SuppliersItemThymeleafController> SuppliersItemThymeleafController.itemLink;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<SuppliersCollectionThymeleafController> SuppliersItemThymeleafController.collectionLink;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private final ConcurrencyTemplate<Supplier> SuppliersItemThymeleafController.concurrencyTemplate = new ConcurrencyTemplate<Supplier>(this);
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param supplierService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public SuppliersItemThymeleafController.new(SupplierService supplierService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        setSupplierService(supplierService);
        setMessageSource(messageSource);
        setItemLink(linkBuilder.of(SuppliersItemThymeleafController.class));
        setCollectionLink(linkBuilder.of(SuppliersCollectionThymeleafController.class));
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return SupplierService
     */
    public SupplierService SuppliersItemThymeleafController.getSupplierService() {
        return supplierService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param supplierService
     */
    public void SuppliersItemThymeleafController.setSupplierService(SupplierService supplierService) {
        this.supplierService = supplierService;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MessageSource
     */
    public MessageSource SuppliersItemThymeleafController.getMessageSource() {
        return messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param messageSource
     */
    public void SuppliersItemThymeleafController.setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<SuppliersItemThymeleafController> SuppliersItemThymeleafController.getItemLink() {
        return itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param itemLink
     */
    public void SuppliersItemThymeleafController.setItemLink(MethodLinkBuilderFactory<SuppliersItemThymeleafController> itemLink) {
        this.itemLink = itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<SuppliersCollectionThymeleafController> SuppliersItemThymeleafController.getCollectionLink() {
        return collectionLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param collectionLink
     */
    public void SuppliersItemThymeleafController.setCollectionLink(MethodLinkBuilderFactory<SuppliersCollectionThymeleafController> collectionLink) {
        this.collectionLink = collectionLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @param locale
     * @param method
     * @return Supplier
     */
    @ModelAttribute
    public Supplier SuppliersItemThymeleafController.getSupplier(@PathVariable("supplier") Long id, Locale locale, HttpMethod method) {
        Supplier supplier = null;
        if (HttpMethod.PUT.equals(method)) {
            supplier = supplierService.findOneForUpdate(id);
        } else {
            supplier = supplierService.findOne(id);
        }
        
        if (supplier == null) {
            String message = messageSource.getMessage("error_NotFound", new Object[] {"Supplier", id}, "The record couldn't be found", locale);
            throw new NotFoundException(message);
        }
        return supplier;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param supplier
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView SuppliersItemThymeleafController.show(@ModelAttribute Supplier supplier, Model model) {
        model.addAttribute("supplier", supplier);
        return new ModelAndView("suppliers/show");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param supplier
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/inline", name = "showInline")
    public ModelAndView SuppliersItemThymeleafController.showInline(@ModelAttribute Supplier supplier, Model model) {
        model.addAttribute("supplier", supplier);
        return new ModelAndView("suppliers/showInline :: inline-content");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void SuppliersItemThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void SuppliersItemThymeleafController.populateForm(Model model) {
        populateFormats(model);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return ConcurrencyTemplate
     */
    public ConcurrencyTemplate<Supplier> SuppliersItemThymeleafController.getConcurrencyTemplate() {
        return concurrencyTemplate;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String SuppliersItemThymeleafController.getModelName() {
        return "supplier";
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return String
     */
    public String SuppliersItemThymeleafController.getEditViewPath() {
        return "suppliers/edit";
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param record
     * @return Integer
     */
    public Integer SuppliersItemThymeleafController.getLastVersion(Supplier record) {
        return getSupplierService().findOne(record.getId()).getVersion();
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param entity
     * @param model
     * @return ModelAndView
     */
    public ModelAndView SuppliersItemThymeleafController.populateAndGetFormView(Supplier entity, Model model) {
        // Populate the form with all the necessary elements
        populateForm(model);
        // Add concurrency attribute to the model to show the concurrency form
        // in the current edit view
        model.addAttribute("concurrency", true);
        // Add the new version value to the model.
        model.addAttribute("newVersion", getLastVersion(entity));
        // Add the current pet values to maintain the values introduced by the user
        model.addAttribute(getModelName(), entity);
        // Return the edit view path
        return new org.springframework.web.servlet.ModelAndView(getEditViewPath(), model.asMap());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param binder
     */
    @InitBinder("supplier")
    public void SuppliersItemThymeleafController.initSupplierBinder(WebDataBinder binder) {
        binder.setDisallowedFields("id");
        // Register validators
        GenericValidator validator = new GenericValidator(Supplier.class, getSupplierService());
        binder.addValidators(validator);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param supplier
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/edit-form", name = "editForm")
    public ModelAndView SuppliersItemThymeleafController.editForm(@ModelAttribute Supplier supplier, Model model) {
        populateForm(model);
        
        model.addAttribute("supplier", supplier);
        return new ModelAndView("suppliers/edit");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param supplier
     * @param result
     * @param version
     * @param concurrencyControl
     * @param model
     * @return ModelAndView
     */
    @PutMapping(name = "update")
    public ModelAndView SuppliersItemThymeleafController.update(@Valid @ModelAttribute Supplier supplier, BindingResult result, @RequestParam("version") Integer version, @RequestParam(value = "concurrency", required = false, defaultValue = "") String concurrencyControl, Model model) {
        // Check if provided form contain errors
        if (result.hasErrors()) {
            populateForm(model);
            return new ModelAndView(getEditViewPath());
        }
        // Create Concurrency Spring Template to ensure that the following code will manage the
        // possible concurrency exceptions that appears and execute the provided coded inside the Spring template.
        // If some concurrency exception appears the template will manage it.
        Supplier savedSupplier = getConcurrencyTemplate().execute(supplier, model, new ConcurrencyCallback<Supplier>() {
            @Override
            public Supplier doInConcurrency(Supplier supplier) throws Exception {
                return getSupplierService().save(supplier);
            }
        });
        UriComponents showURI = getItemLink().to(SuppliersItemThymeleafLinkFactory.SHOW).with("supplier", savedSupplier.getId()).toUri();
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param supplier
     * @return ResponseEntity
     */
    @ResponseBody
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> SuppliersItemThymeleafController.delete(@ModelAttribute Supplier supplier) {
        getSupplierService().delete(supplier);
        return ResponseEntity.ok().build();
    }
    
}
