// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.bookstore.web;

import com.springsource.roo.bookstore.domain.Categories;
import com.springsource.roo.bookstore.web.CategoriesController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect CategoriesController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CategoriesController.create(@Valid Categories categories, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, categories);
            return "categorieses/create";
        }
        uiModel.asMap().clear();
        categories.persist();
        return "redirect:/categorieses/" + encodeUrlPathSegment(categories.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CategoriesController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Categories());
        return "categorieses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String CategoriesController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("categories", Categories.findCategories(id));
        uiModel.addAttribute("itemId", id);
        return "categorieses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CategoriesController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("categorieses", Categories.findCategoriesEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Categories.countCategorieses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("categorieses", Categories.findAllCategorieses(sortFieldName, sortOrder));
        }
        return "categorieses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CategoriesController.update(@Valid Categories categories, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, categories);
            return "categorieses/update";
        }
        uiModel.asMap().clear();
        categories.merge();
        return "redirect:/categorieses/" + encodeUrlPathSegment(categories.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String CategoriesController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Categories.findCategories(id));
        return "categorieses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String CategoriesController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Categories categories = Categories.findCategories(id);
        categories.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/categorieses";
    }
    
    void CategoriesController.populateEditForm(Model uiModel, Categories categories) {
        uiModel.addAttribute("categories", categories);
    }
    
    String CategoriesController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}