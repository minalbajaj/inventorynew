package com.erp.dao;

import com.erp.pojo.Customer;
import com.erp.pojo.Item;
import com.erp.dao.BaseDao;
import com.wideplay.warp.persist.Transactional;

import java.util.List;
import java.util.Date;

import org.hibernate.criterion.Restrictions;


/**
 * Created by IntelliJ IDEA.
 * User: Minal
 * Date: Feb 17, 2012
 * Time: 3:38:36 PM
 * To change this template use File | Settings | File Templates.
 */
public class CustomerDao extends BaseDao<Customer,Long>{
    public CustomerDao() {
        super(Customer.class);
    }

    @Transactional
    public boolean SaveCustomer(Customer customer)
    {
        try {
            if(customer!=null){
                if (customer.getCreateDate() == null) customer.setCreateDate(new Date());
                String subname="c";
                String sname= ((String) sessionProvider.get().createQuery("SELECT max(customerCode) FROM Customer WHERE customerCode like '"+subname+"%'").uniqueResult());
                if(sname==null)
                    customer.setCustomerCode(subname+1000);
                else{
                    long l=Long.parseLong(sname.substring(1));
                
                    l=l+1;
                    customer.setCustomerCode(subname+l);
                }
                sessionProvider.get().save(customer);

                return true;
            }else{
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }

    }
    //delete
    @Transactional
    public void delete(Customer customer)  {
        try{

            customer.setDeleted(1);
            sessionProvider.get().update(customer);



        }catch (Exception e){
            e.printStackTrace();

        }
    }
    public Customer findById(Long id){
        return (Customer)sessionProvider.get().createQuery("from Customer where id='"+id+"'").uniqueResult();
    }

    public List getCustomer(){
        return sessionProvider.get().createQuery("from Customer where deleted='0'").list();
    }
    //update
    @Transactional
    public void update(Customer customer)  {
        try{
            sessionProvider.get().update(customer);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public List<Customer> findByName(String fname) {
        return (List<Customer>)sessionProvider.get().createQuery("from Customer where name='"+fname+"'").list();
    }

    public List<String> allCustomer() {
        return sessionProvider.get().createQuery("Select name from Customer where deleted='0'").list();
    }

    public List<Customer> searchByName(String name) {
        return (List<Customer>)sessionProvider.get().createQuery("FROM Customer WHERE name='"+name+"'").list();
    }


    public List<Customer> searchByCustomerId(String customerid) {
        return (List<Customer>)sessionProvider.get().createQuery("FROM Customer WHERE customerCode='"+customerid+"'").list();
    }

    public List<Customer> searchByCustomerProduct(String customerproduct) {
        return (List<Customer>)sessionProvider.get().createQuery("FROM Customer WHERE productSupplied='"+customerproduct+"'").list();
    }

    public List<String> customerIdLst() {
        return sessionProvider.get().createQuery("select customerCode from Customer where deleted='0'").list();
    }
    public List<String> customerProductlst() {
        return sessionProvider.get().createQuery("select distinct productSupplied from Customer where deleted='0'").list();
    }
    @Transactional
    public void updateCustomerForRate(long id, int rate) {
        Customer customer=null;
        Long vid=id;
        customer=(Customer)sessionProvider.get().createCriteria(Customer.class).add(Restrictions.eq("id",vid.intValue())).uniqueResult();
       
        super.save(customer);
    }

    @Transactional
    public List<Customer> getAllDeletedCustomer() {
        return (List<Customer>)sessionProvider.get().createQuery("FROM Customer where deleted='1'").list();
    }

    public void restoreAllCustomer()
    {
        sessionProvider.get().createQuery("UPDATE Customer SET deleted=0 WHERE deleted=1").executeUpdate();
        
    }
    public void restoreCustomer(int id)
    {
        sessionProvider.get().createQuery("UPDATE Customer SET deleted=0 WHERE id="+id).executeUpdate();

    }
}