package com.springsource.roo.bookstore.web;
import com.springsource.roo.bookstore.domain.Shipping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/shippings")
@Controller
@RooWebScaffold(path = "shippings", formBackingObject = Shipping.class)
public class ShippingController {
}
