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
</head>

<body>
	<content tag="breadcrum">
		<li><a href="${pageContext.request.contextPath}/employees/list"><s:message code="layout.breadcrum.manageEmployee" /></a></li>
		<li> &gt; </li>	
		<li><a href="#" class="disable"><s:message code="layout.breadcrum.viewEmployeeDetails" /></a></li>
	</content>	
	<parameter name="selectedMenu" value="header_manageEmployee"/> 
<!-- Beginning of Main Article -->
<article class="mainArticle">
  <div class="container"> 
    
    <section class="manageEmployee">
        <form id="signupForm" class="form-horizontal" method="get">
          <div class="form-section">
            <div class="content contentAlt">
              <fieldset class="noBorder">
                <legend class="hide"><s:message code="label.employer.addEmployee.viewEmployee"/></legend>
                <!-- Beginning of Main Heading -->
                <header class="sectionHeader">
                  <h1 class="pageHeading"><s:message code="label.employer.addEmployee.viewEmployeeDetails"/></h1>
                  <h2 class="hide"><s:message code="label.employer.addEmployee.heading2"/></h2>
                </header>
                <!-- End of Main Heading -->
                <div class="contentBlock">
                  <div class="editDetailsBox">
                    <h3><s:message code="label.employer.addEmployee.personalDetails"/></h3>
                    <div class="control-group">
                    	<div class="pull-left">
                            <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.name"/></span>
                            <span class="fixed-widthAlt">${employeeDetail.employee.nameSuffix } ${employeeDetail.employee.firstName} ${employeeDetail.employee.middleName } ${employeeDetail.employee.lastName }</span>
                        </div>                        
                    </div>
                    <div class="control-group">
                        <div class="pull-left">
                            <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.dob"/></span>
                            <span class="fixed-widthAlt"><fmt:formatDate pattern="MM/dd/yyyy" value="${employeeDetail.employee.dob }" /></span>
                        </div>
                        <div class="pull-right">
                            <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.smoker"/></span>
                            <span class="fixed-widthAlt">${employeeDetail.employee.isTobbacoUser }</span>
                        </div>                        
                    </div>
                    <div class="control-group gutterB20 seperator">
                        <div class="pull-left">
                            <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.gender"/></span>
                            <span class="fixed-widthAlt">${employeeDetail.employee.gender }</span>
                        </div>                        
                    </div>
                    <div class="control-group">
                    	<div class="pull-left">
                            <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.familyMember"/></span>
                            <span class="fixed-widthAlt">${employeeDetail.familyMembers[0].relationship}</span>
                        </div>                        
                    </div>
                    <div class="control-group">
                    	<div class="pull-left">
                            <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.name"/></span>
                            <span class="fixed-widthAlt">${employeeDetail.familyMembers[0].suffix}${employeeDetail.familyMembers[0].firstName}${employeeDetail.familyMembers[0].middleName}${employeeDetail.familyMembers[0].lastName}</span>
                        </div>                        
                    </div>
                    <div class="control-group">
                        <div class="pull-left">
                            <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.dob"/></span>
                            <span class="fixed-widthAlt"><fmt:formatDate pattern="MM/dd/yyyy" value="${employeeDetail.familyMembers[0].dob}" /></span>
                        </div>
                        <div class="pull-right">
                            <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.smoker"/></span>
                            <span class="fixed-widthAlt">${employeeDetail.familyMembers[0].istobaccoUser}</span>
                        </div>                        
                    </div>
                    <div class="control-group gutterB20 seperator">
                        <div class="pull-left">
                            <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.gender"/></span>
                            <span class="fixed-widthAlt">${employeeDetail.familyMembers[0].gender}</span>
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
	                       		 <div class="control-group">
			                    	<div class="pull-left">
			                            <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.familyMember"/></span>
			                            <span class="fixed-widthAlt">${employeeDetail.familyMembers[loop.index].relationship}</span>
			                        </div>                        
				                    </div>
				                    <div class="control-group">
				                    	<div class="pull-left">
				                            <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.name"/></span>
				                            <span class="fixed-widthAlt">${employeeDetail.familyMembers[loop.index].suffix}${employeeDetail.familyMembers[loop.index].firstName}${employeeDetail.familyMembers[loop.index].middleName}${employeeDetail.familyMembers[loop.index].lastName}</span>
				                        </div>                        
				                    </div>
				                    <div class="control-group">
				                        <div class="pull-left">
				                            <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.dob"/></span>
				                            <span class="fixed-widthAlt"><fmt:formatDate pattern="MM/dd/yyyy" value="${employeeDetail.familyMembers[loop.index].dob}" /></span>
				                        </div>
				                        <div class="pull-right">
				                            <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.smoker"/></span>
				                            <span class="fixed-widthAlt">${employeeDetail.familyMembers[loop.index].istobaccoUser}</span>
				                        </div>                        
				                    </div>
				                    <div class="control-group gutterB20 seperator">
				                        <div class="pull-left">
				                            <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.gender"/></span>
				                            <span class="fixed-widthAlt">${employeeDetail.familyMembers[loop.index].gender}</span>
				                        </div>                        
				                   </div>
	                       </c:forEach>
	                   </c:if>
                    <h3><s:message code="label.employer.addEmployee.jobDetails"/></h3>
                    <div class="control-group">
                      <div class="pull-left">
                      	<span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.employeeCode"/></span>
                        <span class="fixed-widthAlt">${employeeDetail.employee.employeeCode }</span>
                      </div>
                      <div class="pull-right">
                      	<span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.ssn"/></span>
                        <span class="fixed-widthAlt">${employeeDetail.employee.ssn }</span>
                      </div>
                    </div>
                    <div class="control-group">
                      <div class="pull-left">
                      	<span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.dateOfHire"/></span>
                        <span class="fixed-widthAlt"><fmt:formatDate pattern="MM/dd/yyyy" value="${employeeDetail.employee.hireDate }" /></span>
                      </div>
                      <div class="pull-right">
                      	<span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.employmentType"/></span>
                        <span class="fixed-widthAlt">${employeeDetail.employee.employmentType }</span>
                      </div>
                    </div>
                    <div class="control-group">
                      <div class="pull-left">
                      	<span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.annualSalary"/></span>
                        <span class="fixed-widthAlt">$${employeeDetail.employee.annualSalary }</span>
                      </div>
                      <div class="pull-right">
                      	<span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.segment"/></span>
                        <span class="fixed-widthAlt">Segment Name 1</span>
                      </div>
                    </div>
                    <div class="control-group">
                    	<div class="pull-left">
                          <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.status"/></span>
                          <span class="fixed-widthAlt">${employeeDetail.employee.status }</span>
                      	</div>
                    </div>
                    <h3><s:message code="label.employer.addEmployee.contactDetails"/>s</h3>
                    <div class="control-group">
                      <span class="fixed-widthAlt boldTxt"><s:message code="label.employer.addEmployee.prefferedContactMode"/></span>
                      <span class="fixed-widthAlt">${employeeDetail.employee.prefferedContactMode }</span>
                    </div>
                    <div class="control-group">
                      <div class="pull-left">
                      	<span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.email"/></span>
                        <span class="fixed-widthAlt">${employeeDetail.employee.email }</span>
                      </div>
                      <div class="pull-right">
                      	<span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.phone"/></span>
                        <span class="fixed-widthAlt">${employeeDetail.employee.address.phoneNumber }</span>
                      </div>
                    </div>
                    <div class="control-group">
                      <div class="pull-left">
                      	<span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.address1"/></span>
                        <span class="fixed-widthAlt">${employeeDetail.employee.address.streetAddressLine1 }</span>
                      </div>
                      <div class="pull-right">
                        <span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.address2"/></span>
                        <span class="fixed-widthAlt">${employeeDetail.employee.address.streetAddressLine2 }</span>
                      </div>
                    </div>
                    <div class="control-group">
                      <div class="pull-left">
                      	<span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.city"/></span>
                        <span class="fixed-widthAlt">${employeeDetail.employee.address.city }</span>
                      </div>
                      <div class="pull-right">
                      	<span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.state"/></span>
                        <span class="fixed-widthAlt">${employeeDetail.employee.address.state }</span>
                      </div>
                    </div>
                    <div class="control-group">
                      <div class="pull-left">
                      	<span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.zip"/></span>
                        <span class="fixed-widthAlt">${employeeDetail.employee.address.zip }</span>
                      </div>
                      <div class="pull-right ">
                      	<span class="fixed-width boldTxt"><s:message code="label.employer.addEmployee.county"/></span>
                        <span class="fixed-widthAlt">${employeeDetail.employee.address.county }</span>
                      </div>
                    </div>
                  </div>
                </div>
              </fieldset>
              <div class="control-group">
              	<div class="buttons">
                	<input type="button" id="back" class="btn btn-secondary marginR20" value="Back">
                    <input type="button" id="edit" class="btn btn-primary" value="Edit">                    
                </div>
              </div>
            </div>
          </div>
        </form>
    </section>
  </div>
</article>
<!-- End of Main Article --> 

<script type="text/javascript">
	$(document).ready(function(){
		ViewEmployee.buttonEvents();
	});
</script>
</body>
</html>