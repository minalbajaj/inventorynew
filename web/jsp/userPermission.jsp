    <%@ page import="com.erp.enums.EnumModule" %>
    <%--
    Created by IntelliJ IDEA.
    User: Minal
    Date: Feb 17, 2012
    Time: 4:28:07 PM
    To change this template use File | Settings | File Templates.
    --%>
    <%@ include file="/includes/_taglibInclude.jsp" %>
    <link rel="stylesheet" href="css/general.css" type="text/css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css"/>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <script type="text/javascript">



    function jqCheckAll(name)
    {
    if ($('#chk_add').attr('checked') )
    {
    $('#'+name+'[type="checkbox"]' ).attr('checked', true);
    }
    else {
    $('#'+name+'[type="checkbox"]').attr('checked', false);
    }
    }
    function jqCheckAll1(name)  {
    if($('#chk_update').attr('checked'))
    {
    $('#'+name+'[type="checkbox"]').attr('checked', true);
    }
    else {
    $('#'+name+'[type="checkbox"]').attr('checked', false);
    }
    }
    function jqCheckAll2(name){
    if($('#chk_delete').attr('checked'))
    {
    $('#'+name+'[type="checkbox"]' ).attr('checked', true);
    }else{
    $('#'+name+'[type="checkbox"]').attr('checked', false);
    }
    }

    $(document).ready(function(){

    $("#getUserPermissionsById").click(function(){
    if($("#userdropdown").attr("value")=="0"){
    alert("please select a value");
    return false;
    }

    $("#checkGetClicked").attr("value","Y");
    });

    $("#grantUserPermission").click(function(){
    if($("#userdropdown").attr("value")=="0"){
    alert("please select a value");
    return false;
    }else if($("#checkGetClicked").attr("value")=="N"){
    alert("Please click on Get button");
    return false;
    }
    });


    });

    </script>
    <s:useActionBean beanclass="com.erp.action.UserActionBean" var="listofuser" event="userPermissionLink"></s:useActionBean>
    <% request.setAttribute("userlist",listofuser.getUserlst());
    %>
    <s:layout-render name="/layout/_base.jsp">
          <s:layout-component name="left-menu">

                 <ul>
                     <li>&nbsp;</li>
                      <li class="left_menu_heading">Setting</li>
                      <li style="margin-top:35px">  <li> <s:link beanclass="com.erp.action.CompanyActionBean" event="pre">Setup</s:link></li>
                      <li ><s:link beanclass="com.erp.action.UserActionBean" event="addUserLink">User</s:link></li>
                                 <li><s:link beanclass="com.erp.action.PurchaseOrderActionBean" event="termsPageRedirect">Terms & Condition</s:link></li>
                                <li><s:link beanclass="com.erp.action.UserActionBean" event="changePasswordLink">Change Password</s:link></li>
                                   <li><s:link beanclass="com.erp.action.RestoreActionBean" event="restoreItemLink">Restore</s:link> </li>
                  </ul>

         </s:layout-component>
    <s:layout-component name="body">
    <s:form beanclass="com.erp.action.UserActionBean">
  <br>
    <table class="heading_table">

    <tr><td align="left" class="pageheading" valign="top">
      <div class="sub_heading" >Set User Permission</div>
         <div align="right"><s:link beanclass="com.erp.action.UserActionBean" event="addUserLink" class="pageheading_link">Add</s:link>
                                   &nbsp;| &nbsp;    <s:link beanclass="com.erp.action.UserActionBean" event="updateUserLink" class="pageheading_link">Update</s:link>
                                    &nbsp;| &nbsp;    <s:link beanclass="com.erp.action.UserActionBean" event="deleteUserLink" class="pageheading_link">Delete</s:link>
          &nbsp;| &nbsp;    <s:link beanclass="com.erp.action.UserActionBean" event="rolePermissionLink" class="pageheading_link">Role Permission</s:link>
                                    &nbsp;| &nbsp;          <s:link beanclass="com.erp.action.UserActionBean" event="userPermissionLink" class="pageheading_link">User Permission</s:link>
        </div>
    </td></tr>
  <%--  <tr valign="top"><td align="center">&nbsp;
    <div class="msg"><s:messages/></div>
    </td></tr>--%>
    </table>
    <table class="second_table"  >
    <tr>
    <td align="left">
    <table width="100%" border="0" cellspacing="0" cellpadding="0"  align="center">
    <tr><td width="19%" align="left" valign="top">
    <div align="right" style="margin-left: 2px;" class="labels">Select User<span style="color:#FF0000"> *</span></div></td>
    <td width="78%" align="left" valign="top" >
    <s:form beanclass="com.erp.action.UserActionBean" id="getUserPermissions" name="getUserPermissions" method="get">
    <s:select name="id" id="userdropdown" class="dropdown">
    <option value="0">---Select User---</option>
    <c:forEach items="${userlist}" var="userloop" varStatus="loop" >
    <c:choose>
    <c:when test="${actionBean.id eq userloop.user_id}">
    <option value ="<c:out value="${actionBean.id}"/>" selected="selected"> <c:out value="${userloop.username}"/></option>
    </c:when>
    <c:otherwise>
    <option value ="<c:out value="${userloop.user_id}"/>"> <c:out value="${userloop.username}"/></option>
    </c:otherwise>
    </c:choose>
    </c:forEach>
    </s:select>
    <s:hidden name="checkGetClicked" id="checkGetClicked" value="N"/>
    <s:submit id="getUserPermissionsById" name="getUserPermissionsById" class="buttons" value="Get" style="visibility:visible;" onclick="jqCheckAll('chk_Add');jqCheckAll2('chk_Delete');jqCheckAll1('chk_Update');"></s:submit>
    </s:form>

    </td>
    </tr>
    <tr>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
    <tr>
    <td colspan="3"><div style="margin-left:10px;">
        <table width="60%" border="0" cellspacing="0" cellpadding="0"  align="left" id="family">
     <tr class="foreach_table">
    <td width="41%"   class="foreach_table_firstth"><div align="center"><span class="foreach_th_span">Modules Name</span></div></td>
    <td width="19%"   class="foreach_table_th"><div align="center"><span class="foreach_th_span">Add</span>
    <div><input type="checkbox" name="chk_add" id="chk_add" value="chkAdd"   onclick="jqCheckAll('chk_Add');"/></div>
    </div></td>
    <td width="20%"   class="foreach_table_th"><div align="center"><span class="foreach_th_span">Update</span>
    <div><input type="checkbox" name="chk_update" id="chk_update" value="chkUpdate"  onclick="jqCheckAll1('chk_Update');"></div>
    </div></td>
    <td width="20%"   class="foreach_table_th"><div align="center"><span class="foreach_th_span">Delete
    </span>	<div><input type="checkbox" name="chk_delete" id="chk_delete" value="chkDel"   onclick="jqCheckAll2('chk_Delete');"></div></div></td>

    </tr>

    <c:forEach items="<%= EnumModule.values() %>" var="moduleloop" varStatus="loop" >

    <tr id="tabletr">
   <td class="foreach_table_firstth">
    <div class="foreach_table_div">
    <s:text  name="userPermission[${loop.index}].name" value="${moduleloop}" class="labels" readonly="readonly"  style=" border:none; text-align:right;margin-right:2px;width:200px;font-weight:bold; "/>
    </div></td>
    <td class="foreach_table_th"><div class="foreach_table_div">
    <s:checkbox name="userPermission[${loop.index}].add" id="chk_Add" checked="userPermission[${loop.index}].add"/>
    </div></td>
    <td class="foreach_table_th"><div class="foreach_table_div">
    <s:checkbox name="userPermission[${loop.index}].update" id="chk_Update" checked="userPermission[${loop.index}].update"/>
    </div></td>
    <td class="foreach_table_th"><div class="foreach_table_div">
    <s:checkbox name="userPermission[${loop.index}].delete" id="chk_Delete" checked="userPermission[${loop.index}].delete"/>
    </div></td>
    </tr>   </c:forEach>
    </table></div></td>
    </tr>
    <tr>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left" colspan="2"><div align="left">
    <s:submit id="grantUserPermission" name="grantUserPermission" value="Add"></s:submit>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <s:submit name="cancel" value="Cancel"></s:submit>
    </div></td>
    </tr>
    <tr>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    <td align="left">&nbsp;</td>
    </tr>
    </table>
    </td></tr></table>
    </s:form>
    </s:layout-component>
    </s:layout-render>
