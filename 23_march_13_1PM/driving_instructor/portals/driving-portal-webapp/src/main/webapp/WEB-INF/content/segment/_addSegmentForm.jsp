 <%--

    Copyright (c) 2009 - 2012 hCentive Inc. All rights reserved.

--%>
<%@ include file="../../../includes/_tagLibs.jsp" %>
        <div class='form-section'>
          <div class='content contentAlt'>
            <fieldset class='noBorder'>
              <legend class='hide'>User Details</legend>
              <!-- Beginning of Main Heading -->
              <header class='sectionHeader'>
                <s:message code='add.segment' />
                <h2 class='hide'>Heading 2</h2>
              </header>
              <!-- End of Main Heading -->
              <div class='contentBlock'>
                <div class='editDetailsBox'>
                  <h3><s:message code='segment.details' /></h3>
                  <div class='control-group'>
                      <form:label path='name' for='name'><s:message code='segment.name'/></form:label>
                      <form:input path='name' type='text' name='name' id='name' class='input-xxlarge' maxlength='50'/>
                      <form:errors path='name' cssClass='error' element='div' />
                  </div>
                  <div class='control-group'>
                      <form:label path='description' for='description'><s:message code='segment.description' /></form:label>
                      <form:textarea path='description' name='description' id='description' class='input-xxlarge' maxlength='150'></form:textarea>
                      <form:errors path='description' cssClass='error' element='div' />
                  </div>
                  <div id='segment_filter' class='contentBlock'>
                  	<p class='headTxt1'><s:message code='segment.filter.employees' /></p>
                  	<form:errors cssClass='error' element='div' />
                    <div class='control-group inline-form'>
                      <div class='pull-left'> <span class='fixed-width'><s:message code='segment.age.group' /> </span></div>
                      <div class='pull-left inline-form' id='age_group'>
                      	<form:checkboxes items='${ageGroupList}' path='selectedAgeGroups' class='required_group checkbox inlineAlt'/>
                      </div>
                      <form:errors path='selectedAgeGroups' cssClass='error' element='div' /> 
                    </div>
                    <div class='control-group searchBy'>
                    	<div class='pull-left marginR25'>
                            <form:label path='zipcode' for='zipcode'><s:message code='segment.zipcode' /></form:label>
                            <form:input minlength='5' maxlength='5' type='text' path='zipcode' name='zipcode' id='zipcode' class='required_group select-large' size='5'/>
                            <form:errors path='zipcode' cssClass='error' element='div' />
                        </div>
                        <div class='pull-left marginR25'>
                            <form:label path='selectedEmploymentType' for='type_of_employment'><s:message code='segment.type.employment' /></form:label>
                            <form:select items='${employmentTypeList}' path='selectedEmploymentType' name='type_of_employment' id='type_of_employment' multiple = 'multiple' class='required_group select-large'>
                            </form:select>
                            <form:errors path='selectedEmploymentType' cssClass='error' element='div' />
                        </div>
                        <div class='pull-left'>
                            <form:label path='selectedSalaryRanges' for='salary_range'><s:message code='segment.salary.range' /></form:label>
                            <form:select path='selectedSalaryRanges' items='${salaryRangeList}' name='salary_range' id='salary_range' multiple = 'multiple' class='required_group select-large'>
                            </form:select>
                            <form:errors path='selectedSalaryRanges' cssClass='error' element='div' />
                        </div>
                    </div>
                    <h3><s:message code='segment.add.employees' /></h3>
                    <div class='control-group searchBy'>
                    	<div class='pull-left marginR25'>
                            <label for='other_employees'><s:message code='segment.other.employees'/></label>
                            <select name='other_employees' id='other_employees' multiple = 'multiple' class='select-large'>
                           		<%-- <c:forEach var='employee' items='${otherEmployees}'>
                           			<option  id='${employee.id}' value='${employee.id}'>
                           				<c:out value='${employee.firstName} ${employee.middleName} ${employee.lastName}'/> 
                           			</option>
                           		</c:forEach> --%>
                           	</select>                       
                        </div>
                        <div class='pull-left marginR25 marginT30' style='vertical-align:middle'>
                        	<input type='button' id='js-moveRight' name='' value='&gt;' class='btn'>
                            <input type='button' id='js-moveLeft' name='' value='&lt;' class='btn marginT10'>
                        </div>
                        <div class='pull-left'>
                            <form:label path='selectedEmployees' for='employees_in_this_segment'><s:message code='segment.employees'/></form:label>
                            <form:select path='selectedEmployees' name='employees_in_this_segment' id='employees_in_this_segment' multiple = 'multiple' class='required_group select-large'>
                            	<%-- <c:forEach var='employee' items='${segment.selectedEmployees}'>
        							<option value='${employee.id}'>
        								<c:out value='${employee.firstName} ${employee.middleName} ${employee.lastName}'/>
        							</option>
    							</c:forEach> --%>
                            </form:select>
                            <form:errors path='selectedEmployees' cssClass='error' element='div' />
                        </div>
                    </div>
                  </div>
                </div>
              </div>
            </fieldset>
            <div class='control-group'>
           		<div class='buttons'>
                  <input type='button' id='cancel' class='btn btn-secondary marginR20' value='<s:message code='segment.cancel'/>'>
                  <input type='submit' id='add_segment' class='btn btn-primary' value='<s:message code='segment.add'/>'>                  
                </div>
            </div>
          </div>
        </div>
<script type='text/javascript'>  
 $(document).ready(function() {
	
	// errorIcon();
/* 		var validationRules = {},
		validationMessages = {};
		
		jQuery.validator.addMethod('validZipcode', function(val, el) {
			return val === '' || Utility['validateZip'](val);
		});
		
		
		jQuery.validator.addMethod('required_group', function(val, el) {
		    var module = $(el).parents('div');
		    return module.find('.required_group:filled').length -  module.find('.required_group:checkbox:filled').length + module.find('.required_group:checkbox:checked').length;
		});

		jQuery.validator.addClassRules('required_group', {
		    'required_group' : true
		});

		jQuery.validator.messages.required_group = 'ValidSegment.default.message';

		validationRules['name'] = {
				required: true,
				maxlength: 50
		};
		
		validationRules['description'] = {
			maxlength: 150	
		};
		
		validationRules['zipcode'] = {
			maxlength: 5,
			minlength: 5,
			digits: true,
			validZipcode: true
		};
		
		validationMessages['name'] = {
			required: 'NotNull.segment.name',
			maxlength: 'Size.segment.name'
		};
		
		validationMessages['description'] = {
				maxlength: 'Size.segment.description'
		};
		
		validationMessages['zipcode'] = {
				maxlength: 'Length.segment.selectedZipcode',
				minlength: 'Length.segment.selectedZipcode',
				digits: 'Digits.segment.selectedZipcode',
				validZipcode : 'Zip.segment.selectedZipcode'
		};
		
		// validate addSegmentForm form on keyup and submit
		$('#addSegmentForm').validate({
			rules: validationRules,
			messages: validationMessages,
			errorElement: 'div',
			highlight: function(element, errorClass) {
				$(element).addClass(errorClass);
				$(element).siblings('.icon-error').eq('0').fadeIn();
		   },
		   unhighlight: function(element, errorClass) {
			 $(element).removeClass(errorClass);
			 $(element).siblings('.icon-error').fadeOut();
		  },
			submitHandler: function(form) {
				$('#employees_in_this_segment option[value]').attr('selected','selected');
				$('#other_employees option[value]').attr('selected','selected');			
				form.submit();
			}
		}); */
		
		$('#js-moveRight').on('click', function(){
			return !$('#other_employees option:selected').remove().appendTo('#employees_in_this_segment');	
		});
		$('#js-moveLeft').on('click', function(){
			$('#employees_in_this_segment option:selected').remove().appendTo('#other_employees');	
			
		});
		
		$('#employees_in_this_segment').focusout(function() {
			$('#employees_in_this_segment option[value]').attr('selected','selected');
		});
		
		$('#selectedAgeGroups1').click(function(){ 
		    var checkbox = $(this);
		    var isChecked = checkbox.is(':checked');
		    if(isChecked) {
		    	$('input[type=checkbox]').attr('checked', 'checked');
		    	$('input[type=checkbox]').attr('disabled', true);
		    	checkbox.removeAttr('disabled', true);
		    } else {
		    	$('input[type=checkbox]').removeAttr('checked', 'checked');
		    	$('input[type=checkbox]').removeAttr('disabled', true);
		    }
		});
		
		$('#salary_range option:first').click(function() {
			if($('#salary_range option:first').is(':selected')) {
				$('#salary_range option[value]').attr('selected','selected');
				$('#salary_range').selectedIndex = $('#salary_range option[value]');
			} else {
				$('#salary_range option[value]').removeAttr('selected');
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
		$('#other_employees').ready( function(){
			  var other_employees_options = $("#other_employees option");
			  var employees_in_this_segment_options = $("#employees_in_this_segment option");
			  var str = '';
			  
			  if(employees_in_this_segment_options.length > 0) {
			  	for (var i = 0; i < employees_in_this_segment_options.length; i++) {
			     	 str+= employees_in_this_segment_options[i].value;
			    }
			  	for (var j = 0; j < other_employees_options.length; j++) {
			      if(str.search(other_employees_options[j].value) != -1) {
			    	  $("#other_employees option[value='" + other_employees_options[j].value + "']").remove();
			      }
			    }
			  }
			});
});
</script> 