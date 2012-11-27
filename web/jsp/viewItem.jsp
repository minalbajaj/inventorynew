    <%--
    Created by IntelliJ IDEA.
    User: Minal
    Date: Feb 15, 2012
    Time: 10:06:09 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    
    <s:useActionBean beanclass="com.erp.action.ItemActionBean" var="listofitems" event="pagedirect"></s:useActionBean>
    <% request.setAttribute("itemlst",listofitems.getItemlst());

    %>
    <s:layout-render name="/layout/_base.jsp">
      <s:layout-component name="left-menu">

                 <ul>
                   <li>&nbsp;</li>
                      <li class="left_menu_heading">Item Management</li>
                      <li style="margin-top:35px"><s:link beanclass="com.erp.action.ItemActionBean" event="pagedirect">Add</s:link></li>
                      <li ><s:link beanclass="com.erp.action.ItemActionBean" event="viewitemlink">Update</s:link></li>
                                <li><s:link beanclass="com.erp.action.ItemActionBean" event="deleteitemlink">Delete</s:link></li>
                                   <li><s:link beanclass="com.erp.action.ItemActionBean" event="itemage">Item Age</s:link></li>
                  </ul>

         </s:layout-component>
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.ItemActionBean">
       <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" >View Item</div>
    </td></tr>
   <%-- <tr valign="top"><td align="center">
    <div class="msg"><s:messages/></div>
    </td></tr>--%>
    </table>
   <table class="second_table"  >

       <tr><td> <div class="msg"><s:messages/></div>
    <d:table name="itemlst" id="item1" pagesize="10" class="disp" requestURI="/Item.action">
    <d:column property="itemCode" title="Item Code"/>
    <d:column property="name" title="Item Name"  />
    <d:column property="uom.name" title="UoM" />
    <d:column property="section.name" title="Section" />
            <d:column  title="update">
                 <s:link beanclass="com.erp.action.ItemActionBean" event="getitem"  >
                              <s:param name="id" value="${item1.id}"></s:param>
                                <img src="images/edit-icon.png" />
                       </s:link>

                  </d:column>


    </d:table></td></tr></table>

    </s:form></s:layout-component>
      <s:layout-component name="footer">
             <div  style="border-top:10px solid #ccccff;">&nbsp;</div>

         </s:layout-component>
    </s:layout-render>