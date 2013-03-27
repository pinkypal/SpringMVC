<%@ include file="../../../includes/_tagLibs.jsp" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Define Enrollment Period</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
 <meta content="employerLayout" name="decorator">
<meta name="author" content="">
</head>

<body>
	<content tag="breadcrum">
		<li><a href="#" class="disable"><s:message code="layout.breadcrum.defineEnrollmentPeriod" /></a></li>
	</content>
	<parameter name="selectedMenu" value="header_defineEnrollmentPeriod"/>	
    <section>
      <form:form action="${pageContext.request.contextPath}/define-enrollment-period" id="enrollmentPeriodDetail" modelAttribute="enrollmentPeriodDetail" class="form-horizontal" method="post" >
        <div class="form-section">
          <div class="content">
            <fieldset>
              <legend class="hide">Find Plans</legend>
              <!-- Beginning of Main Heading -->
              <header class="sectionHeader">
                <h1 class="pageHeading"><s:message code="label.employer.defineEnrollmentPeriod"/></h1>
                <h2 class="hide">Heading 2</h2>
              </header>
              <!-- End of Main Heading -->
              <section class="contentBlock">
                <p class="labelHead"><s:message code="label.employer.defineEnrollmentPeriod.description"/></p>
                <div class="control-group">
                	<div class="pull-left">
                  		<label for="effective_date"><s:message code="label.employer.defineEnrollmentPeriod.effectiveDate"/><span class="required">*</span></label>
                  		<!--   <input type="text" class="input-medium effective_date marginR10" id="effective_date" path="effective_date"> --> 
                  		  <form:select path="effectiveDate" class="input-medium effective_date marginR10" id="effective_date" items="${effectiveDateMap}">
                                    
                                </form:select> 
                                <form:errors path="effectiveDate" element="div" cssClass="errorControls"  />
                  		  
                	</div>
                </div>
                <div class="control-group">
                	<div class="pull-left marginR100">
                  		<label for="from_date"><s:message code="label.employer.defineEnrollmentPeriod.fromDate"/><span class="required">*</span></label>
                  		<form:input class="input-medium from_date dob marginR10" id="from_date" path="fromDate"/>
                  		<form:errors path="fromDate" element="div" cssClass="errorControls"  />
                	</div>
                    <div class="pull-left">
                  		<label for="to_date"><s:message code="label.employer.defineEnrollmentPeriod.toDate"/><span class="required">*</span></label>
                  		<form:input class="input-medium to_date dob marginR10" id="to_date" path="toDate"/>
                  		<form:errors path="toDate" element="div" cssClass="errorControls"  />
                	</div>
                </div>
              </section>
            </fieldset>
            <div class="control-group marginT10">
              <div class="buttons">
              	<input type="button" value="Cancel" id="cancel" class="btn btn-secondary marginR20"/>
                <input type="submit" id="saveButton" class="btn btn-primary" value="Save"/>
              </div>
            </div>
          </div>
        </div>
      </form:form>
    </section>
    <div id="overlay"></div>
	<div class="popupBox" id="popup">
	  <div class="popupTitle clearfix">
	    <h1 class="popupTitleText pull-left">Enrollment Period has been defined.</h1>
	    <h2 class="hide">LrEoad Plans from Library</h2>
	    <span role="button" class="icon-close-popup closePopUp pull-right"><span class="hide-text">Close</span></span>
	  </div>
	  <div class="popupContent">
	    <button id="js-defineContribution" name="define_contribution" class="btn btn-primary marginR10">Define Contribution</button>
	    <button id="js-manageEmployees" name="manage_employees" class="btn btn-primary marginR10">Manage Employees</button>
	    <button id="js-findPlan" name="find_plan" class="btn btn-primary">Find Plans</button>
	  </div>
	</div>
<script type="text/javascript">
    $(function(){
    	errorIcon();
    	initInputControls($(document));
    	 var validationRules = {},
		validationMessages = {};
		
 		
		validationRules["fromDate"] = {required: true};
		validationMessages["fromDate"] = "Required";
		
		validationRules["toDate"] = {required: true};
		validationMessages["toDate"] = "Required";
		
		validationRules["effectiveDate"] = {required: true};
		validationMessages["effectiveDate"] = "Required";
    	
		$( ".from_date, .to_date" ).datepicker({
            showOn: "button",
            buttonImage: GlobalVars['app_url']+"/images/calender.png",
            buttonImageOnly: true,
			buttonText: "Calender"
        });
    	
   	 $("#enrollmentPeriodDetail").validate({
			rules: validationRules,
			messages:validationMessages,
			errorClass: "error errorAlt",
			errorElement: "div",
			highlight: function(element, errorClass) {
				$(element).addClass(errorClass);
				$(element).siblings('.icon-error').eq('0').fadeIn();
		   },
		   unhighlight: function(element, errorClass) {
			 $(element).removeClass(errorClass);
			 $(element).siblings('.icon-error').fadeOut();
		  },
			submitHandler: function(form) { 
				form.submit();
				 $( "#popup" ).dialog( "open" );
				return true;
			},
			invalidHandler: function() { 
				return false;
			}
		}); 
   	 
   	$(".icon-error").live("mouseover",function(){
		var parent =  $(this).parent('.errorWarp'),
			pos = $(this).position().left + 20;
	  	parent.find('div.error').eq('0').css({
			position: 'absolute',
			left: pos,
			top: 0,
			width: 'auto',
			height: 24,
			lineHeight: '24px',
			whiteSpace: 'nowrap',
			zIndex: 999999,
			border: '1px solid #DDDDDD'
		}).fadeIn('slow');
	});
	$(".icon-error").live("mouseout",function(){
		var parent =  $(this).parent('.errorWarp');
	  	parent.find('div.error').fadeOut('slow',function(){
			parent.find('div.error').removeAttr('style');
		});
	});
	/* 	 $("#cancel").click(function(){
				var url=$(location).attr('href');
				alert(url);
				//var listUrl=url.substring(0,url.indexOf(".com")+4)+"/employer/employees/list";
				//$(location).attr('href',listUrl);
			}); */ 
			
			
	$('#popup').dialog({
		autoOpen: false,
		modal: true,
		position: ['center',55],
		width: 500
	});

	$( ".closePopUp" ).click(function() {
		$( "#popup" ).dialog('close');
	});	
			
    }); 
    
    function initInputControls(parent){
		var errorControls = parent.find(".errorControls");
		if(errorControls.length) {
			$(errorControls).each(function(){
				var id=$(this).attr('id');
				errorControls.errorControls({
					id:id
				});
			})
			
		};
	}
    
    function errorIcon(){
		$('input, select, textarea').wrap('<span class="errorWarp"></span>').parent().append('<span class="icon icon-error"></span>');
		$('input.dob').siblings('.icon-error').css('right', -20);
		$('input[type=radio],input[type=checkbox]').each(function(index, element) {
			$(this).siblings('.icon-error').css('right', -($(this).parent().next().width()+21));
		});
		$('select').each(function(index, element) {
			$(this).siblings('.icon-error').css('right', -($(this).parent().next().width()+18));
		});
	}
</script>
</body>


</html>