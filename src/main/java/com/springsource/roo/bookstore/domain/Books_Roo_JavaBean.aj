// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.bookstore.domain;

import com.springsource.roo.bookstore.domain.Author;
import com.springsource.roo.bookstore.domain.Books;
import com.springsource.roo.bookstore.domain.Categories;
import java.util.Set;

privileged aspect Books_Roo_JavaBean {
    
    public byte[] Books.getImage() {
        return this.image;
    }
    
    public void Books.setImage(byte[] image) {
        this.image = image;
    }
    
    public String Books.getContentType() {
        return this.contentType;
    }
    
    public void Books.setContentType(String contentType) {
        this.contentType = contentType;
    }
    
    public String Books.getTitle() {
        return this.Title;
    }
    
    public void Books.setTitle(String Title) {
        this.Title = Title;
    }
    
    public String Books.getISBN() {
        return this.ISBN;
    }
    
    public void Books.setISBN(String ISBN) {
        this.ISBN = ISBN;
    }
    
    public Set<Categories> Books.getCategories() {
        return this.categories;
    }
    
    public void Books.setCategories(Set<Categories> categories) {
        this.categories = categories;
    }
    
    public Float Books.getCost() {
        return this.Cost;
    }
    
    public void Books.setCost(Float Cost) {
        this.Cost = Cost;
    }
    
    public Integer Books.getQuantity() {
        return this.Quantity;
    }
    
    public void Books.setQuantity(Integer Quantity) {
        this.Quantity = Quantity;
    }
    
    public Author Books.getAuthor() {
        return this.Author;
    }
    
    public void Books.setAuthor(Author Author) {
        this.Author = Author;
    }
    
}