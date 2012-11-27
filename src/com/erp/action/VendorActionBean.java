    package com.erp.action;

    import net.sourceforge.stripes.action.*;
    import net.sourceforge.stripes.ajax.JavaScriptResolution;
    import com.erp.pojo.Vendor;
    import com.erp.constants.PermissionConstants;
    import com.erp.dao.VendorDao;
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
    public class VendorActionBean extends BaseActionBean{
    @Inject
    protected VendorDao vendordao;
    public static Logger logger=Logger.getLogger(VendorActionBean.class);

    List<Vendor> vendorlst=null;
    private Vendor vendor;
    public static List<String> vendorhlst=null;

    protected String search;
    private String rate;
     private static final String ADDVENDOR="jsp/addVendor.jsp";
    private static final String UPDATEVENDOR="jsp/updateVendorpage.jsp";
    private static final String DELETEVENDOR="jsp/deleteVendor.jsp";
    private static final String VIEWVENDOR="jsp/viewVendor.jsp";
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

    public Vendor getVendor() {
    if(id != 0) {

    return vendordao.findById(id);
    }
    return vendor;
    }

    public void setVendor(Vendor vendor) {
    this.vendor = vendor;
    }

    public List<Vendor> getVendorlst() {
    return vendorlst;
    }

    public void setVendorlst(List<Vendor> vendorlst) {
    this.vendorlst = vendorlst;
    }

    public String getSearch() {
    return search;
    }

    public void setSearch(String search) {
    this.search = search;
    }
    @DefaultHandler
    @RolesAllowed({PermissionConstants.ADD_VENDOR})
    //redirect to add vendor page
    public Resolution addVendorLink(){

    return new ForwardResolution(ADDVENDOR);
    }

    @RolesAllowed({PermissionConstants.ADD_VENDOR})
    //Add a item
    public Resolution addVendor(){
    vendordao.SaveVendor(getVendor());
    getContext().getMessages().add(new LocalizableMessage("/Vendor.action.add.success"));
    return new RedirectResolution(VendorActionBean.class,"addVendorLink");
    }

    @RolesAllowed({PermissionConstants.DELETE_VENDOR})

    public Resolution deleteVendorLink(){
    logger.info("vendor list");
    vendorlst=vendordao.getVendor();
    return new ForwardResolution(DELETEVENDOR);
    }
    @RolesAllowed({PermissionConstants.DELETE_VENDOR})
    //Delete vendor
    public Resolution delete(){
    vendordao.delete(getVendor());
       logger.info("deleting vendor: "+getVendor().getName());
    getContext().getMessages().add(new LocalizableMessage("/Vendor.action.delete.success"));
     return new RedirectResolution(VendorActionBean.class,"deleteVendorLink");
    }
   
        public Resolution viewVendor(){

         vendorlst=vendordao.getVendor();
         return new ForwardResolution(VIEWVENDOR);
         }

    @RolesAllowed({PermissionConstants.UPDATE_VENDOR})
    public Resolution getVendorUpdate()
    {
    vendor=vendordao.findById(getId());
    vendorlst=vendordao.getVendor();
    return new ForwardResolution(UPDATEVENDOR);

    }
    @RolesAllowed({PermissionConstants.UPDATE_VENDOR})
    public Resolution update()
    {
    vendordao.update(getVendor());
    vendorlst=vendordao.getVendor();
    getContext().getMessages().add(new LocalizableMessage("/Vendor.action.update.success"));
    return new RedirectResolution(VendorActionBean.class,"viewVendor");
    }

    

    }
