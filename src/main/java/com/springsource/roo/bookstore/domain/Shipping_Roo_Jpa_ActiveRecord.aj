// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.bookstore.domain;

import com.springsource.roo.bookstore.domain.Shipping;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Shipping_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Shipping.entityManager;
    
    public static final List<String> Shipping.fieldNames4OrderClauseFilter = java.util.Arrays.asList("Name", "Address", "postalCode");
    
    public static final EntityManager Shipping.entityManager() {
        EntityManager em = new Shipping().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Shipping.countShippings() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Shipping o", Long.class).getSingleResult();
    }
    
    public static List<Shipping> Shipping.findAllShippings() {
        return entityManager().createQuery("SELECT o FROM Shipping o", Shipping.class).getResultList();
    }
    
    public static List<Shipping> Shipping.findAllShippings(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Shipping o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Shipping.class).getResultList();
    }
    
    public static Shipping Shipping.findShipping(Long id) {
        if (id == null) return null;
        return entityManager().find(Shipping.class, id);
    }
    
    public static List<Shipping> Shipping.findShippingEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Shipping o", Shipping.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Shipping> Shipping.findShippingEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Shipping o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Shipping.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Shipping.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Shipping.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Shipping attached = Shipping.findShipping(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Shipping.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Shipping.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Shipping Shipping.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Shipping merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
