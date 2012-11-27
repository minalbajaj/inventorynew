    <%--
    Created by IntelliJ IDEA.
    User: Minal
    Date: Feb 17, 2012
    Time: 3:48:01 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    
    <s:useActionBean beanclass="com.erp.action.VendorActionBean" var="listofvendor" event="deleteVendorLink"></s:useActionBean>
    <% request.setAttribute("vendorlst",listofvendor.getVendorlst());

    %>
    <s:layout-render name="/layout/_base.jsp">
            <s:layout-component name="left-menu">

                 <ul>
                          <li>&nbsp;</li>
                      <li class="left_menu_heading">Vendor</li>
                     <li style="margin-top:35px"><s:link beanclass="com.erp.action.VendorActionBean" event="addVendorLink">Add</s:link></li>
                                <li><s:link beanclass="com.erp.action.VendorActionBean" event="viewVendor">Update</s:link></li>
                                <li><s:link beanclass="com.erp.action.VendorActionBean" event="deleteVendorLink">Delete</s:link></li>

                  </ul>

         </s:layout-component>
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.VendorActionBean">
     <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" >View Vendor</div>
    </td></tr>
         <%--   <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
            </td></tr>--%>
    </table>
    <table class="second_table"  >    <tr align="center">
        <td >
  <d:table name="vendorlst" id="vendor1" pagesize="10" class="disp" varTotals="totals" requestURI="/Vendor.action">

    <d:column value="${vendor1_rowNum}"  title="No" />


    <d:column property="name" title="Vendor Name"/>
    <d:column property="address" title="Vendor Address"  />
    <d:column property="emailId" title="Email Id" />
    <d:column property="phoneNo" title="Phone Number" />

    <d:column property="productSupplied" title="Product Supplied" />


      <d:column  title="update">
                 <s:link beanclass="com.erp.action.VendorActionBean" event="getVendorUpdate"  >
                              <s:param name="id" value="${vendor1.id}"></s:param>
                                <img src="images/edit-icon.png" />
                       </s:link>

                  </d:column>
    </d:table>



    </td></tr></table>


    </s:form></s:layout-component>
     <s:layout-component name="footer">
             <div  style="border-top:10px solid #ccccff;">&nbsp;</div>

         </s:layout-component>
    </s:layout-render>