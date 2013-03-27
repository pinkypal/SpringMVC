<%--

    Copyright (c) 2009 - 2012 hCentive Inc. All rights reserved.

--%>
<%@ include file="../../../includes/_tagLibs.jsp" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Blue Sky</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta content="employerLayout" name="decorator">
<meta name="author" content="">
</head>

<body>
	<!-- Put content of breadcrum of here -->
	<content tag="breadcrum">
		<li><a href="#" class="disable"><s:message code="layout.breadcrum.companyInformation"/></a></li>
	</content>	 
	<!-- selectedMenu is for header menu -->
	<parameter name="selectedMenu" value="header_manageEmployee"/>     
    <!-- breadcrum END -->
    <!-- Beginning of Registration Steps -->
    <div class="steps clearfix">
        <div class="pull-left">
            <s:message code="label.employer.registerIn"/> <span class="easy"><s:message code="label.employer.threeEasySteps"/></span>
        </div>
        <div class="stepsfollow">
            <ul>
                <li class="done"><span class="icon-circle">1</span><s:message code="label.employer.employerRegistration"/></li>
                <li><span class="icon-circle">2</span><s:message code="label.employer.companyInformation"/></li>
                <li><span class="icon-circle">3</span><s:message code="label.employer.registrationComplete"/></li>
            </ul>
        </div>
    </div>
    <!-- End of Registration Steps -->
    <section class="registrationPage">         
    	<form:form id="signupForm" class="form-horizontal" action="${pageContext.request.contextPath}/register/companyInformation" modelAttribute="organization" autocomplete="false">
           <form:errors path="" element="div" cssClass="" />
            <div class="form-section">
              <div class="content contentAlt">
                <fieldset class="noBorder">
                  <legend class="hide">User Details</legend>
                  <!-- Beginning of Main Heading -->
                  <header class="sectionHeader marginT10 posRel">
                    <h1 class="pageHeading"><s:message code="label.employer.companyInformation"/></h1>
                    <h2 class="hide">Heading 2</h2>
                    <span class="font11 requiredAlt">
                    	<s:message code="label.required"/> <span class="required">*</span>
                    </span>
                  </header>
                  <!-- End of Main Heading -->
                  <div class="row-fluid">
                    <h3 class="posRel"><s:message code="label.employer.companyDetailHeaderMessage"/> </h3>
                      <div class="control-group gutterT10 marginB20">
                    <div class="pull-left">
                      <label for="legalCompanyName" class="lineHeight16"><s:message code="label.employer.companyName"/>: <span class="required">*</span></label>
                      <form:input path="companyName" type="text" class="input-large" placeholder="ABCD Corp"/>
                      <form:errors path="companyName" element="div" cssClass="error" />
                    </div>
                    <div class="pull-right">
                      <label class="lineHeight16" for="companyName"><s:message code="label.employer.companyNameDBA"/>: <span class="required">*</span></label>
                      <form:input path="companyNameDBA" type="text" class="input-large" placeholder="ABCD Corp" />
                      <form:errors path="companyNameDBA" element="div" cssClass="error" />
                    </div>
                  </div>
                  	  <div class="control-group marginB20">
                    <div class="pull-left">
                      <label for="yearOfIncorporation"><s:message code="label.employer.yearOfIncorporation"/>: <span class="required">*</span></label>
                      <form:input path="yearOfIncorporation" class="input-large" />
                      <form:errors path="yearOfIncorporation" element="div" cssClass="error" />
                    </div>
                    <div class="pull-right">
                      <label class="lineHeight16" for="employerIdentificationNumber"><s:message code="label.employer.employerIdentificationNumber"/>: <span class="required">*</span></label>
                      <form:input path="employerIdentificationNumber" type="text" class="input-large placeholder" placeholder="New3456" />
                       <form:errors path="employerIdentificationNumber" element="div" cssClass="error" />
                    </div>
                  </div>
                  	  <div class="control-group gutterB30 seperator">
                    <div class="pull-left">
                      <label for="currentFullTimeEmployees" class="lineHeight16"><s:message code="label.employer.currentFullTimeEmployees"/>: <span class="required">*</span></label>
                      <form:input path="currentFullTimeEmployees" class="input-large" />
                       <form:errors path="currentFullTimeEmployees" element="div" cssClass="error" />
                    </div>
                    <div class="pull-right">
                      <label for="fullTimeEmployeeSinceLastYear" class="lineHeight16"><s:message code="label.employer.fullTimeEmployees"/>: <span class="required">*</span><span>(since last year)</span></label>
                      <form:input path="fullTimeEmployeeSinceLastYear" class="input-large" />
                       <form:errors path="fullTimeEmployeeSinceLastYear" element="div" cssClass="error" />
                    </div>
                  </div>
                      <h3><s:message code="label.employer.companyAddressHeaderMessage"/></h3>
                      <div class="control-group gutterT10 marginB20">
                    <div class="pull-left">
                     <s:message code="label.common.address1" var="address1"/>
                      <label for="address.streetAddressLine1">${address1}: <span class="required">*</span></label>
                      <form:input path="address.streetAddressLine1" type="text" class="input-large placeholder" placeholder="${address1}" />
                       <form:errors path="address.streetAddressLine1" element="div" cssClass="error" />
                    </div>
                    <div class="pull-right">
                     <s:message code="label.common.address2"var="address2"/>
                      <label for="address.streetAddressLine2">${address2}: </label>
                      <form:input path="address.streetAddressLine2" type="text" class="input-large placeholder" placeholder="${address2}" />
                       <form:errors path="address.streetAddressLine2" element="div" cssClass="error" />
                    </div>
                  </div>
                  	  <div class="control-group marginB20">
                    <div class="pull-left">
                     <s:message code="label.common.city" var="city"/>
                      <label for="address.city">${city}: <span class="required">*</span></label>
                      <form:input path="address.city" type="text" class="input-large placeholder" placeholder="${city}"/>
                       <form:errors path="address.city" element="div" cssClass="error" />
                    </div>
                    <div class="pull-right">
                     <s:message code="label.common.zip" var="zip"/>
                      <label for="address.zip">${zip}: <span class="required">*</span></label>
                      <form:input path="address.zip" type="text" class="input-large placeholder" placeholder="${zip}" id="zip" maxlength="5"/>
                       <form:errors path="address.zip" element="div" cssClass="error" />
                    </div>
                  </div>
                  <div class="control-group marginB20">
                    <div class="pull-left">
                     <s:message code="label.common.state" var="state"/>
                      <label for="address.state">${state}: <%-- <span class="required">*</span> --%></label>
                      <form:input path="address.state" type="text" id="state" class="input-large placeholder" placeholder="${state}" readonly="true"/>
                       <form:errors path="address.state" element="div" cssClass="error" />                  
                    </div>
                    <div class="pull-right" id="countyHolder" style="display: none;">
                     <s:message code="label.common.county" var="county"/>
                      <label for="address.county">${county}: <span class="required">*</span></label>
                      <form:select path="address.county" class="select-large" id="county">
                      </form:select>
                       <form:errors path="address.county" element="div" cssClass="error" />
                    </div>
                  </div>
                  </div>
                </fieldset>
                <div class="control-group marginT20">
                	<div class="buttons">
                 	 <input type="submit" id="register" class="btn btn-primary" value='<s:message code="label.common.register"/>'>
                 	</div>
                </div>
              </div>
            </div>
          </form:form>
    </section>

<script type="text/javascript">

$(document).ready(function() {
	Utility.initializeZipCountyState("zip", "county", "countyHolder", "state");
	Employer.enableSaveOrganizationValidation();
	$("#zip").keyup();
});
</script>
</body>
</html>