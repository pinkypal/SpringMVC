<script id="segment_view_template" type="text/x-handlebars-template"> 
            <section class="planCategory">
            		<form  class="form-horizontal" method="post"> 
                    <div class="accoraccordionBorder">
					
                    	<div class="marginL10 marginR10">
                            <div class="gutterT20">
                            	<span class="fixed-width">Description:</span>
                            	<span >{{segment.description}}</span>
                            </div>
                            <div class="controls-row marginT10 marginB10">
                                <span class="fixed-width">Age Groups:<spring:message code="segment.age.group" /></span>
                                <span>
                                	{{#list segment.selectedAgeGroups ageGroups ","}}	
                                	{{/list}}
                                </span>
                            </div>
                            <div class="controls-row marginB10">
                                <span class="fixed-width">Zipcode:<spring:message code="segment.zipcode"/></span>
                                <span>{{segment.zipcode}}</span>
                            </div>
                            <div class="controls-row marginB10">
                                <span class="fixed-width">Salary Range:<spring:message code="segment.salary.range" /> </span>
                                <span>
									{{#list segment.selectedSalaryRanges salaryRanges ","}}
                                	{{/list}}
                                </span>
                            </div>
                            <div class="controls-row marginB10">
                                <span class="fixed-width">Employment Type:<spring:message code="segment.type.employment"/> </span>
                                <span>
									{{#list segment.selectedEmploymentType employmentTypes ","}}
                                	{{/list}}
                                </span>
                            </div>
						   {{#unless segment.isDefault}}
                           <div class="controls-row marginTB20">
                                <a type="button" name="" class="btn btn-primary js-edit" href="${pageContext.request.contextPath}/segment/?segmentId={{segment.id}}">
									Edit					
								</a>
							</div>
							{{/unless}}
                            <div class="controls-row">
                                <h3>Employee List</h3>
                                <div class="marginB20">
									
                                    <table id="employeeTable_{{segment.id}}" class="employeeListTable table table-striped">
                                        <thead>
                                            <tr class="first-row">
                                                <th>Employee ID <span class="icon-sorting-down"></span></th>
                                                <th class="text-nowrap">Employee Name</th>
                                                <th>Age Group</th>
                                                <th>Zip Code</th>
                                                <th>Salary Range</th>
                                                <th class="text-nowrap">Type of Employment</th>
                                                <th>Actions</th>
                                              </tr>
                                        </thead>
                                    </table>
                                </div>
                            </div>
							  <div class="controls-row marginB10 grid">
                              <div class="pull-left"><a href="#">Download Employee List as CSV/Excel</a></div>
                            </div>
                        </div>
                    </div>
                    </form>
          		</div>
		</section>
</script>
<script type="text/javascript">
</script>
		