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
import javax.persistence.ManyToOne;
import javax.persistence.*;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findBooksesByTitleLike" })
public class Books {

    @Lob
    @Basic(fetch = FetchType.LAZY)
    private byte[] image;

    private String contentType;

    /**
     */
    @NotNull
    @Size(min = 2)
    private String Title;

    /**
     */
    @NotNull
    @Size(min = 2)
    private String ISBN;

    /**
     */
    /**
     */
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Categories> categories = new HashSet<Categories>();

    /**
     */
    private Float Cost;

    /**
     */
    private Integer Quantity;

    /**
     */
    @ManyToOne
    private Author Author;
}
