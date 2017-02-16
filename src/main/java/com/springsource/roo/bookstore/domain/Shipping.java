package com.springsource.roo.bookstore.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Shipping {

    /**
     */
    @NotNull
    @Size(min = 2)
    private String Name;

    /**
     */
    @NotNull
    @Size(min = 2)
    private String Address;

    /**
     */
    private Integer postalCode;
}