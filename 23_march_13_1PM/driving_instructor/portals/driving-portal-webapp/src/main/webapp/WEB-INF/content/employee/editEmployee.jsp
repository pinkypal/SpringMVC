<%@ include file="../../../includes/_tagLibs.jsp" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Blue Sky</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="employerLayout" name="decorator">
<meta name="description" content="">
<meta name="author" content="">
<script type="text/javascript" src="../../js/employer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/handlebars.js"></script> 
</head>

<body>
	<content tag="breadcrum">
		<li><a href="${pageContext.request.contextPath}/employees/list"><s:message code="layout.breadcrum.manageEmployee" /></a></li>
		<li> &gt; </li>	
		<li><a href="#" class="disable"><s:message code="layout.breadcrum.editEmployeeDetails" /></a></li>
	</content>	
	<parameter name="selectedMenu" value="header_manageEmployee"/> 
<jsp:include page="_addDependent.jsp" ></jsp:include>
<!-- Beginning of Main Article -->
<article class="mainArticle">
  <div class="container"> 
  
    <section class="manageEmployee">
     <form:form method="POST" action="${pageContext.request.contextPath}/employees/update" id="employeeForm" modelAttribute="employeeDetail" class="form-horizontal">
          <form:errors path="" element="div" cssClass="" />
          <div class="form-section">
            <div class="content contentAlt">
              <fieldset class="noBorder">
                <legend class="hide"><s:message code="label.employer.addEmployee.addEmployee"/></legend>
                <!-- Beginning of Main Heading -->
                <header class="sectionHeader">
                  <h1 class="pageHeading"><s:message code="label.employer.addEmployee.addEmployee"/></h1>
                  <h2 class="hide"><s:message code="label.employer.addEmployee.heading2"/></h2>
                </header>
                <!-- End of Main Heading -->
                <div class="contentBlock">
                  <div class="editDetailsBox">
                    <h3><s:message code="label.employer.addEmployee.personalDetails"/></h3>
                    <div class="control-group">
                      <div class="pull-left marginR20">
                        <label for="name"><s:message code="label.employer.addEmployee.name"/><span class="required">*</span></label>
                        <form:select items='${nameSuffix}' path="employee.nameSuffix" id="nameSuffix" class="select select-smini" >
                        </form:select>
                        <form:errors path="employee.nameSuffix" element="div" cssClass="errorControls"  />
                      </div>
                      <div class="pull-left gutterR10">
                        <label class="hide" for="first_name"><s:message code="label.employer.addEmployee.firstName"/><span class="required"></span></label>
                        <form:input path="employee.firstName" id="firstName" placeholder="First Name"  class="input-medium" maxlength="15" />
                        <form:errors path="employee.firstName" element="div" cssClass="errorControls"  />
                        <br/>
                      </div>
                      <div class="pull-left gutterR10">
                        <label class="hide" for="middle_name"><s:message code="label.employer.addEmployee.middleName"/><span class="required"></span></label>
                        <form:input path="employee.middleName" id="middleName" placeholder="Middle Name (optional)"  class="input-medium" maxlength="15" />
                        <form:errors path="employee.middleName" element="div" cssClass="errorControls"  />
                      </div>
                      <div class="pull-left">
                        <label class="hide" for="last_name"><s:message code="label.employer.addEmployee.lastName"/><span class="required"></span></label>
                        <form:input path="employee.lastName" id="lastName" placeholder="Last Name"  class="input-medium" maxlength="15" />
                        <form:errors path="employee.lastName" element="div" cssClass="errorControls"  />
                        <br/>
                      </div>
                    </div>
                    <div class="control-group">
                      <div class="pull-left">
                        <label for="date_of_birth"><s:message code="label.employer.addEmployee.dob"/><span class="required">*</span></label>
                        <form:input path="employee.dob" readOnly="true" id="dob"  class="input-medium dob marginR10" maxlength="15" />
                        <form:errors path="employee.dob" element="div" cssClass="errorControls"  />
                      </div>
                      <div class="pull-left inline-form marginL55">
                        <label for="smoker"><s:message code="label.employer.addEmployee.smoker"/></label>
                        <input type="checkbox" name="employee.isTobbacoUser" id="smoker" class="checkbox inline">
                      </div>
                    </div>
                    <div class="control-group inline-form gutterB20 seperator"> <span class="pull-left labelAlt"><s:message code="label.employer.addEmployee.gender"/> <span class="required">*</span></span>
                      <div class="pull-left">
                      	<form:radiobutton path="employee.gender" value="Male"/>
                        <label for="male" class="checkbox inline"><s:message code="label.employer.addEmployee.male"/></label>
                      </div>
                      <div class="pull-left">
                        <form:radiobutton path="employee.gender" value="Female"/>
                        <label for="female" class="checkbox inline"><s:message code="label.employer.addEmployee.female"/></label>
                      </div>
                       <form:errors path="employee.gender" element="div" cssClass="errorControls"  />
                    </div>
                    <div id="familyMemberBoxContainer">
                      <div id="familyMemberBox_0">
	                    <div class="control-group">
	                      <label for="family_member"><s:message code="label.employer.addEmployee.familyMember"/></label>
	                        <form:select items='${familyMemberType}' path="familyMembers[0].relationship" id="relationship_0" class="select-large" >
	                        </form:select>
	                         <a id="remove_0" href="#" class="js-remove hide-text icon-minus-sign removeIcon">Remove</a>
	                    </div>
	                    <div class="control-group">
	                      <div class="pull-left marginR20">
	                        <label for="name_0"><s:message code="label.employer.addEmployee.name"/><span class="required">*</span></label>
	                        <form:select items='${nameSuffix}' path="familyMembers[0].suffix" id="suffix_0" class="select-smini" >
	                        </form:select>
	                      </div>
	                      <div class="pull-left gutterR10">
	                        <label class="hide" for="first_name_0"><s:message code="label.employer.addEmployee.firstName"/><span class="required"></span></label>
	                        <form:input path="familyMembers[0].firstName" id="dep_firstName_0"  placeholder="First Name" class="input-medium" maxlength="15" />
	                        <form:errors path="familyMembers[0].firstName" element="div" cssClass="errorControls"  />
	                      </div>
	                      <div class="pull-left gutterR10">
	                        <label class="hide" for="middle_name_0"><s:message code="label.employer.addEmployee.middleName"/><span class="required"></span></label>
	                        <form:input path="familyMembers[0].middleName" id="dep_middleName_0" placeholder="Middle Name (optional)" class="input-medium" maxlength="15" />
	                        <form:errors path="familyMembers[0].middleName" element="div" cssClass="errorControls"  />
	                      </div>
	                      <div class="pull-left">
	                        <label class="hide" for="last_name_0"><s:message code="label.employer.addEmployee.lastName"/><span class="required"></span></label>
	                        <form:input path="familyMembers[0].lastName" id="dep_lastName_0" placeholder="Last Name" class="input-medium" maxlength="15" />
	                        <form:errors path="familyMembers[0].lastName" element="div" cssClass="errorControls"  />
	                      </div>
	                    </div>
	                    <div class="control-group">
	                      <div class="pull-left">
	                        <label for="date_of_birth_0"><s:message code="label.employer.addEmployee.dob"/><span class="required">*</span></label>
	                        <form:input path="familyMembers[0].dob" readOnly="true" id="dep_dob_0" class="input-medium dob marginR10"/>
	                        <form:errors path="familyMembers[0].dob" element="div" cssClass="errorControls"  />
	                      </div>
	                      <div class="pull-left inline-form marginL55">
	                        <label for="smoker_0"><s:message code="label.employer.addEmployee.smoker"/></label>
	                        <input type="checkbox" name="familyMembers[0].istobaccoUser" id="dep_isTobbacoUser_0" class="checkbox inline">
	                      </div>
	                    </div>
	                    <div class="control-group inline-form marginB20"> <span class="pull-left labelAlt"><s:message code="label.employer.addEmployee.gender"/><span class="required">*</span></span>
	                      <div class="pull-left">
	                      	<form:radiobutton path="familyMembers[0].gender" value="Male"/>
	                        <label for="male_0" class="checkbox inline"><s:message code="label.employer.addEmployee.male"/></label>
	                      </div>
	                      <div class="pull-left">
	                        <form:radiobutton path="familyMembers[0].gender" value="Female"/>
	                        <label for="female_0" class="checkbox inline"><s:message code="label.employer.addEmployee.female"/></label>
	                      </div>
	                       <form:errors path="familyMembers[0].gender" element="div" cssClass="errorControls"  />
	                    </div>
	                    </div>
	                     <c:set var="noOfDependents" value="${fn:length(employeeDetail.familyMembers)}"></c:set>
	                    <c:choose>
	                    <c:when test="${noOfDependents gt 1 }">
	                    <c:set var="startIndex" value="${noOfDependents-1}"></c:set>
	                    </c:when>
	                    <c:otherwise>
	                    <c:set var="startIndex" value="0"></c:set>
	                    </c:otherwise>
	                    </c:choose>
	                    
	                    <c:if test="${startIndex ge 1}">
	                       <c:forEach begin="1" end="${startIndex}" varStatus="loop">
   					<div id="familyMemberBox_${loop.index}">
	                    <div class="control-group">
	                      <label for="family_member"><s:message code="label.employer.addEmployee.familyMember"/></label>
	                        <form:select items='${familyMemberType}' path="familyMembers[${loop.index}].relationship" id="relationship_${loop.index}" class="select-large" >
	                        </form:select>
	                        <a id="remove_${loop.index}" href="#" class="js-remove hide-text icon-minus-sign removeIcon">Remove</a>
	                    </div>
	                    <div class="control-group">
	                      <div class="pull-left marginR10">
	                        <label for="name_${loop.index}"><s:message code="label.employer.addEmployee.name"/><span class="required">*</span></label>
	                        <form:select items='${nameSuffix}' path="familyMembers[${loop.index}].suffix" id="suffix_${loop.index}" class="select-smini" >
	                        </form:select>
	                      </div>
	                      <div class="pull-left gutterR10">
	                        <label class="hide" for="first_name_${loop.index}"><s:message code="label.employer.addEmployee.firstName"/><span class="required"></span></label>
	                        <form:input path="familyMembers[${loop.index}].firstName" id="dep_firstName_${loop.index}"  placeholder="First Name" class="input-medium" maxlength="15" />
	                        <form:errors path="familyMembers[${loop.index}].firstName" element="div" cssClass="errorControls"  />
	                      </div>
	                      <div class="pull-left gutterR10">
	                        <label class="hide" for="middle_name_${loop.index}"><s:message code="label.employer.addEmployee.middleName"/><span class="required"></span></label>
	                        <form:input path="familyMembers[${loop.index}].middleName" id="dep_middleName_${loop.index}" placeholder="Middle Name (optional)" class="input-medium" maxlength="15" />
	                        <form:errors path="familyMembers[${loop.index}].middleName" element="div" cssClass="errorControls"  />
	                      </div>
	                      <div class="pull-left">
	                        <label class="hide" for="last_name_${loop.index}"><s:message code="label.employer.addEmployee.lastName"/><span class="required"></span></label>
	                        <form:input path="familyMembers[${loop.index}].lastName" id="dep_lastName_${loop.index}" placeholder="Last Name" class="input-medium" maxlength="15" />
	                        <form:errors path="familyMembers[${loop.index}].lastName" element="div" cssClass="errorControls"  />
	                      </div>
	                    </div>
	                    <div class="control-group">
	                      <div class="pull-left">
	                        <label for="date_of_birth_${loop.index}"><s:message code="label.employer.addEmployee.dob"/><span class="required">*</span></label>
	                        <form:input path="familyMembers[${loop.index}].dob" readOnly="true" id="dep_dob_${loop.index}" class="input-medium dob marginR10"/>
	                        <form:errors path="familyMembers[${loop.index}].dob" element="div" cssClass="errorControls"  />
	                      </div>
	                      <div class="pull-left inline-form marginL55">
	                        <label for="smoker_${loop.index}"><s:message code="label.employer.addEmployee.smoker"/></label>
	                        <input type="checkbox" name="familyMembers[${loop.index}].istobaccoUser" id="dep_isTobbacoUser_${loop.index}" class="checkbox inline">
	                      </div>
	                    </div>
	                    <div class="control-group inline-form marginB20"> <span class="pull-left labelAlt"><s:message code="label.employer.addEmployee.gender"/> <span class="required">*</span></span>
	                      <div class="pull-left">
	                      	<form:radiobutton path="familyMembers[${loop.index}].gender" value="Male"/>
	                        <label for="male_${loop.index}" class="checkbox inline"><s:message code="label.employer.addEmployee.male"/></label>
	                      </div>
	                      <div class="pull-left">
	                        <form:radiobutton path="familyMembers[${loop.index}].gender" value="Female"/>
	                        <label for="female_${loop.index}" class="checkbox inline"><s:message code="label.employer.addEmployee.female"/></label>
	                      </div>
	                        <form:errors path="familyMembers[${loop.index}].gender" element="div" cssClass="errorControls"  />
	                    </div>
	                    </div>
   							
				</c:forEach>
	             </c:if>
	                    
                   </div>
                    <div class="control-group marginB20"> <a id="addFamilyMember" href="#"><s:message code="label.employer.addEmployee.addFamilyMember"/></a> </div>
                    <h3><s:message code="label.employer.addEmployee.jobDetails"/></h3>
                    <div class="control-group">
                      <div class="pull-left">
                        <label for="employee_code"><s:message code="label.employer.addEmployee.employeeCode"/></label>
                        <form:input path="employee.employeeCode" id="employeeCode" class="input-large" maxlength="15" />
                        <form:errors path="employee.employeeCode" element="div" cssClass="errorControls"  />
                      </div>
                      <div class="pull-right">
                        <label for="ssn"><s:message code="label.employer.addEmployee.ssn"/></label>
                        <!-- <input type="text" name="ssn" id="ssn" class="input-miniAlt marginR10">
                        <label class="hide" for="ssn_0">SSN:</label>
                        <input type="text" name="ssn_0" id="ssn_0" class="input-miniAlt marginR10">
                        <label class="hide" for="ssn_1">SSN:</label>
                        <input type="text" name="ssn_1" id="ssn_1" class="input-miniAlt"> -->
                        <form:input path="employee.ssn" cssClass="ssnControl"/>
                         <form:errors path="employee.ssn" element="div" cssClass="errorControls"  />
                      </div>
                    </div>
                    <div class="control-group">
                      <div class="pull-left">
                        <label for="date_of_hire"><s:message code="label.employer.addEmployee.dateOfHire"/></label>
                        <form:input path="employee.hireDate" readOnly="true" id="hireDate" class="input-medium doh dob marginR10"/>
                        <form:errors path="employee.hireDate" element="div" cssClass="errorControls"  />
                      </div>
                      <div class="pull-right inline-form">
                        <span class="pull-left labelAlt"><s:message code="label.employer.addEmployee.employmentType"/></span>
                        <div class="pull-left">
                        	<form:radiobutton checked="checked" path="employee.employmentType" id="employment_type_PT" value="FULL_TIME"/>
                            <label class="checkbox inline label-emp" for="employment_type_FT"><s:message code="label.employer.addEmployee.fullTime"/></label>
                      	</div>
                        <div class="pull-left">
                        	<form:radiobutton path="employee.employmentType" id="employment_type_PT" value="PART_TIME"/>
                            <label class="checkbox inline label-emp" for="employment_type_PT"><s:message code="label.employer.addEmployee.partTime"/></label>
                      	</div>
                        <div class="pull-left">
                        	<label class="hide" for="hours"><s:message code="label.employer.addEmployee.hours"/></label>
                        	 <form:input path="employee.noOfHours" id="noOfHours" class="input-miniAlt" placeholder="Hours"/>
                        	 <form:errors path="employee.noOfHours" element="div" cssClass="errorControls"  />
                      	</div>
                      </div>
                    </div>
                    <div class="control-group">
                      <div class="pull-left">
                        <label for="annual_salary"><s:message code="label.employer.addEmployee.annualSalary"/></label>
                        <form:input path="employee.annualSalary" id="annualSalary" class="input-large" />
                        <form:errors path="employee.annualSalary" element="div" cssClass="errorControls"  /> 
                      </div>
                      <div class="pull-right">
                        <label for="segment"><s:message code="label.employer.addEmployee.segment"/></label>
                        <%-- <form:select path="employee.segment" id="nameSuffix" class="select-smini" >
                          <option value="">Suffix</option>
                          <option value="mr">Mr.</option>
                          <option value="miss">Miss.</option>
                          <option value="mrs">Mrs.</option>
                        </form:select> --%>
                        <select name="segment" id="segment" class="select-large">
                          <option value="Segment">Segment</option>
                        </select>
                      </div>
                    </div>
                    <%-- <div class="control-group">
                      <label for="status"><s:message code="label.employer.addEmployee.status"/></label>
                      <form:select items='${status}' path="employee.status" id="status" class="select-large" >
                      </form:select>
                    </div> --%>
                    <h3><s:message code="label.employer.addEmployee.contactDetails"/></h3>
                    <div class="control-group inline-form">
                      <div class="pull-left"> <span class="fixed-widthAlt"><s:message code="label.employer.addEmployee.prefferedContactMode"/></span> </div>
                      <div class="pull-left">
                        <form:radiobutton checked="checked" path="employee.prefferedContactMode" id="email" value="Email"/>
                        <label for="email" class="checkbox inline"><s:message code="label.employer.addEmployee.email"/></label>
                      </div>
                      <div class="pull-left">
                        <form:radiobutton path="employee.prefferedContactMode" id="call" value="Call"/>
                        <label for="call" class="checkbox inline"><s:message code="label.employer.addEmployee.call"/></label>
                      </div>
                      <div class="pull-left">
                        <form:radiobutton path="employee.prefferedContactMode" id="sms" value="Sms"/>
                        <label for="sms" class="checkbox inline"><s:message code="label.employer.addEmployee.sms"/></label>
                      </div>
                      <div class="pull-left">
                        <form:radiobutton path="employee.prefferedContactMode" id="mail" value="Mail"/>
                        <label for="mail" class="checkbox inline"><s:message code="label.employer.addEmployee.mail"/></label>
                      </div>
                    </div>
                    <div class="control-group">
                      <div class="pull-left">
                        <label for="email_0"><s:message code="label.employer.addEmployee.email"/></label>
                        <form:input path="employee.email" id="email" class="input-large" />
                        <form:errors path="employee.email" element="div" cssClass="errorControls"  />
                      </div>
                      <div class="pull-right">
                        <label for="phone"><s:message code="label.employer.addEmployee.phone"/></label>
                       <form:input path="employee.address.phoneNumber" cssClass="phoneControl"/>
                         <form:errors path="employee.address.phoneNumber" element="div" cssClass="errorControls"  />
                      </div>
                    </div>
                    <div class="control-group">
                      <div class="pull-left">
                        <label for="addr_line_1"><s:message code="label.employer.addEmployee.address1"/></label>
                        <form:input path="employee.address.streetAddressLine1" id="streetAddressLine1" class="input-large" />
                        <form:errors path="employee.address.streetAddressLine1" element="div" cssClass="errorControls"  />
                      </div>
                      <div class="pull-right">
                        <label for="addr_line_2"><s:message code="label.employer.addEmployee.address2"/></label>
                        <form:input path="employee.address.streetAddressLine2" id="streetAddressLine1" class="input-large" />
                        <form:errors path="employee.address.streetAddressLine2" element="div" cssClass="errorControls"  />
                      </div>
                    </div>
                    <div class="control-group">
                      <div class="pull-left">
                        <label for="city"><s:message code="label.employer.addEmployee.city"/></label>
                        <form:input path="employee.address.city" id="city" class="input-large" />
                        <form:errors path="employee.address.city" element="div" cssClass="errorControls"  />
                      </div>
                      <div class="pull-right">
                        <label for="state"><s:message code="label.employer.addEmployee.state"/></label>
                        <form:input path="employee.address.state" id="state" readOnly="true" class="input-large" />
                        <form:errors path="employee.address.state" element="div" cssClass="errorControls"  />
                      </div>
                    </div>
                    <div class="control-group">
                      <div class="pull-left">
                          <label for="zip_code"><s:message code="label.employer.addEmployee.zip"/></label>
                          <form:input path="employee.address.zip" id="zip" class="input-large" />
                          <form:errors path="employee.address.zip" element="div" cssClass="errorControls"  />
                      </div>
                      <div class="pull-right">
                        <label for="county"><s:message code="label.employer.addEmployee.county"/></label>
                       <%--  <select id="countyDd" name="employee.address.county" class="select-large" style="display:none;" >
	                        </select>
                           <form:input path="employee.address.county" id="county" class="input-large" /> --%>
                            <form:select path="employee.address.county" id="county" class="select-large" >
                       		 </form:select>
                           <form:errors path="employee.address.county" element="div" cssClass="errorControls"  />
                      </div>
                    </div>
                  </div>
                </div>
              </fieldset>
              <div class="control-group marginT20">
             	<input type="hidden" name="code" value="${employeeDetail.employee.employeeCode}" id="code"></input>
                <input type="submit" id="save" class="btn btn-primary marginR20" value="Save">
                <input type="button" id="cancel" class="btn btn-primary" value="Cancel">
              </div>
            </div>
          </div>
       </form:form>
    </section>
  </div>
</article>
<!-- End of Main Article --> 


<script type="text/javascript">
$.validator.setDefaults({
	submitHandler: function() { alert("submitted!"); }
});

$(document).ready(function() {
	$('[placeholder]').placeholder();
	// validate the comment form when it is submitted
	$("#commentForm").validate();
	
});
</script> 
<script type="text/javascript">
	$(document).ready(function(){
		var validationRules = {},validationMessages = {};
		var documentObj = $(document);
		documentObj.data('validationRules',validationRules);
		documentObj.data('validationMessages',validationMessages);
		documentObj.data('messages',messages);
		AddEditEmployee.errorIcon();
		AddEditEmployee.addPageValidations(documentObj);
		AddEditEmployee.checkBoxEvent(documentObj);
		AddEditEmployee.removeFamilyMember(documentObj);
		AddEditEmployee.addDatePicker(documentObj);
		AddEditEmployee.initInputControls($(document));
		AddEditEmployee.addcustomValidation(documentObj);
		AddEditEmployee.addFamilyMember(documentObj);
		AddEditEmployee.zipCountyValidation(documentObj);
		AddEditEmployee.triggerZipCountyValidation(documentObj);
		AddEditEmployee.validateForm(documentObj);
		AddEditEmployee.cancelEvent();
	
	});
	
</script>
</body>
</html>