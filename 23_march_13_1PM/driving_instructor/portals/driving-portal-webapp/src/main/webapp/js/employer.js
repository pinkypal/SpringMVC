AddEditEmployee={
		
		addPageValidations : function(documentObj){
			var validationRules=documentObj.data('validationRules');
			var validationMessages=documentObj.data('validationMessages');
			var messages=documentObj.data('messages');
			
			validationRules["employee.gender"] = {required: true};
			validationMessages["employee.gender"] = messages["NotBlank.employeeDetail.employee.gender"];
			validationRules["employee.firstName"] = {required: true,alpha:true};
			validationMessages["employee.firstName"] = {
					required: messages["NotBlank.employeeDetail.employee.firstName"],
					alpha: messages["NotBlank.employeeDetail.employee.firstName"]
				};
			validationRules["employee.ssn"] = {required: true};
			validationMessages["employee.ssn"] = messages["NotBlank.employeeDetail.employee.ssn"];
			validationRules["employee.lastName"] = {required: true,alpha:true};
			validationMessages["employee.lastName"] = {
					required:messages[ "NotBlank.employeeDetail.employee.lastName"],
					alpha: messages["NotBlank.employeeDetail.employee.lastName"]
				};
			validationRules["employee.dob"] = {required: true};
			validationMessages["employee.dob"] = messages["NotNull.employeeDetail.employee.dob"],
			validationRules["employee.hireDate"] = {required: true};
			validationMessages["employee.hireDate"] = messages["NotNull.employeeDetail.employee.hireDate"];
			validationRules["employee.employeeCode"] = {required: true};
			validationMessages["employee.employeeCode"] = messages["NotBlank.employeeDetail.employee.employeeCode"];
			validationRules["employee.noOfHours"] = {required: true,noOfHours:true};
			validationMessages["employee.noOfHours"] = {
					required: messages["NotBlank.employeeDetail.employee.noOfHours"],
					noOfHours: messages["NotBlank.employeeDetail.employee.noOfHours"]
				};
			validationRules["employee.nameSuffix"] = {required: true};
			validationMessages["employee.nameSuffix"] = messages["NotBlank.employeeDetail.employee.nameSuffix"];
			validationRules["employee.annualSalary"] = {required: true};
			validationMessages["employee.annualSalary"] = messages["NotBlank.employeeDetail.employee.annualSalary"];
			validationRules["employee.email"] = {required: true,customEmail:true};
			validationMessages["employee.email"] ={
					required: messages["NotBlank.employeeDetail.employee.email"],
					customEmail: messages["Email.employeeDetail.employee.email"]
				}; ;
			
			validationRules["employee.address.streetAddressLine1"] = {required: true};
			validationMessages["employee.address.streetAddressLine1"] =messages[ "NotBlank.employeeDetail.employee.address.streetAddressLine1"];
			validationRules["employee.address.city"] = {required: true};
			validationMessages["employee.address.city"] = messages["NotBlank.employeeDetail.employee.address.city"];
			validationRules["employee.address.state"] = {required: true};
			validationMessages["employee.address.state"] = messages["NotBlank.employeeDetail.employee.address.state"];
			validationRules["employee.address.zip"] = {required: true};
			validationMessages["employee.address.zip"] = messages["NotBlank.employeeDetail.employee.address.zip"];
			validationRules["employee.address.county"] = {required: true};
			validationMessages["employee.address.county"] = messages["NotBlank.employeeDetail.employee.address.county"];  
			
		
		/*	$("div[id^='familyMemberBox_']").each(function(i){
				validationRules["familyMembers["+i+"].suffix"] = {required: true};
				validationMessages["familyMembers["+i+"].suffix"] = messages["NotBlank.employeeDetail.familyMembers.suffix"];
				validationRules["familyMembers["+i+"].gender"] = {required: true};
				validationMessages["familyMembers["+i+"].gender"] = messages["NotBlank.employeeDetail.familyMembers.gender"];
				validationRules["familyMembers["+i+"].dob"] = {required: true};
				validationMessages["familyMembers["+i+"].dob"] = messages["NotNull.employeeDetail.familyMembers.dob"];
				validationRules["familyMembers["+i+"].firstName"] = {required: true,alpha:true};
				validationMessages["familyMembers["+i+"].firstName"] = {
						required: messages["NotBlank.employeeDetail.familyMembers.firstName"],
						alpha: messages["NotBlank.employeeDetail.familyMembers.firstName"]
					};
				validationRules["familyMembers["+i+"].lastName"] = {required: true,alpha:true};
				validationMessages["familyMembers["+i+"].lastName"] = {
						required: messages["NotBlank.employeeDetail.familyMembers.lastName"],
						alpha: messages["NotBlank.employeeDetail.familyMembers.lastName"]
					};;
			});*/
		},

		addDatePicker:function(documentObj){
			$( ".dob, .doh" ).datepicker({
	            showOn: "button",
	            changeYear: true,
	            buttonImage: GlobalVars['app_url']+"/images/calender.png",
	            buttonImageOnly: true,
				buttonText: "Calender",
				maxDate: '0'
	        });
		},
		initInputControls:function(parent){
			
			var ssnControls = parent.find(".ssnControl");
			if(ssnControls.length) {
				ssnControls.ssnControl({
					separator: "-"
				});
			};
			var phoneControls = parent.find(".phoneControl");
			if(phoneControls.length) {
				phoneControls.phoneControl({
					separator: "-"
				});
			};
			var errorControls = parent.find(".errorControls");
			if(errorControls.length) {
				$(errorControls).each(function(){
					var id=$(this).attr('id');
					errorControls.errorControls({
						id:id
					});
				})
				
			};
		},
		addcustomValidation:function(documentObj){
			var validationRules=documentObj.data('validationRules');
			var validationMessages=documentObj.data('validationMessages');
			var messages=documentObj.data('messages');
			
			$("input[id^='employee.address.phoneNumber_']").each(function(i, elem) {
				var oElem = $(elem);
				oElem.live("keyup",function(){
						var maxLength = this.maxLength,value = this.value;
						var index=parseInt(oElem.attr("id").substring(29,30));
						idFocus =index+ 1;
						var reg=/^[\s\d\s]*$/;
						if(reg.test(value)){
								ssnId = oElem.attr("id").replace("_" + index, "_" + idFocus);
								ssnId = ssnId.replace(/(:|\.|\[|\])/g, '\\$1');
								var inputValArray=$("input[id$='employee.address.phoneNumber']").val();
								var x="";
									$("input[id^='employee.address.phoneNumber_']").each(function(){
										x=x+$(this).val();
									});
									$("input[id$='employee.address.phoneNumber']").val(x); 
								if(maxLength == value.length && idFocus < 4) {
									setTimeout(function() {
										$("input[id$='"+ssnId+"']").focus();
									}, 50);
							}
						}
						else{
							$(this).val("");
						}
				});
			});
			
			
	   		$("input[id^='employee.ssn_']").each(function(i, elem) {
			var oElem = $(elem);
			oElem.live("keyup",function(){
					var maxLength = this.maxLength,value = this.value;
					var index=parseInt(oElem.attr("id").substring(13,14));
					idFocus =index+ 1;
					var reg=/^[\s\d\s]*$/;
					if(reg.test(value)){
							ssnId = oElem.attr("id").replace("_" + index, "_" + idFocus);
							ssnId = ssnId.replace(/(:|\.|\[|\])/g, '\\$1');
							var inputValArray=$("input[id$='employee.ssn']").val();
							var x="";
								$("input[id^='employee.ssn_']").each(function(){
									x=x+$(this).val();
								});
								$("input[id$='employee.ssn']").val(x); 
							if(maxLength == value.length && idFocus < 4) {
								setTimeout(function() {
									$("input[id$='"+ssnId+"']").focus();
								}, 50);
						}
					}
					else{
						$(this).val("");
					}
			});
		});
	   		$("input[id^='employee.ssn_']").each(function(i){
				validationRules["employee.ssn_0"] = {required: true};
				validationMessages["employee.ssn_0"] = messages["NotBlank.employeeDetail.employee.ssn"];
				validationRules["employee.ssn_1"] = {required: true};
				validationMessages["employee.ssn_1"] = "";
				validationRules["employee.ssn_2"] = {required: true};
				validationMessages["employee.ssn_2"] = "";
			});
	   		
	   		$("input[id^='employee.ssn_']").each(function(i){
				validationRules["employee.address.phoneNumber_0"] = {required: true};
				validationMessages["employee.address.phoneNumber_0"] = messages["NotBlank.employeeDetail.employee.address.phoneNumber"];
				validationRules["employee.address.phoneNumber_1"] = {required: true};
				validationMessages["employee.address.phoneNumber_1"] = "";
				validationRules["employee.address.phoneNumber_2"] = {required: true};
				validationMessages["employee.address.phoneNumber_2"] = "";
			});
		},
		checkBoxEvent:function(documentObj){
			 $("select[id^='relationship_']").live('change',function(){
				var messages=documentObj.data('messages');

				 var id=$(this).attr('id').split('_')[1];
				 var val=$(this).val();
				 if(val!=''){
					 $("div[id^='familyMemberBox_']").each(function(i){
						 
						 	suffix=$("div[id^='familyMemberBox_"+id+"']").find("select[name*=suffix]"), 
						 	dob =$("div[id^='familyMemberBox_"+id+"']").find("input[name*=dob]"), 
							firstName = $("div[id^='familyMemberBox_"+id+"']").find("input[name$=firstName]"),
							lastName = 	$("div[id^='familyMemberBox_"+id+"']").find("input[name$=lastName]");
							gender = $("div[id^='familyMemberBox_"+id+"']").find("input[name$=gender]");
							
							suffix.rules("add", {
								 required: true,
								 messages: {
								required: messages["NotBlank.employeeDetail.familyMembers.suffix"]
								}
							});
							gender.rules("add", {
								 required: true,
								 messages: {
								required: messages["NotBlank.employeeDetail.familyMembers.gender"]
								}
							});
							dob.rules("add", {
								 required: true,
								 messages: {
								required:messages["NotNull.employeeDetail.familyMembers.dob"]
								}
							});
							firstName.rules("add", {
								 required: true,
								 messages: {
								required: messages["NotBlank.employeeDetail.familyMembers.firstName"]
								}
							});
							lastName.rules("add", {
								 required: true,
								 messages: {
								required: messages["NotBlank.employeeDetail.familyMembers.lastName"]
								}
							});
					 });
				 }else{

					 $("div[id^='familyMemberBox_']").each(function(i){
						 
						 	suffix=$("div[id^='familyMemberBox_"+id+"']").find("select[name*=suffix]"), 
						 	dob =$("div[id^='familyMemberBox_"+id+"']").find("input[name*=dob]"), 
							firstName = $("div[id^='familyMemberBox_"+id+"']").find("input[name$=firstName]"),
							lastName = 	$("div[id^='familyMemberBox_"+id+"']").find("input[name$=lastName]");
							gender = $("div[id^='familyMemberBox_"+id+"']").find("input[name$=gender]");
							
							$("div[id^='familyMemberBox_"+id+"']").find(".icon-error").hide();
							suffix.removeClass('error errorAlt');
							suffix.rules("remove");
							gender.rules("remove");
							gender.removeClass('error errorAlt');
							dob.rules("remove");
							dob.removeClass('error errorAlt');
							firstName.rules("remove");
							firstName.removeClass('error errorAlt');
							lastName.rules("remove");
							lastName.removeClass('error errorAlt');
					 });
				 
				 }
						
			 });
		},
		removeFamilyMember:function(documentObj){
			 $("a[id^='remove_']").live('click',function(){
				 var id=$(this).attr('id').split('_')[1];
				 $("div[id^='familyMemberBox_"+id+"']").remove();
				 
			 });
		},
		addFamilyMember:function(documentObj){
			var messages=documentObj.data('messages');
			$('a#addFamilyMember').click(function(){
				var index=parseInt($("div[id^='familyMemberBox_']").last().attr('id').split("_")[1]);
				var member={
						'index':index+1
				};
				
				var template = Handlebars.compile($("#memberBox_template").html());
				$("#familyMemberBoxContainer").append(template(member));
				
		 		 $("div[id^='familyMemberBox_']").each(function(i){
		 			 
					dob =$("div[id^='familyMemberBox_"+i+"']").find("input[name*=dob]"), 
					/*firstName = $("div[id^='familyMemberBox_"+i+"']").find("input[name$=firstName]"),
					lastName = 	$("div[id^='familyMemberBox_"+i+"']").find("input[name$=lastName]");
					gender = $("div[id^='familyMemberBox_"+i+"']").find("input[name$=gender]");
					gender.rules("add", {
						 required: true,
						 messages: {
						required: messages["NotBlank.employeeDetail.familyMembers.gender"]
						}
					});
					dob.rules("add", {
						 required: true,
						 messages: {
						required:messages["NotNull.employeeDetail.familyMembers.dob"]
						}
					});
					firstName.rules("add", {
						 required: true,
						 messages: {
						required: messages["NotBlank.employeeDetail.familyMembers.firstName"]
						}
					});
					lastName.rules("add", {
						 required: true,
						 messages: {
						required: messages["NotBlank.employeeDetail.familyMembers.lastName"]
						}
					});*/
					$(dob).datepicker({
			            showOn: "button",
			            buttonImage: GlobalVars['app_url']+"/images/calender.png",
			            buttonImageOnly: true,
			            changeYear: true,
						buttonText: "Calender"
			        }); 
				});
				var index=index+1;
		 		$("div[id^='familyMemberBox_"+index+"']").find('input, select, textarea').wrap('<span class="errorWarp"></span>').parent().append('<span class="icon icon-error"></span>');
				$("div[id^='familyMemberBox_"+index+"']").find('input.dob').siblings('.icon-error').css('right', -20);
				$("div[id^='familyMemberBox_"+index+"']").find('input[type=radio],input[type=checkbox]').each(function(index, element) {
					$(this).siblings('.icon-error').css('right', -($(this).parent().next().width()+21));
				});
				$("div[id^='familyMemberBox_"+index+"']").find('select').each(function(index, element) {
					$(this).siblings('.icon-error').css('right', -($(this).parent().next().width()+18));
				});
		 		 
			});
		},
		triggerZipCountyValidation:function(documentObj){
			$("#zip").trigger("blur");
		},
		zipCountyValidation:function(documentObj){
			$("#zip").blur(function(){
				var county=$("#county");
				var zipValue=$("#zip").val();
			//	var countyDd=$("#countyDd");
			//	var stateElement=$("#state");
				var zipElement=$("#zip");
				Utility.validateZip(zipValue,
					function(data) {
						if(data) {
							county.empty();
							$.each(data, function(id, zip) {
								county.append($("<option value=\"" + zip.county +"\">" + zip.county +"</option>"));
							});
							$("#state").val(data[0].stateCode);
						/*
						if(response.length > 1){
								county.hide();
								county.val("");
								countyDd.show();
								var options = '';
								$.each(response, function(id, zip) {
									countyDd.append($("<option value=\"" + zip.county +"\">" + zip.county +"</option>"));
								});
							
						}else{
								county.val(response[0].county);
								county.show();	
								countyDd.empty();
								countyDd.hide();
						}
						
						stateElement.val(response[0].stateCode);
						stateElement.valid();
					*/} else {
						zipElement.val("");
						var map = {};
						map[zipElement.attr("name")] = "Please enter a valid Zip Code";
						zipElement.closest("form").validate().showErrors(map);
					}
				});
			});
		},
		validateForm:function(documentObj){
			$("#employeeForm").validate({
					rules: documentObj.data('validationRules'),
					messages:documentObj.data('validationMessages'),
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
						
				 	var relArray=new Array();
				 	var validForm=true;
						$("div[id^='familyMemberBox_']:visible").each(function(i){
							var relationship=$("#relationship_"+i).val();
							if(relationship=="Spouse"){
								if($.inArray("Spouse", relArray)==-1){
									relArray.push(relationship);
								}
								else{
									alert("can not add spouse twice");
									validForm=false;
								}
							}
							
						}); 
							if(validForm){
								$("div[id^='familyMemberBox_']").each(function(i){
									var oThis=$("div[id^='familyMemberBox_"+i+"']"); 
									if(oThis.val()==undefined){
										$("div[id^='familyMemberBox_"+i+"']").remove();
									}else{
										var relDdVal=$("select[id^='relationship_"+i+"']").val();
										if(relDdVal==''){
											oThis.remove();
										}
									}
									
									/*if(!oThis.is(':visible')){
										oThis.remove();
									}*/
								});
								form.submit();
							}
							else{
								return false;
							}
						},
					invalidHandler: function() { 
							}
				});
				/*$(".icon-error").live("mouseover",function(){
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
				});*/
			$(".icon-error").live("mouseover",function(){
				var id=$(this).siblings().attr('name')+".errors";
					
				if(id=='undefined'){
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
				}else{
					if(id.contains("familyMembers")){
						id=id.replace("[","");
						id=id.replace("]","");
						var text = $("div[id^='"+id+"']").text(),
						parent =  $(this).parent('.errorWarp').append('<div class="error errorAlt">'+text+'</div>');
					
					}else{
						var text = $("div[id^='"+id+"']").text(),
						parent =  $(this).parent('.errorWarp').append('<div class="error errorAlt">'+text+'</div>');
					}
					var	pos = $(this).position().left + 20;
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
				}
				
			});
			$(".icon-error").live("mouseout",function(){
				var parent =  $(this).parent('.errorWarp');
			  	parent.find('div.error').fadeOut('slow',function(){
					parent.find('div.error').removeAttr('style');
				});
			});
		},
		cancelEvent:function(){
			 $("#cancel").click(function(){
					var listUrl=GlobalVars["app_url"]+"/employees/list";
					$(location).attr('href',listUrl);
				});
		},
		errorIcon:function(){
			$('input, select, textarea').wrap('<span class="errorWarp"></span>').parent().append('<span class="icon icon-error"></span>');
			$('input.dob').siblings('.icon-error').css('right', -20);
			$('input[type=radio],input[type=checkbox]').each(function(index, element) {
				$(this).siblings('.icon-error').css('right', -($(this).parent().next().width()+21));
			});
			$('select').each(function(index, element) {
				$(this).siblings('.icon-error').css('right', -($(this).parent().next().width()+18));
			});
		}
};

ManageEmployees={
		buttonClickEvents:function(documentObj){
			$('#popup').jQpopup({show: false});
			$('.removeRow').live("click",function(){
				$('#popup').jQpopup({show: true});
				$("#employeeId").val($(this).attr('id'));
			});
			
			 $('.cancelPop').live("click",function(){
				$('#popup').jQpopup({show: false});
			});
			
			 $('#add_employee').click(function(){
				 var url=$(location).attr('href');
					var listUrl=GlobalVars['app_url']+"/employees/add";
					$(location).attr('href',listUrl);
				});
			 
			$('#yesRemove').live("click",function(){
				var employeeId=$("#employeeId").val();
				var deleteUrl =GlobalVars['app_url']+ "/employees/delete/" + employeeId;
            	var request = $.ajax({
            		url:deleteUrl,
            		async:false,
            		type:"GET",
            		success : function(data, status, jqXHR){
            			alert(data);
            			ManageEmployees.createDataTable(documentObj);
            			$('#popup').jQpopup({show: false});
            		},
            		error : function(data, status, jqXHR){
            			response =  false;
            			$('#popup').jQpopup({show: false});
            		}
            	});
			}); 
		},
		deleteEmployee:function(documentObj){
			
		},
		terminateEmployee:function(documentObj){
			
		},
		validateForm:function(documentObj){
			$("#signupForm").validate({
				rules: {
					search_by: "required",
					keyword: "required"
				},
				messages: {			
					search_by: "Please enter your Search",
					keyword: "Please enter your Keyword"
				},
				errorClass: "error errorAlt",
				errorElement: "div"	,
				submitHandler: function(form) { 
				//	var table =documentObj.data('table');
				//	table.fnDraw();
				//	alert("submit");
					return false;
				}
			});	
		},
		createDataTable:function(documentObj){
			 $.ajax({
					url : GlobalVars['app_url']+"/employees/getlist",
					dataType : "json",
					cache : false,
					success : function(data) {
						var table=$('#employeeTable').dataTable(
				  				{
				  					"aaData":data,
										"aoColumns": [
														{ 
															"mDataProp": "employeeCode",
															"sWidth":"10%"
														},
														{ 
															"mDataProp": "firstName",
															"sWidth":"13%"
														},
														{ 
															"mDataProp": "memberId",
															"sWidth":"12%"
														},
														{ 
															"mDataProp": "planName",
															"sWidth":"10%"
														},
														{ 
															"mDataProp": "employmentType",
															"sWidth":"9%"
														},
														{
															"mDataProp": "segment",
															"sWidth":"9%"
														},
														{
															"mDataProp": "status",
															"sWidth":"5%"
														},
														{
															"mDataProp": "id",
															"sWidth":"6%"
														}
													],
													
													"aoColumnDefs":[
																{
																	"fnRender": function(oObj)
																    	{
																			var firstName = oObj.aData.firstName,
																		//	middlename=oObj.aData.middlename,
																			lastName=oObj.aData.lastName;
																			
																			return firstName+"&nbsp;"+"&nbsp;"+lastName+"&nbsp;"+"&nbsp;";
																    	},
																    	"aTargets" :[1]
																	},
																	{
																		"fnRender": function(oObj)
																	    	{
																				
																				
																				return "";
																	    	},
																	    	"aTargets" :[2]
																		},
																		{
																			"fnRender": function(oObj)
																		    	{
																					
																					
																					return "";
																		    	},
																		    	"aTargets" :[3]
																			},
																			{
																				"fnRender": function(oObj)
																			    	{
																						
																						
																						return "";
																			    	},
																			    	"aTargets" :[5]
																				},
																				{
																					"fnRender": function(oObj)
																				    	{
																							
																							
																							return "";
																				    	},
																				    	"aTargets" :[6]
																					},
																	{
																		"fnRender": function(oObj)
																	    	{
																				var id = oObj.aData.employeeCode,
																				employeeCode=oObj.aData.employeeCode;
																				
																				var edit="<a href="+"../../employer/employees"+ "/edit/" + id + " title="+"'edit'"+ "class="+"'icon-edit hide-text'"+">" + employeeCode + "</a>";
																				var dlt="<a id='"+id+"'"+ "title="+"'delete'"+ "href="+"'javascript:void(0)'"+"class="+"'icon-trash hide-text removeRow'"+">" + employeeCode + "</a>";
																				var view="<a href="+"../../employer/employees"+ "/view/" + id + " title="+"'view'"+ "class="+"'icon-view hide-text'"+">" + employeeCode + "</a>";
																				return ""+"&nbsp;"+"&nbsp;"+view+"&nbsp;"+"&nbsp;"+edit+"&nbsp;"+"&nbsp;";
																	    	},
																	    	"aTargets" :[7]
																		},
																],	
													"oLanguage": {
													                "sEmptyTable": "You have not added employees to the roster."
													              },
													"fnPreDrawCallback":function(){
																         $("#waiting_a").show();
																      },
													"fnDrawCallback": function( oSettings ) {
																		$("#waiting_a").hide();
																		$(".dataTables_filter").hide();
																		$(".dataTables_length").hide();
																		$("#employeeTable_paginate").addClass("pagination pagination-mini pagination-right gutterR10 pull-right");
															      },
													"bDestroy": true,
													"bFilter": true,
													"bPaginate": true, 
													"sPaginate": false,
													"sPaginationType": "full_numbers",
													"aaSorting": [[ 0, "asc" ]],
													"asStripClasses" : ["", "altcolor"],
													"sPaginationType": "two_button"
													
												}
										);
						 $('#go').click(function(){
							     var value = $("#search_by").val();
							     var keyword = $("#keyword").val(); 
							     if(value=='employee_id'){
									 table.fnFilter(keyword, "0");
							     }
							     else if(value='employee_name'){
									 table.fnFilter(keyword, "1");
							     }else{
							    	 
							     }
						    });
					}
			 });
			
		}
};
ViewEmployee={
		buttonEvents:function(){
			$("#back").click(function(){
				var url=$(location).attr('href');
				var listUrl=url.substring(0,url.indexOf(".com")+4)+"/employer/employees/list";
				$(location).attr('href',listUrl);
			});
			$("#edit").click(function(){
				var editUrl=$(location).attr('href').replace("view","edit");
				$(location).attr('href',editUrl);
			});
		}
};

Employer = {
		enableRegistrationValidation : function(numberOfQuestion){
			var validationRules = {
					'firstName' : { required: true },
					'lastName'  : { required: true },
					'emailId'   : {
									required: true,
									email: true
								  },
					'userId'    : { required: true },
					'password'  : {
									required: true,
									customPassword: true
								  },
					'confirmPassword' : { 
									required: true,
									customPassword: true,
									equalTo: "#password"
								  }				
			},
			validationMessages = {
					'firstName' : { required: "NotBlank.employer.firstName" },
					'lastName'  : { required: "NotBlank.employer.lastName" },
					'emailId'   : {
									required: "NotBlank.employer.emailId",
									email: "Email.employer.emailId"
								  },
					'userId'    : { required: "NotBlank.employer.userId" },
					'password'  : {
									required: "NotBlank.employer.password",
									customPassword: "Pattern.employer.password"
								  },
					'confirmPassword' : { 
									required: "NotBlank.employer.confirmPassword",
									customPassword: "Pattern.employer.password",
									equalTo: "FieldMatch.employer.confirmPassword"
								  }	
			};
			
			for(var i = 0; i< numberOfQuestion; i++){
				validationRules["securityQuestionAnswers[" + i + "].securityQuestion.id"] = {
					required: true
				};
				validationRules["securityQuestionAnswers[" + i + "].securityAnswer"] = {
					required: true
				};
				validationRules["securityQuestionAnswers[" + i + "].customSecurityQuestion"] = {
					required : function(arg) {
						var k = $(arg).data("id")
		                return $("#securityQuestion" + k).val() == 'custom';
		            }
				};
				validationMessages["securityQuestionAnswers[" + i + "].securityQuestion.id"] = "NotBlank.employer.securityQuestionAnswers.securityQuestion.id";
				validationMessages["securityQuestionAnswers[" + i + "].securityAnswer"] = "NotBlank.employer.securityQuestionAnswers.securityAnswer";
				validationMessages["securityQuestionAnswers[" + i + "].customSecurityQuestion"] = "NotBlankIfAnotherFieldHasValue.employer.securityQuestionAnswers.customSecurityQuestion";
			
				/* validationMessages["securityQuestionAnswers[" + i + "].securityQuestion.id"] = $.i18nMessage("NotBlank.employer.securityQuestionAnswers.securityQuestion.id") + " " + (i + 1);
				validationMessages["securityQuestionAnswers[" + i + "].securityAnswer"] = $.i18nMessage("NotBlank.employer.securityQuestionAnswers.securityAnswer") + " " + (i + 1);
				validationMessages["securityQuestionAnswers[" + i + "].customSecurityQuestion"] = $.i18nMessage("NotBlankIfAnotherFieldHasValue.employer.securityQuestionAnswers.customSecurityQuestion") + " "+ (i + 1);
			 */
			}
			
			$("#signupForm").validate({
				rules: validationRules,
				messages: validationMessages,
				submitHandler: function(form) {
					form.submit();
				}
			});	
			
		},
		initializeSecurityQuestionAnswer : function(numberOfQuestion){
			for(var j = 0; j< numberOfQuestion; j++){
				$('#securityQuestion' + j).bind('change keyup', function(e){
					var k = $(this).data("id");
					changeQuestion('questionAnswer' + k, 'securityQuestion' + k, 'securityAnswer' + k, 'customQuestionAnswer' + k);
				});
			}
			
			for(var j = 0; j< numberOfQuestion; j++){
				$('#securityQuestion' + j).change();
			}
		},
		enableSaveOrganizationValidation : function(){
			var validationRules = {
					legalCompanyName: "required",
					companyName: "required",
					yearOfIncorporation: {"required":true, "min" : "1900", "pastYear":true}, 
					employerIdentificationNumber: "required",
					currentFullTimeEmployees: {"required":true, range: [0, 49]},
					fullTimeEmployeeSinceLastYear: {"required":true, range: [0, 49]},
					company_logo: "required",
					"address.streetAddressLine1": "required",
					"address.city": "required",
					"address.zip": "required",
					"address.county": "required"
				//	"address.state": "required"
				},
			validationMessages = {
					legalCompanyName: "NotNull.organization.legalCompanyName",
					companyName: "NotNull.organization.companyName",
					yearOfIncorporation: {
						"required" : "NotNull.organization.yearOfIncorporation", 
						"min"   : "Min.organization.yearOfIncorporation",
						"pastYear" : "PastYear.organization.yearOfIncorporation"
						
					},
					employerIdentificationNumber: "NotNull.organization.employerIdentificationNumber",
					currentFullTimeEmployees: {
						"required" : "NotNull.organization.currentFullTimeEmployees",
						"range" : "Range.organization.currentFullTimeEmployees"
					},
					fullTimeEmployeeSinceLastYear: {
						"required" : "NotNull.organization.fullTimeEmployeeSinceLastYear",
						"range" : "Range.organization.fullTimeEmployeeSinceLastYear"
					},
					company_logo: "Please upload your Company Logo",
					"address.streetAddressLine1": "NotBlank.organization.address.streetAddressLine1",
					"address.city": "NotBlank.organization.address.city",
					"address.zip": "NotBlank.organization.address.zip",
					"address.county": "NotBlank.organization.address.county"
					//"address.state": "common.state.required"
				};
			
			$("#signupForm").validate({
				rules: validationRules,
				messages: validationMessages,
				submitHandler: function(form) {
					form.submit();
				}
			});	
		},
		enableFindPlansValidation : function(){
			 var validationRules = {
	        	//	"useEmployeeZipCode" : { required: true },
	        		"coverageType"       : { required: true },
	        		"coverageStartDate"  : { required: true },
	        		"insuranceTypes"     : { required: true, minlength: 1 }
	        },
	    	validationMessages = {
	        	//	"useEmployeeZipCode" : { required: "required" },
	        		"coverageType"       : { required: "NotBlank.findPlans.coverageType" },
	        		"coverageStartDate"  : { required: "NotNull.findPlans.coverageStartDate" },
	        		"insuranceTypes"     : "NotNull.findPlans.insuranceTypes"
	        };
	    	
	    	
	    	// validate signup form on keyup and submit
	    	$("#findPlans").validate({
	    		rules: validationRules,
	    		messages: validationMessages,
	    		submitHandler: function(form) {
	    			form.submit();
	    		},
	    		errorPlacement: function(error, element){
	    			error.appendTo($("#error_" + element.attr("name")));
	    		}
	    	});	
		}
}