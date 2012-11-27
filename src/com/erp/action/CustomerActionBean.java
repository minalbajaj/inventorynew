    package com.erp.action;

    import net.sourceforge.stripes.action.*;
    import net.sourceforge.stripes.ajax.JavaScriptResolution;
    import com.erp.pojo.Customer;
    import com.erp.constants.PermissionConstants;
    import com.erp.dao.CustomerDao;
    import com.google.inject.Inject;

    import java.util.List;

    import org.apache.log4j.Logger;

    import javax.annotation.security.RolesAllowed;

    /**
    * Created by IntelliJ IDEA.
    * User: Minal
    * Date: Feb 17, 2012
    * Time: 3:37:57 PM
    * To change this template use File | Settings | File Templates.
    */
    @HttpCache(allow = false)
    public class CustomerActionBean extends BaseActionBean{
    @Inject
    protected CustomerDao customerdao;
    public static Logger logger=Logger.getLogger(CustomerActionBean.class);

    List<Customer> customerlst=null;
    private Customer customer;
    public static List<String> customerhlst=null;

    protected String search;
    private String rate;

    private String q;

        public String getRate() {
            return rate;
        }

        public void setRate(String rate) {
            this.rate = rate;
        }

        public String getQ() {
    return q;
    }

    public void setQ(String q) {
    this.q = q;
    }

    public Customer getCustomer() {

    if(id != 0) {

    return customerdao.findById(id);
    }
    return customer;
    }

    public void setCustomer(Customer customer) {
    this.customer = customer;
    }

    public List<Customer> getCustomerlst() {
    return customerlst;
    }

    public void setCustomerlst(List<Customer> customerlst) {
    this.customerlst = customerlst;
    }

    public String getSearch() {
    return search;
    }

    public void setSearch(String search) {
    this.search = search;
    }
    @DefaultHandler
    @RolesAllowed({PermissionConstants.ADD_CUSTOMER})
    //redirect to add customer page
    public Resolution addCustomerLink(){

    return new ForwardResolution("jsp/addCustomer.jsp");
    }

    @RolesAllowed({PermissionConstants.ADD_CUSTOMER})
    //Add a item
    public Resolution addCustomer(){
    customerdao.SaveCustomer(getCustomer());
    getContext().getMessages().add(new LocalizableMessage("/Customer.action.add.success"));
    return new RedirectResolution(CustomerActionBean.class,"addCustomerLink");
    }

    @RolesAllowed({PermissionConstants.DELETE_CUSTOMER})

    public Resolution deleteCustomerLink(){
    logger.info("customer list");
    customerlst=customerdao.getCustomer();
    return new ForwardResolution("jsp/deleteCustomer.jsp");
    }
    @RolesAllowed({PermissionConstants.DELETE_CUSTOMER})
    //Delete customer
    public Resolution delete(){
    customerdao.delete(getCustomer());
    customerlst=customerdao.getCustomer();
    logger.info("deleting customer: "+getCustomer().getFirstName());
    getContext().getMessages().add(new LocalizableMessage("/Customer.action.delete.success"));
    return new ForwardResolution("jsp/deleteCustomer.jsp");
    }
   
    @RolesAllowed({PermissionConstants.UPDATE_CUSTOMER})
    //update customer link
    public Resolution UpdateCustomerLink(){
    customerlst=customerdao.getCustomer();
    return new ForwardResolution("jsp/updateCustomerpage.jsp");
    }
    @RolesAllowed({PermissionConstants.UPDATE_CUSTOMER})
    public Resolution updateCustomer()
    {
    customer=customerdao.findById(getId());
    customerlst=customerdao.getCustomer();
    return new ForwardResolution("jsp/updateCustomerpage.jsp");

    }
    @RolesAllowed({PermissionConstants.UPDATE_CUSTOMER})
    public Resolution update()
    {
         System.out.println("iddddddddddddddd"+getCustomer());
    customerdao.update(getCustomer());
    customerlst=customerdao.getCustomer();
    getContext().getMessages().add(new LocalizableMessage("/Customer.action.update.success"));
    return new RedirectResolution(CustomerActionBean.class,"UpdateCustomerLink");
    }
      public Resolution viewCustomer(){

    customerlst=customerdao.getCustomer();
    return new ForwardResolution("jsp/viewCustomer.jsp");
    }

      public Resolution storeCustomerRate()
      {
         
          customerdao.updateCustomerForRate(id,Integer.parseInt(rate));
          return new JavaScriptResolution(rate);
      }

    }