<html>
	<head>
 		<meta content="employerLayout" name="decorator">
 		<%@include file="../../../includes/_tagLibs.jsp" %>
	</head>
	<body> 
	<content tag="breadcrum">
		<li><a href="#" class="disable"><s:message code="layout.breadcrum.definecontribution" /></a></li>
	</content> 
	<!-- selectedMenu is for header menu -->
	<parameter name="selectedMenu" value="header_defineContribution"/> 
	<!-- selectedLeftNevigation is for left navigation -->
	<!-- <parameter name="selectedLeftMenu" value="nevigation_manageenrollment"/> -->
	<!-- breadcrum END -->	
	
    <div class="content">
      <fieldset>
        <legend class="hide"><s:message code="label.employee.defineContribution.defineContribution" /></legend>
        <!-- Beginning of Main Heading -->
        <header class="sectionHeader clearfix">
          <h1 class="pageHeading"><s:message code="label.employee.defineContribution.defineContribution" /></h1>
          <div class="labelHead marginT10"><s:message code="label.employee.defineContribution.defineContributionOnTheBasisOfPlanCategory" /></div>
        </header>
        <!-- End of Main Heading -->
        <form:form action="define-contributions" id="defineContributionForm" method="post" modelAttribute="defineContribution" autocomplete="false">
        <section id="tabs" class="marginT20">
        <ul class="tab-section clearfix">
	        <c:forEach items="${defineContribution.productCategoryTypeList}" var="_contribution">          
	            <li id="${_contribution.productType}"><a href="#${_contribution.productType}-tab-content"><s:message code="label.employee.defineContribution.${_contribution.productType}" /></a></li>
	        </c:forEach>       
        
           <li class="pull-right inline-form">
            	<input type="checkbox" name="same_for_all_categories" id="same_for_all_categories" />
                <label for="same_for_all_categories" class="checkbox inline"><s:message code="label.employee.defineContribution.sameForAllProductCategories" /></label>
            </li>        
         </ul>
         
        <c:forEach items="${defineContribution.productCategoryTypeList}" var="contribution" varStatus="i">            
          
          <div class="tab-content" id="${contribution.productType}-tab-content">
            <div class="control-group marginTB20">
              <div class="span2"><span class="labelled boldTxt"><s:message code="label.employee.defineContribution.coverageFor" /></span></div>
              <div class="span2"><span class="labelled boldTxt"><s:message code="label.employee.defineContribution.contribution" /></span></div>
            </div>
            <div class="control-group marginB20">
              <div class="span2 pull-left gutterT5">
              	<form:checkbox id="${contribution.productType}Employee" path="productCategoryTypeList[${i.index}].employee" />
                <label class="checkbox inline" for="employee"><s:message code="label.employee.defineContribution.employee" /></label>
              </div>
              <div class="span2 pull-left">
                <label class="hide" for="employeeContribution"> <s:message code="label.employee.defineContribution.employeesContribution" /></label>
                <form:input disabled="${!contribution.employee}"  id="${contribution.productType}EmployeeTextContribution" path="productCategoryTypeList[${i.index}].employeeContribution" class="input-small" placeholder="00%" />
					<form:errors path="productCategoryTypeList[${i.index}].employeeContribution" for="productCategoryTypeList[${i.index}].employeeContribution" element="div" cssClass="error" />
              </div> 
              <div class="span1 pull-left gutterT5"> <span> <s:message code="label.employee.defineContribution.or" /></span> </div>
              <div class="span2 pull-left">
                <label class="hide" for="annualEmployeeContribution"><s:message code="label.employee.defineContribution.employeesContribution" /></label>                
                <form:input disabled="${!contribution.employee}"  id="${contribution.productType}EmployeeTextAnnualContribution" path="productCategoryTypeList[${i.index}].annualEmployeeContribution" class="input-small" placeholder="$000" />
					<form:errors path="productCategoryTypeList[${i.index}].annualEmployeeContribution" for="productCategoryTypeList[${i.index}].annualEmployeeContribution" element="div" cssClass="error" />
              </div>
              <div class="span3 pull-left gutterT5"> <span class="suffixTxt"> <s:message code="label.employee.defineContribution.annuallyWhichverIsLower" /></span> </div>
            </div>
            <div class="control-group marginB20">
              <div class="span2 pull-left gutterT5">
              	<form:checkbox id="${contribution.productType}Spouse" path="productCategoryTypeList[${i.index}].spouse" />
                <label class="checkbox inline" for="spouse"><s:message code="label.employee.defineContribution.spouse" /></label>
              </div>
              <div class="span2 pull-left">
                <label class="hide" for="spouseContribution"> <s:message code="label.employee.defineContribution.employeesContribution" /></label>
                <form:input disabled="${!contribution.spouse}"  id="${contribution.productType}SpouseTextContribution" path="productCategoryTypeList[${i.index}].spouseContribution" class="input-small" placeholder="00%" />
					<form:errors path="productCategoryTypeList[${i.index}].spouseContribution" for="productCategoryTypeList[${i.index}].spouseContribution" element="div" cssClass="error" />
              </div>
              <div class="span1 pull-left gutterT5"> <span> <s:message code="label.employee.defineContribution.or" /> </span> </div>
              <div class="span2 pull-left">
                <label class="hide" for="annualSpouseContribution"><s:message code="label.employee.defineContribution.employeesContribution" /></label>
                <form:input disabled="${!contribution.spouse}"  id="${contribution.productType}SpouseTextAnnualContribution" path="productCategoryTypeList[${i.index}].annualSpouseContribution" class="input-small" placeholder="$000" />
					<form:errors path="productCategoryTypeList[${i.index}].annualSpouseContribution" for="productCategoryTypeList[${i.index}].annualSpouseContribution" element="div" cssClass="error" />
              </div>
              <div class="span3 pull-left gutterT5"> <span class="suffixTxt"> <s:message code="label.employee.defineContribution.annuallyWhichverIsLower" /></span> </div>
            </div>
            <div class="control-group gutterB40">
              <div class="span2 pull-left gutterT5">
              	<form:checkbox id="${contribution.productType}Dependent" path="productCategoryTypeList[${i.index}].dependent" />
                <label class="checkbox inline" for="dependent"><s:message code="label.employee.defineContribution.dependent" /></label>
              </div>
              <div class="span2 pull-left">
                <label class="hide" for="dependentContribution"><s:message code="label.employee.defineContribution.employeesContribution" /> </label>
                <form:input disabled="${!contribution.dependent}"  id="${contribution.productType}DependentTextContribution" path="productCategoryTypeList[${i.index}].dependentContribution" class="input-small" placeholder="00%" />
					<form:errors path="productCategoryTypeList[${i.index}].dependentContribution" for="productCategoryTypeList[${i.index}].dependentContribution" element="div" cssClass="error" />
              </div>
              <div class="span1 pull-left gutterT5"> <span> <s:message code="label.employee.defineContribution.or" /> </span> </div>
              <div class="span2 pull-left">
                <label class="hide" for="annualDependentContribution"> <s:message code="label.employee.defineContribution.employeesContribution" /></label>
                <form:input disabled="${!contribution.dependent}"  id="${contribution.productType}DependentTextAnnualContribution" path="productCategoryTypeList[${i.index}].annualDependentContribution" class="input-small" placeholder="$000" />
					<form:errors path="productCategoryTypeList[${i.index}].annualDependentContribution" for="productCategoryTypeList[${i.index}].annualDependentContribution" element="div" cssClass="error" />
              </div>
              <div class="span3 pull-left gutterT5"> <span class="suffixTxt"> <s:message code="label.employee.defineContribution.annuallyWhichverIsLower" /></span> </div>
            </div>
            <form:hidden path="productCategoryTypeList[${i.index}].productType"/>
          </div>
          </c:forEach>
        </section>        
          <div class="control-group">
            <div class="buttons">
            	<%-- <input type="button" id="goto" class="btn btn-secondary marginR10" value="<s:message code="label.employee.defineContribution.goToManageEmployees" />" /> --%>
                <input type="submit" class="btn btn-primary" value="<s:message code="label.employee.defineContribution.save" />" />                
            </div>
          </div>
          </form:form>
      </fieldset>
    </div>  
    
    	<%@include file="./_defineContributionSuccessfulNotification.jsp" %>      
    
    <script type="text/javascript">
    $(document).ready(function(){    	
	  	$('[placeholder]').placeholder();

    	$('#tabs').tabs();
    	errorIcon(); 
    	
    	/* Popup related */
    	
    	$('#popup').dialog({
    		autoOpen: false,
    		modal: true,
    		position: ['center',55],
    		width: 500
    	});
    /* 	$( "#js-saveButton" ).click(function() {
    	  $( "#popup" ).dialog( "open" );
    	}); */
    	if(${successfulDefineContribution}){
    		$( "#popup" ).dialog( "open" );
    	}
    	$( ".closePopUp" ).click(function() {
    		$( "#popup" ).dialog('close');
    	});
    	$('#js-enrollmentPeriod').on('click', function(){
    		document.location.href = GlobalVars["app_url"]+'/define-enrollment-period';
    	});
    	$('#js-manageEmployees').on('click', function(){
    		document.location.href = GlobalVars["app_url"]+'/employees/list';
    	});
    	$('#js-findPlan').on('click', function(){
    		document.location.href = GlobalVars["app_url"]+'/plans';
    	});
       	
    /* Popup related END */
    
	// validate signup form on keyup and submit
	$("#defineContributionForm").validate({
		ignore: "",
		rules: {			
			'productCategoryTypeList[0].employeeContribution': {
				required: function(){
					return addRequiredValidation('medicalEmployeeTextContribution','medicalEmployeeTextAnnualContribution');
				},
				range : [0, 100]
			},
			'productCategoryTypeList[1].employeeContribution': {
				required: function(){
					return addRequiredValidation('dentalEmployeeTextContribution','dentalEmployeeTextAnnualContribution');
				},
				range : [0, 100]
			} ,
			'productCategoryTypeList[2].employeeContribution': {
				required: function(){
					return addRequiredValidation('visionEmployeeTextContribution','visionEmployeeTextAnnualContribution');
				},
				range : [0, 100]
			} ,
			'productCategoryTypeList[0].annualEmployeeContribution': {
				required: function(){
					return addRequiredValidation('medicalEmployeeTextContribution','medicalEmployeeTextAnnualContribution');
				},
				number: true
			},
			'productCategoryTypeList[1].annualEmployeeContribution': {
				required: function(){
					return addRequiredValidation('dentalEmployeeTextContribution','dentalEmployeeTextAnnualContribution');
				},
				number: true
			},
			'productCategoryTypeList[2].annualEmployeeContribution': {
				required: function(){
					return addRequiredValidation('visionEmployeeTextContribution','visionEmployeeTextAnnualContribution');
				},
				number: true
			},
			
			'productCategoryTypeList[0].spouseContribution': {
				required: function(){
					return addRequiredValidation('medicalSpouseTextContribution','medicalSpouseTextAnnualContribution');
				},
				range : [0, 100]
			} ,
			'productCategoryTypeList[1].spouseContribution': {
				required: function(){
					return addRequiredValidation('dentalSpouseTextContribution','dentalSpouseTextAnnualContribution');
				},
				range : [0, 100]
			} ,
			'productCategoryTypeList[2].spouseContribution': {
				required: function(){
					return addRequiredValidation('visionSpouseTextContribution','visionSpouseTextAnnualContribution');
				},
				range : [0, 100]
			} ,
			
			'productCategoryTypeList[0].annualSpouseContribution': {
				required: function(){
					return addRequiredValidation('medicalSpouseTextContribution','medicalSpouseTextAnnualContribution');
				},
				number: true
			},
			'productCategoryTypeList[1].annualSpouseContribution': {
				required: function(){
					return addRequiredValidation('dentalSpouseTextContribution','dentalSpouseTextAnnualContribution');
				},
				number: true
			},

			'productCategoryTypeList[2].annualSpouseContribution': {
				required: function(){
					return addRequiredValidation('visionSpouseTextContribution','visionSpouseTextAnnualContribution');
				},
				number: true
			},

			'productCategoryTypeList[0].dependentContribution': {
				required: function(){
					return addRequiredValidation('medicalDependentTextContribution','medicalDependentTextAnnualContribution');
				},
				range : [0, 100]
			} ,
			'productCategoryTypeList[1].dependentContribution': {
				required: function(){
					return addRequiredValidation('dentalDependentTextContribution','dentalDependentTextAnnualContribution');
				},
				range : [0, 100]
			} ,
			'productCategoryTypeList[2].dependentContribution': {
				required: function(){
					return addRequiredValidation('visionDependentTextContribution','visionDependenTextAnnualContribution');
				},
				range : [0, 100]
			} ,
			'productCategoryTypeList[0].annualDependentContribution': {
				required: function(){
					return addRequiredValidation('medicalDependentTextContribution','medicalDependentTextAnnualContribution');
				},
				number: true
			},
			'productCategoryTypeList[1].annualDependentContribution': {
				required: function(){
					return addRequiredValidation('dentalDependentTextContribution','dentalDependentTextAnnualContribution');
				},
				number: true
			},
			'productCategoryTypeList[2].annualDependentContribution': {
				required: function(){					
					return addRequiredValidation('visionDependentTextContribution','visionDependentTextAnnualContribution');
				},
				number: true
			},			
		},
		messages: {
			'productCategoryTypeList[0].employeeContribution': {
				required : "RequiredAndOrOnDependentField.defineContribution.employeeContribution",
				range : "Range.defineContribution.employeeContribution"
			},
			'productCategoryTypeList[1].employeeContribution': {
				required : "RequiredAndOrOnDependentField.defineContribution.employeeContribution",
				range : "Range.defineContribution.employeeContribution"
			} ,
			'productCategoryTypeList[2].employeeContribution': {
				required : "RequiredAndOrOnDependentField.defineContribution.employeeContribution",
				range : "Range.defineContribution.employeeContribution"
			} ,
			'productCategoryTypeList[0].annualEmployeeContribution': {
				required: "RequiredAndOrOnDependentField.defineContribution.annualEmployeeContribution",
				number: "Digits.defineContribution.annualEmployeeContribution"
			},
			'productCategoryTypeList[1].annualEmployeeContribution': {
				required: "RequiredAndOrOnDependentField.defineContribution.annualEmployeeContribution",
				number: "Digits.defineContribution.annualEmployeeContribution"
			},
			'productCategoryTypeList[2].annualEmployeeContribution': {
				required: "RequiredAndOrOnDependentField.defineContribution.annualEmployeeContribution",
				number: "Digits.defineContribution.annualEmployeeContribution"
			},
			
			'productCategoryTypeList[0].spouseContribution': {
				required : "RequiredAndOrOnDependentField.defineContribution.spouseContribution",
				range : "Range.defineContribution.employeeContribution"
			},
			'productCategoryTypeList[1].spouseContribution': {
				required : "RequiredAndOrOnDependentField.defineContribution.spouseContribution",
				range : "Range.defineContribution.employeeContribution"
			} ,
			'productCategoryTypeList[2].spouseContribution': {
				required : "RequiredAndOrOnDependentField.defineContribution.spouseContribution",
				range : "Range.defineContribution.employeeContribution"
			} ,
			'productCategoryTypeList[0].annualSpouseContribution': {
				required: "RequiredAndOrOnDependentField.defineContribution.annualSpouseContribution",
				number: "Digits.defineContribution.annualEmployeeContribution"
			},
			'productCategoryTypeList[1].annualSpouseContribution': {
				required: "RequiredAndOrOnDependentField.defineContribution.annualSpouseContribution",
				number: "Digits.defineContribution.annualEmployeeContribution"
			},
			'productCategoryTypeList[2].annualSpouseContribution': {
				required: "RequiredAndOrOnDependentField.defineContribution.annualSpouseContribution",
				number: "Digits.defineContribution.annualEmployeeContribution"
			},
			'productCategoryTypeList[0].dependentContribution': {
				required : "RequiredAndOrOnDependentField.defineContribution.dependentContribution",
				range : "Range.defineContribution.employeeContribution"
			},
			'productCategoryTypeList[1].dependentContribution': {
				required : "RequiredAndOrOnDependentField.defineContribution.spouseContribution",
				range : "Range.defineContribution.employeeContribution"
			} ,
			'productCategoryTypeList[2].dependentContribution': {
				required : "RequiredAndOrOnDependentField.defineContribution.spouseContribution",
				range : "Range.defineContribution.employeeContribution"
			} ,			
			'productCategoryTypeList[0].annualDependentContribution': {
				required: "RequiredAndOrOnDependentField.defineContribution.annualDependentContribution",
				number: "Digits.defineContribution.annualEmployeeContribution"
			},
			'productCategoryTypeList[1].annualDependentContribution': {
				required: "RequiredAndOrOnDependentField.defineContribution.annualDependentContribution",
				number: "Digits.defineContribution.annualEmployeeContribution"
			},
			'productCategoryTypeList[2].annualDependentContribution': {
				required: "RequiredAndOrOnDependentField.defineContribution.annualDependentContribution",
				number: "Digits.defineContribution.annualEmployeeContribution"
			},			
		},
		errorClass: "error errorAlt",
		errorElement: "div"	,
		highlight: function(element, errorClass) {
			$(element).addClass(errorClass);
			$(element).siblings('.icon-error').eq('0').fadeIn();
	   },
	   unhighlight: function(element, errorClass) {
		 $(element).removeClass(errorClass);
		 $(element).siblings('.icon-error').fadeOut();
	  },
	  invalidHandler: function(form, validator) {              
          //TAB 0
          if(validator.errorList.length>0){
        	  var selectedId = validator.errorList[0].element.id;
				if(selectedId.startsWith("medical")){
					$('#'+($('#medical').attr('aria-labelledby'))).click();
				}else if(selectedId.startsWith("dental")){
					$('#'+($('#dental').attr('aria-labelledby'))).click();
				}else if(selectedId.startsWith("vision")){
					$('#'+($('#vision').attr('aria-labelledby'))).click();
				}        	  
          }
                       
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
	
	
	
    //Handle click event of checkbox
    $('#same_for_all_categories').click(function(){
    	if($(this).attr('checked')){  
    		var selectedTab = '';
    		$('#tabs ul li').each(function(index_,element_){
    			if($(this).hasClass('ui-tabs-active')){
    				selectedTab = element_.id;
    			}
    		});
    		$.each($('#'+selectedTab+'-tab-content input[type=\"checkbox\"]'),function(index,element){ 
    			
    				$("input[id^="+element.id+"Text]").each(function(){
    					applyToAllCategories(element,$(this),selectedTab,$('#'+element.id).attr('checked'));
    				});
    				
    		});
    	}
    });
    
    
    $(':text').change(function(){
    	
    	if($('#same_for_all_categories').attr('checked')){
    		$('#same_for_all_categories').attr('checked',false);
    	}
    	
    });	
	
		$('.tab-content :checkbox').click(function(){
				$('#same_for_all_categories').removeAttr('checked');
				enableDisableFields($(this),$(this).attr('checked'));			
		});
    });
    
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
    
    function enableDisableFields(elementObj, isApplied){
    					
  		$("input[id^="+elementObj.attr("id")+"Text]").each(function(){
  			if(isApplied){
  				$(this).removeAttr('disabled');
  				$(this).removeClass("placeholder");
  			}else{
  				$(this).attr('disabled','disabled');
      			$(this).val('');
      			$(this).addClass("placeholder");
  			}
 		});    		   	   	
    }
    
    function addRequiredValidation(elementId, elementId1){
    	return( $('#'+elementId).val() == '' && $('#'+elementId1).val() == '' );
    }
    
    function applyToAllCategories(element, element1, selectedTab, isElementVisible){
    	//(checkboxObj, currentTextFieldObj, selectedTab, checkedTextBox)
		/* $("#"+element1.id+i).val($("#"+element1.id).val());
		$('#'+element.id+i).attr('checked', 'checked');
		enableDisableFields($('#'+element.id+i),true); */
		switch(selectedTab){
		case 'medical' :
			//TODO 
			copyFieldValue(element.id.replace(selectedTab,"dental"),element1.attr("id"),element1.attr("id").replace(selectedTab,"dental"),isElementVisible);
			copyFieldValue(element.id.replace(selectedTab,"vision"),element1.attr("id"),element1.attr("id").replace(selectedTab,"vision"),isElementVisible);
			
			break;
			
		case 'dental':

			copyFieldValue(element.id.replace(selectedTab,"vision"),element1.attr("id"),element1.attr("id").replace(selectedTab,"vision"),isElementVisible);
			copyFieldValue(element.id.replace(selectedTab,"medical"),element1.attr("id"),element1.attr("id").replace(selectedTab,"medical"),isElementVisible);
			
			break;
			
		case 'vision':

			copyFieldValue(element.id.replace(selectedTab,"dental"),element1.attr("id"),element1.attr("id").replace(selectedTab,"dental"),isElementVisible);
			copyFieldValue(element.id.replace(selectedTab,"medical"),element1.attr("id"),element1.attr("id").replace(selectedTab,"medical"),isElementVisible);
			
			
			break;
		}
    }
	function copyFieldValue(checkBoxId, fromTextFieldId, toTextFieldId, isElementVisible){
		//if(checkBoxId) call only if element exist
		$("#"+toTextFieldId).val($("#"+fromTextFieldId).val());
		if(isElementVisible)
			$('#'+checkBoxId).attr('checked', 'checked');
		else
			$('#'+checkBoxId).removeAttr('checked');
		enableDisableFields($('#'+checkBoxId),isElementVisible);		
	}
	
    </script>
	</body>
</html>