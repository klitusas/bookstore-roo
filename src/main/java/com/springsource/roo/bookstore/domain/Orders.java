package com.springsource.roo.bookstore.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Orders {

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Books> Books = new HashSet<Books>();

    /**
     */
    @ManyToOne
    private Shipping Shipping;

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
    private Number postalCode;
}
