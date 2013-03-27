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
	<!-- Put content of breadcrum of here -->
	<content tag="breadcrum">
		<li><a href="#" class="disable"><s:message code="layout.breadcrum.employersRegistration" /></a></li>
	</content>	 
	<!-- selectedMenu is for header menu -->
	<parameter name="selectedMenu" value="header_manageEmployee"/>     
    <!-- breadcrum END -->
<body>
<!-- Header Start -->
<c:set var="numberOfQuestion" value="2"/>

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
    	<form:form id="signupForm" action="${pageContext.request.contextPath}/register/employerDetails" class="form-horizontal" modelAttribute="employer" autocomplete="false">
    	 <form:errors path="" element="div" cssClass="" />
            <div class="form-section">
              <div class="content contentAlt">
                <fieldset class="noBorder">
                  <legend class="hide">User Details</legend>
                  <!-- Beginning of Main Heading -->
                  <header class="sectionHeader marginT10 posRel">
                    <h1 class="pageHeading"><s:message code="label.employer.employerRegistration"/></h1>
                    <h2 class="hide">Heading 2</h2>
                    <span class="font11 requiredAlt">
                    	<s:message code="label.required"/> <span class="required">*</span>
                    </span>
                  </header>
                  <!-- End of Main Heading -->
                  <div class="row-fluid">
                    <h3 class="posRel"><s:message code="label.employer.registerDetailHeaderMessage"/></h3>
                      <div class="control-group gutterT10 marginB20">
                        <div class="pull-left">
                        <s:message code="label.common.firstName" var="firstName"/>
                          <label for="firstName">${firstName}: <span class="required">*</span></label>
                          <form:input path="firstName" type="text" placeholder="${firstName}" class="input-large" />
                          <form:errors path="firstName" for="firstName" element="div" cssClass="error" />
                        </div>
                        <div class="pull-right">
                        <s:message code="label.common.lastName" var="lastName"/>
                          <label for="lastName">${lastName}: <span class="required">*</span></label>
                          <form:input path="lastName" type="text"  placeholder="${lastName}" class="input-large" />
                           <form:errors path="lastName" for="lastName" element="div" cssClass="error" />
                        </div>
                    </div>
                      <div class="control-group marginB20">
                        <div class="pull-left">
                          <s:message code="label.common.emailAddress.placeholder" var="emailPlaceholder"/>
                          <label for="emailId"><s:message code="label.common.emailAddress"/>: <span class="required">*</span></label>
                          <form:input path="emailId" type="text" placeholder="${emailPlaceholder}" class="input-large" />
                          <form:errors path="emailId" for="emailId" element="div" cssClass="error" />
                        </div>
                        <div class="pull-right">
                     	   <s:message code="label.common.userID" var="userId"/>
                          <label for="userId">${userId}: <span class="required">*</span></label>
                          <form:input path="userId" type="text"  placeholder="${userId}" class="input-large" />
                           <form:errors path="userId" for="userId" element="div" cssClass="error" />
                        </div>
                      </div>
                      <div class="control-group marginB20">
                        <div class="pull-left">
                       	  <s:message code="label.common.password" var="password"/>
                          <label for="password">${password}: <span class="required">*</span></label>
                          <form:input path="password" type="password"  placeholder='${password}' class="input-large" />
                           <form:errors path="password" for="password" element="div" cssClass="error" />
                        </div>
                        <div class="pull-right">
                          <s:message code="label.common.confirmPassword" var="confirmPassword"/>
                          <label for="confirmPassword">${confirmPassword}: <span class="required">*</span></label>
                          <form:input path="confirmPassword" type="password" placeholder='${password}' class="input-large" />
                           <form:errors path="confirmPassword" for="confirmPassword" element="div" cssClass="error" />
                        </div>
                      </div>
                      <h3>In case you forgot your registered E-mail or Password</h3>
                     <c:forEach var="i" begin="0" end="${numberOfQuestion - 1}"> 
	                      <div id="questionAnswer${i}" class="control-group marginB20">
	                        <div class="pull-left">
	                          <label for="securityQuestionAnswers[${i}].securityQuestion.id"><s:message code="label.commom.securityQuestion"/> ${i+1}: <span class="required">*</span></label>
	                          <form:select path="securityQuestionAnswers[${i}].securityQuestion.id" id="securityQuestion${i}" data-id="${i}">
	                            <form:option value="">Select</form:option>
	                            <c:forEach items="${securityQuestions}" var="securityQuestion">
	                            	<form:option value="${securityQuestion.id}">${securityQuestion.value}</form:option>
	                            </c:forEach>
	                            <form:option value="custom">--Type your question here--</form:option>
	                          </form:select>
	                          <form:errors path="securityQuestionAnswers[${i}].securityQuestion.id" for="securityQuestionAnswers[${i}].securityQuestion.id" element="div" cssClass="error" />
	                        </div>
	                        <div id="securityAnswer${i}" class="pull-right" >
	                          <s:message code="label.common.answer.placeholder" arguments="${i+1}" var="answerPlaceHolder"/>
	                          <label for="securityQuestionAnswers${i}.securityAnswer"><s:message code="label.common.answer"/> ${i+1}: <span class="required">*</span></label>
	                          <form:input path="securityQuestionAnswers[${i}].securityAnswer" type="password" placeholder='${answerPlaceHolder}' class="input-large"/>
	                          <form:errors path="securityQuestionAnswers[${i}].securityAnswer" for="securityQuestionAnswers[${i}].securityAnswer" element="div" cssClass="error" />
	                        </div>
	                      </div>
	                      <div id="customQuestionAnswer${i}" class="control-group hide">
	                      	<div class="pull-left">
	                      	  <s:message code="label.common.insertQuestion.placeholder" arguments="${i+1}" var="insertQuestionPlaceHolder"/>
	                          <label class="hide-text" for="securityQuestionAnswers[${i}].customSecurityQuestion"><s:message code="label.common.insertSecurityQuestion"/>:</label>
	                          <form:input path="securityQuestionAnswers[${i}].customSecurityQuestion" type="text" placeholder='${insertQuestionPlaceHolder}' class="input-large" data-id="${i}"/>
	                       	  <form:errors path="securityQuestionAnswers[${i}].customSecurityQuestion" for="securityQuestionAnswers[${i}].securityQuestion" element="div" cssClass="error" />
	                        </div>
	                      </div>
                      </c:forEach>
                  </div>
                </fieldset>
                <div class="control-group">
                    <div class="buttons">
                        <input type="submit" value="<s:message code="label.common.createAccount"/>" class="btn btn-primary" id="create_account">
                    </div>
                </div>
              </div>
            </div>
          </form:form>
    </section>

<script type="text/javascript">
	$(document).ready(function() {
		Employer.initializeSecurityQuestionAnswer(${numberOfQuestion});
		Employer.enableRegistrationValidation(${numberOfQuestion});
	});
</script>
</body>
</html>