// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.roo.bookstore.domain;

import com.springsource.roo.bookstore.domain.Orders;
import com.springsource.roo.bookstore.domain.OrdersDataOnDemand;
import com.springsource.roo.bookstore.domain.OrdersIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect OrdersIntegrationTest_Roo_IntegrationTest {
    
    declare @type: OrdersIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: OrdersIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: OrdersIntegrationTest: @Transactional;
    
    @Autowired
    OrdersDataOnDemand OrdersIntegrationTest.dod;
    
    @Test
    public void OrdersIntegrationTest.testCountOrderses() {
        Assert.assertNotNull("Data on demand for 'Orders' failed to initialize correctly", dod.getRandomOrders());
        long count = Orders.countOrderses();
        Assert.assertTrue("Counter for 'Orders' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void OrdersIntegrationTest.testFindOrders() {
        Orders obj = dod.getRandomOrders();
        Assert.assertNotNull("Data on demand for 'Orders' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Orders' failed to provide an identifier", id);
        obj = Orders.findOrders(id);
        Assert.assertNotNull("Find method for 'Orders' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Orders' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void OrdersIntegrationTest.testFindAllOrderses() {
        Assert.assertNotNull("Data on demand for 'Orders' failed to initialize correctly", dod.getRandomOrders());
        long count = Orders.countOrderses();
        Assert.assertTrue("Too expensive to perform a find all test for 'Orders', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Orders> result = Orders.findAllOrderses();
        Assert.assertNotNull("Find all method for 'Orders' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Orders' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void OrdersIntegrationTest.testFindOrdersEntries() {
        Assert.assertNotNull("Data on demand for 'Orders' failed to initialize correctly", dod.getRandomOrders());
        long count = Orders.countOrderses();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Orders> result = Orders.findOrdersEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Orders' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Orders' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void OrdersIntegrationTest.testFlush() {
        Orders obj = dod.getRandomOrders();
        Assert.assertNotNull("Data on demand for 'Orders' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Orders' failed to provide an identifier", id);
        obj = Orders.findOrders(id);
        Assert.assertNotNull("Find method for 'Orders' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyOrders(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Orders' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void OrdersIntegrationTest.testMergeUpdate() {
        Orders obj = dod.getRandomOrders();
        Assert.assertNotNull("Data on demand for 'Orders' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Orders' failed to provide an identifier", id);
        obj = Orders.findOrders(id);
        boolean modified =  dod.modifyOrders(obj);
        Integer currentVersion = obj.getVersion();
        Orders merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Orders' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void OrdersIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Orders' failed to initialize correctly", dod.getRandomOrders());
        Orders obj = dod.getNewTransientOrders(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Orders' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Orders' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'Orders' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void OrdersIntegrationTest.testRemove() {
        Orders obj = dod.getRandomOrders();
        Assert.assertNotNull("Data on demand for 'Orders' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Orders' failed to provide an identifier", id);
        obj = Orders.findOrders(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Orders' with identifier '" + id + "'", Orders.findOrders(id));
    }
    
}
