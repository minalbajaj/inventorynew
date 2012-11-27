    <%--
    Created by IntelliJ IDEA.
    User: Milind
    Date: Feb 17, 2012
    Time: 3:48:01 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    
    <s:useActionBean beanclass="com.erp.action.CustomerActionBean" var="listofcustomer" event="deleteCustomerLink"></s:useActionBean>
    <% request.setAttribute("customerlst",listofcustomer.getCustomerlst());

    %>
    <s:layout-render name="/layout/_base.jsp">
            <s:layout-component name="left-menu">

                 <ul>
                          <li>&nbsp;</li>
                      <li class="left_menu_heading">Customer</li>
                     <li style="margin-top:35px"><s:link beanclass="com.erp.action.CustomerActionBean" event="addCustomerLink">Add</s:link></li>
                                <li><s:link beanclass="com.erp.action.CustomerActionBean" event="viewCustomer">Update</s:link></li>
                                <li><s:link beanclass="com.erp.action.CustomerActionBean" event="deleteCustomerLink">Delete</s:link></li>

                  </ul>

         </s:layout-component>
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.CustomerActionBean">
     <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" >View Customer</div>
    </td></tr>
         <%--   <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
            </td></tr>--%>
    </table>
    <table class="second_table"  >    <tr align="center">
        <td >
  <d:table name="customerlst" id="customer1" pagesize="10" class="disp" varTotals="totals" requestURI="/Customer.action">

    <d:column value="${customer1_rowNum}"  title="No" />


    <d:column property="firstName" title="Customer Name"/>
    <d:column property="addressOne" title="Customer Address One"  />
    <d:column property="addressTwo" title="Customer Address Two"  />
    <d:column property="emailId" title="Email Id" />
    <d:column property="phoneNo" title="Phone Number" />




      <d:column  title="update">
                 <s:link beanclass="com.erp.action.CustomerActionBean" event="getCustomerUpdate"  >
                              <s:param name="id" value="${customer1.id}"></s:param>
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