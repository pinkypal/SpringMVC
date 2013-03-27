<!doctype html>
<html lang="en">
<head>
<meta content="employerLayout" name="decorator">
<%@ include file="../../../includes/_tagLibs.jsp" %>
</head>
<body>
	<!-- Put content of breadcrum of here -->
	<content tag="breadcrum">
		<li><a href="#" class="disable"><s:message code="layout.breadcrum.manageEmployee" /></a></li>
	</content>	 
	<!-- selectedMenu is for header menu -->
	<parameter name="selectedMenu" value="header_manageEmployee"/> 
	<!-- selectedLeftNevigation is for left navigation -->
	<!-- <parameter name="selectedLeftMenu" value="nevigation_manageenrollment"/> -->
	<!-- breadcrum END -->	
<!-- Beginning of Main Article -->
	<div class="content">
    	<fieldset>
          <div class="content contentAlt">
            <fieldset class="noBorder">
              <legend class="hide"><s:message code="label.employer.manageEmployee.userDetails"/></legend>
              <!-- Beginning of Main Heading -->
              <header class="sectionHeader">
                <h1 class="pageHeading"><s:message code="label.employer.manageEmployee.manageEmployees"/></h1>
                <h2 class="hide"><s:message code="label.employer.manageEmployee.heading2"/></h2>
              </header>
              <!-- End of Main Heading -->
              <form id="signupForm" class="form-horizontal" method="get">
              <div class="contentBlock">
                <div class="editDetailsBox">
                  <div class="control-group gutterT10 marginB20">
                    <input type="button" id="add_segment" value="Add Segment" class="btn btn-primary marginR20" />
                    <input type="button" id="add_employee" value="Add Employee" class="btn btn-primary marginR20" />
                    <input type="button" value="Upload Employee List" class="btn btn-primary marginR20" />
                    <a href="#" class="download"><s:message code="label.employer.manageEmployee.downloadTemplate"/></a>
                  </div>
                  <h3><s:message code="label.employer.manageEmployee.searchEmployees"/></h3>
                  <div class="control-group searchBy gutterB20 gutterT10">
                    <div class="pull-left marginR40">
                      <label for="search_by"><s:message code="label.employer.manageEmployee.searchBy"/></label>
                      <select class="input-large" name="search_by" id="search_by">
                      	<c:forEach items="${manageEmployeeSearchType}" var="entry">
                      		 <option value="${entry.key}">${entry.value}</option>
            			</c:forEach>
                      </select>
                    </div>
                    <div class="pull-left marginR20">
                      <label for="keyword"><s:message code="label.employer.manageEmployee.keyword"/></label>
                      <input type="text" name="keyword" id="keyword" class="input-large">
                    </div>
                    <div class="pull-left">
                      <label class="hide-text" for="go"><s:message code="label.employer.manageEmployee.go"/></label>
                      <input type="submit" name="go" id="go" value="GO" class="btn">
                    </div>
                  </div>
                 
                  <h3><s:message code="label.employer.manageEmployee.employeeList"/></h3>
                  <div id="accountManageEmployee" class="marginB20">
	                  	<table class="employeeListTable table table-condensed" id="employeeTable">
	                    <thead>
	                      <tr class="first-row">
	                        <th><s:message code="label.employer.manageEmployee.employeeId"/></th>
	                        <th><s:message code="label.employer.manageEmployee.employeeName"/></th>
	                        <th><s:message code="label.employer.manageEmployee.memberId"/></th>
	                        <th><s:message code="label.employer.manageEmployee.planName"/></th>
	                        <th><s:message code="label.employer.manageEmployee.type"/></th>
	                        <th><s:message code="label.employer.manageEmployee.segment"/> <span class="icon-sorting-down"></span></th>
	                        <th><s:message code="label.employer.manageEmployee.status"/></th>
	                        <th></th>
	                      </tr>
	                    </thead>
	                 
	                  </table>
                  </div>
                </div>
              </div>
              </form>
            </fieldset>
            <div class="controls-row gutterB20">
              <input type="button" id="find_plans" class="btn btn-primary pull-left" value="Find Plans">
              <div class="pagination pagination-mini pagination-right gutterR10 pull-right">
                  <ul id="pagination_ul">
                    <li id="li_1"><a href="#">«</a></li>
                    <li id="li_1"><a href="#">1</a></li>
                    <li id="li_2"><a href="#">2</a></li>
                    <li id="li_3"><a href="#">3</a></li>
                    <li id="li_4"><a href="#">4</a></li>
                    <li id="li_5"><a href="#">5</a></li>
                    <li><a href="#">»</a></li>
                  </ul>
              </div>
            </div>
          </div>
          </fieldset>
       </div>
    </section>
    <!-- End of Main Article --> 

<!-- Pop Section Start -->
   <div id="overlay"></div> 
    <div class="popupBox alertBox" id="popup">
     	<div class="popupContent">
        	<span class="icon-close-popup closePopUp pull-right"><span class="hide-text">Close</span></span>
        	<p>Are you sure you want to delete this employee?</p>
            <div class="control-group">
           		 <input type="hidden" id="employeeId" value=""/>
            	<input type="button" name="" class="btn marginL50 closePopUp" value="Yes" id="yesRemove">
                <input type="button" name="" class="btn marginL10 closePopUp" value="No">                
            </div>
        </div>
     </div>
  
<script type="text/javascript">
$.validator.setDefaults({
	submitHandler: function() { alert("submitted!"); }
});

$().ready(function() {
	// validate the comment form when it is submitted
	$("#commentForm").validate();

	// validate signup form on keyup and submit
	$('#add_segment').click(function(){
		document.location.href = '${pageContext.request.contextPath}/segment';
	});
	
	$('#find_plans').click(function(){
		document.location.href = '${pageContext.request.contextPath}/plans';
	});	
});
</script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			var documentObj = $(document);
			
			ManageEmployees.validateForm(documentObj);
			ManageEmployees.buttonClickEvents(documentObj);
			ManageEmployees.deleteEmployee();
			ManageEmployees.terminateEmployee();
			ManageEmployees.createDataTable(documentObj);	
		});
	</script>
</body>
</html>