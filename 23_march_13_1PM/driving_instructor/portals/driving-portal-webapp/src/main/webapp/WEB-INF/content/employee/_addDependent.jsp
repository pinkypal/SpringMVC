<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script id="memberBox_template" type="text/x-handlebars-template">

		<div id="familyMemberBox_{{index}}">
					<div class="control-group">
                      <label for="family_member"><s:message code="label.employer.addEmployee.familyMember"/></label>
                        <select name="familyMembers[{{index}}].relationship" id="relationship_{{index}}" class="select-large" >
                         <c:forEach items="${familyMemberType}" var="entry">
                      		 <option value="${entry.key}">${entry.value}</option>
            			</c:forEach>
 							
                        </select>
						<a id="remove_{{index}}" href="#" class="js-remove hide-text icon-minus-sign removeIcon">Remove</a>
                    </div>
                    <div class="control-group">
                      <div class="pull-left marginR20">
                        <label for="name_0"><s:message code="label.employer.addEmployee.name"/><span class="required">*</span></label>
                        <select name="familyMembers[{{index}}].suffix" id="suffix_{{index}}" class="select-smini" >
                         <c:forEach items="${nameSuffix}" var="entry">
                      		 <option value="${entry.key}">${entry.value}</option>
            			</c:forEach>
                        </select>
                      </div>
                      <div class="pull-left gutterR10">
                        <label class="hide" for="first_name_0"><s:message code="label.employer.addEmployee.firstName"/><span class="required"></span></label>
                        <input type="text" name="familyMembers[{{index}}].firstName" id="dep_firstName_{{index}}"  placeholder="First Name" class="input-medium placeholder" maxlength="15" />
                      </div>
                      <div class="pull-left gutterR10">
                        <label class="hide" for="middle_name_0"><s:message code="label.employer.addEmployee.middleName"/><span class="required"></span></label>
                        <input type="text" name="familyMembers[{{index}}].middleName" id="dep_middleName_{{index}}" placeholder="Middle Name (optional)" class="input-medium placeholder" maxlength="15" />
                      </div>
                      <div class="pull-left">
                        <label class="hide" for="last_name_0"><s:message code="label.employer.addEmployee.lastName"/><span class="required"></span></label>
                        <input type="text" name="familyMembers[{{index}}].lastName" id="dep_lastName_{{index}}" placeholder="Last Name" class="input-medium placeholder" maxlength="15" />
                      </div>
                    </div>
                    <div class="control-group">
                      <div class="pull-left">
                        <label for="date_of_birth_0"><s:message code="label.employer.addEmployee.dob"/><span class="required">*</span></label>
                        <input type="text" name="familyMembers[{{index}}].dob" readOnly="true" id="dep_dob_{{index}}" class="input-medium dob marginR10 placeholder"/>
                      </div>
                      <div class="pull-left inline-form marginL55">
                        <label for="smoker_0"><s:message code="label.employer.addEmployee.smoker"/></label>
                        <input type="checkbox" name="familyMembers[{{index}}].istobaccoUser" id="dep_isTobbacoUser_{{index}}" class="checkbox inline">
                      </div>
                    </div>
                    <div class="control-group inline-form marginB20"> <span class="pull-left labelAlt"><s:message code="label.employer.addEmployee.gender"/><span class="required">*</span></span>
                      <div class="pull-left">
                     <input type="radio"  name="familyMembers[{{index}}].gender" value="Male"/>
                        <label for="male_0" class="checkbox inline"><s:message code="label.employer.addEmployee.male"/></label>
                      </div>
                      <div class="pull-left">
                      <input type="radio"  name="familyMembers[{{index}}].gender" value="Female"/>
                        <label for="female_0" class="checkbox inline">female</label>
                      </div>
                    </div>
				</div>
                    </script>