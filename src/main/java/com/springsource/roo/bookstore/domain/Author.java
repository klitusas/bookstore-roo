package com.springsource.roo.bookstore.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Author {

    /**
     */
    @NotNull
    @Size(min = 2)
    private String name;

    /**
     */
    // private Number age;
    /**
     */
    // private Number ratings;
    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Categories> Categories = new HashSet<Categories>();

    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Books> Books = new HashSet<Books>();

    /**
     */
    private Integer age;

    /**
     */
    private Integer ratings;
}
