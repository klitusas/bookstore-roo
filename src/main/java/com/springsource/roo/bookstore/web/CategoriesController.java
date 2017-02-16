package com.springsource.roo.bookstore.web;
import com.springsource.roo.bookstore.domain.Categories;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/categorieses")
@Controller
@RooWebScaffold(path = "categorieses", formBackingObject = Categories.class)
public class CategoriesController {
}
