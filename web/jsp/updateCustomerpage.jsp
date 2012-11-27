    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <script type="text/javascript">
    $(document).ready(function(){

    $("#getcustomerbutton").click(function(){

    if ($("#customerName").val()=="0"){
    alert("please select the customer name");

    return false;
    }
    });


    var phoneval = /^([0-9]{0,10})$/;

    var emailval =  /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    $("#updtcustomerbutton").click(function(){
    if ($("#updtcustomerfirstName").val().trim() ==""){
    alert("please enter customer firstName.");
    $("#updtcustomerfirstName").focus() ;
    return false;
    }
    if ($("#updtcustomerprdt").val().trim() ==""){
    alert("please enter product supplied.");
    $("#updtcustomerprdt").focus() ;
    return false;
    }

    if ($("#updtcustomeraddr").val().trim() ==""){
    alert("please enter customer address");
    $("#updtcustomeraddr").focus() ;
    return false;
    }
    if ($("#updtcustomerphnno").val().trim() ==""){
    alert("please enter customer phone number.");
    $("#updtcustomerphnno").focus() ;
    return false;
    }
    else
    if(!phoneval.test($('#updtcustomerphnno').val()))
    {
    alert("please give the phone number in number format and upto 10 digits only");
    $("#updtcustomerphnno").val("") ;
    $("#updtcustomerphnno").focus() ;

    return false;
    }

    if(!emailval.test($('#updtcustomeremailid').val()) )
    {
    alert("please give the email address like abc@xyz.com");
    $("#updtcustomeremailid").val("");
    $("#updtcustomeremailid").focus() ;
    return false;
    }


    });
    });

    </script>
    <s:useActionBean beanclass="com.erp.action.CustomerActionBean" var="listofcustomer" event="deleteCustomerLink"></s:useActionBean>
    <% request.setAttribute("customerlst",listofcustomer.getCustomerlst());
    %>
    <s:layout-render name="/layout/_base.jsp">
         <s:layout-component name="left-menu">

                 <ul>
                          <li>&nbsp;</li>
                      <li class="left_menu_heading">Customer</li>
                     <li style="margin-top:35px"><s:link beanclass="com.erp.action.CustomerActionBean" event="addCustomerLink">Add</s:link></li>
                                <li><s:link beanclass="com.erp.action.CustomerActionBean" event="UpdateCustomerLink">Update</s:link></li>
                                <li><s:link beanclass="com.erp.action.CustomerActionBean" event="deleteCustomerLink">Delete</s:link></li>
                  </ul>

         </s:layout-component>
    <s:layout-component name="body">
      <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" >Update Customer</div>
    </td></tr>
   <%-- <tr valign="top"><td align="center"><div class="msg"><s:messages/></div>
    </td></tr>--%>
    </table>


      <table class="second_table"  >   <s:form beanclass="com.erp.action.CustomerActionBean">
       <tr>
    <td align="left">
    <table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center">
         <div class="msg"><s:messages/></div>
        <tr><td width="22%" align="left" valign="top">
    <div align="right" style="margin-left: 1px;" class="labels">Please select Customer Name<span style="color:#FF0000"> *</span></div></td>
    <td width="22%" align="left" valign="top" >
    <s:select id="customerName" name="id"  class="dropdown">
    <option  value="0">---Select Customer---</option>
    <c:forEach items="${customerlst}" var="customer" varStatus="loop" >
    <c:choose>
    <c:when test="${actionBean.customer.firstName eq customer.firstName}">
    <option value ="<c:out value="${actionBean.customer.id}"/>" selected="selected"> <c:out value="${actionBean.customer.firstName}"/></option>
    </c:when>
    <c:otherwise>
    <option value ="${customer.id}"><c:out value="${customer.firstName}"/></option>
    </c:otherwise>
    </c:choose>
    </c:forEach>
    </s:select>
    </td>
    <td align="left" valign="top" colspan="2"> <s:submit name="updateCustomer" class="buttons" id="getcustomerbutton"  value="Get"/>
   </td>
    </tr>        </s:form>
    <c:if test="${actionBean.customer!=null}">
    <s:form beanclass="com.erp.action.CustomerActionBean">



<tr>
<td width="21%" align="left"> <div align="left" style="margin-left: 2px;" class="labels">First Name<span style="color:#FF0000"> *</span></div>     </td>
<td width="16%" align="left" valign="top"><div align="left"><s:text name="customer.firstName" id="addcustomerfirstname" class="textbox"></s:text></div><s:hidden id="updatecustomerid" name="id" class="textbox"></s:hidden> </td>
<td width="21%" align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Address 1</div></td>

<td width="39%" align="left" valign="bottom"><div align="left" ><s:text id="addcustomeraddone"  name="customer.addressOne" class="textbox"></s:text>
<s:hidden name="customer.deleted" value="0"/>
</div></td>



<tr>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Last Name<span style="color:#FF0000"> *</span></div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.lastName" id="addcustomerlastname" class="textbox"></s:text></div></td>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Address 2</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.addressTwo" id="addcustomeraddtwo"  class="textbox"></s:text></div></td>
</tr>
<tr>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Company Name</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.companyName" id="addcustomercompanyname" class="textbox"></s:text></div></td>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">City</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.city" id="addcustomercity"  class="textbox"></s:text></div></td>
</tr>

<tr>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Email Id</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.emailId" id="addcustomeremailid" class="textbox"></s:text></div></td>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">State</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.state" id="addcustomerstate"  class="textbox"></s:text></div></td>
</tr>
<tr>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Phone No</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.phoneNo" id="addcustomerphone" class="textbox"></s:text></div></td>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Country</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.country" id="addcustomercountey"  class="textbox"></s:text></div></td>
</tr>
<tr>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Zip Code</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.zip" id="addcustomerzip" class="textbox"></s:text></div></td>
</tr>
<tr>
<td align="left" valign="top" colspan="4"><div align="left" style="margin-left: 2px;font-weight:bold"  >Bank Details</div></td>

</tr>
<tr>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Account No</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.accountNo" class="textbox"></s:text></div></td>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Account Name</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.accountName" class="textbox"></s:text></div></td>
</tr>
<tr>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Bank</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.bank" class="textbox"></s:text></div></td>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Branch</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.branch" class="textbox"></s:text></div></td>
</tr>
<tr>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">IFSC Code</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.ifscCode" class="textbox"></s:text></div></td>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Sales Tax</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.salestax" id="addcustomersalestax" class="textbox"></s:text></div></td>
</tr>
<tr>  <td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">Service Tax</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.servicetax" id="addcustomerservicetax" class="textbox"></s:text></div></td>
<td align="left" valign="top"><div align="left" style="margin-left: 2px;" class="labels">PAN Number</div></td>
<td align="left" valign="top"><div align="left"><s:text name="customer.panno" id="addcustomerpanno" class="textbox"></s:text></div></td>

</tr>
    <tr><td colspan="4">&nbsp;</td></tr>
    <tr>
    <td >&nbsp;</td>
    <td colspan="2" align="right" valign="top"><div align="left"><s:submit name="update" class="buttons" id="updtcustomerbutton" value="Update"></s:submit>&nbsp;&nbsp;
    <s:reset name="reset" value="Reset" class="buttons"></s:reset>     &nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel" class="buttons"></s:submit></div></td>
    <td >&nbsp;</td>

    </tr>
    </table></td></tr></table>
    </s:form>
    </c:if>
    </s:layout-component>
         
    </s:layout-render>
