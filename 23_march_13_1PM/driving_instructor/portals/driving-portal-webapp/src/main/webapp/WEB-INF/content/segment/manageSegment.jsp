<%@ include file="../../../includes/_tagLibs.jsp" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Blue Sky</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta content='indexLayout' name='decorator'>
</head>
<body>
	<!-- Put content of breadcrum of here -->
	<content tag="breadcrum">
		<li><a href="#" class="disable"><s:message code="layout.breadcrum.manageSegment" /></a></li>
	</content>	 
	<!-- selectedMenu is for header menu -->
	<parameter name="selectedMenu" value="header_myaccount"/>
	<parameter name="selectedLeftMenu" value="nevigation_manageemployee"/>      
    <!-- breadcrum END -->
<jsp:include page="_viewTemplate.jsp" />

    <section class="span9 leftSpace">
      	<form id="signupForm" class="form-horizontal" method="get">
        <div class="form-section">
          <div class="content contentAlt">
            <fieldset class="noBorder">
              <legend class="hide">User Details</legend>
              <!-- Beginning of Main Heading -->
              <header class="sectionHeader grid">
                <h1 class="pageHeading pull-left">Manage Segment </h1>
                <h2 class="hide">Heading 2</h2>
                <input id="js-addSegment" type="button" name="" value="Add New Segment" class="btn btn-primary pull-right">
              </header>
              <!-- End of Main Heading -->
              <div class="contentBlock">
                <section id="employeeList" class="planCategory">
                    <c:forEach varStatus="loop" var="segment" items="${segmentList}">
            		<h1 id="segmentView" class="accordionHeading" data-segment-id="${segment.id}" data-is-default="${segment.isDefault}">
            		<span class="marginR20 pull-left" >
            			<s:message code="label.segment"/>
         				${segment.name} 
         				<c:if test="${!loop.first}"></c:if>	
         			</span>
            		</h1>
            		<div id="segmentDetail_${segment.id}"class="segmentDetail"></div>
            		<table id="table_${segment.id}"></table>
            	 </c:forEach>
            	</section>
               </div>
            </fieldset>
          </div>
        </div>
      </form>
    </section>
<!-- Pop Section Start -->
    <div id="overlay"></div>
    <div class="popupBox alertBox" id="popup">
     	<div class="popupContent">
        	<span class="icon-close-popup closePopUp pull-right"><span class="hide-text">Close</span></span>
        	<p>Are you sure you want to delete this employee?</p>
            <div class="control-group">
            	<input type="button" name="" class="btn marginL50 closePopUp" value="Yes" id="yesRemove">
                <input type="button" name="" class="btn marginL10 closePopUp" value="No">                
            </div>
        </div>
     </div>
<!-- Pop Section End -->
<script type="text/javascript" src="../js/jquery.validate.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.9.2.custom.min.js"></script>
<script type="text/javascript" src="../js/handlebars.js"></script>
<script type="text/javascript" src="../js/jquery.dataTables.js"></script>
<script type="text/javascript" src="../js/employer.js"></script>
<script type="text/javascript" src="../js/utility.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$( ".planCategory" ).accordion({ 
		header: "h1",
		icons: { "header": "ui-icon-plusthickwhite", "headerSelected": "ui-icon-minusthick" },
		//icons: { "header": "icon-arrow-right pull-right marginT15", "headerSelected": "icon-arrow-down pull-right marginT15" }
		autoHeight: false
	});
	
	Handlebars.registerHelper('list', function(keys, map, separator) {
		var out = "";
		var sep = "";
		for(var i = 0; i < keys.length; i++ ) {
			if(keys[i].indexOf('&lt;') >= 0) {
				keys[i] = keys[i].replace('&lt;', '<');
			} else if(keys[i].indexOf('&gt;') >= 0) {
				keys[i] = keys[i].replace('&gt;', '<');
			}
		    out += sep + map[keys[i]];
		    sep = separator + " ";
		  }

		  return out;
		});
	
	var createTable =  function (table, segmentId, isDefault) {
		 var data = $('#' + table + '_' + segmentId).dataTable({
				"bDestroy":true,
				"bServerSide": true,
		        "fnServerData": DataTableUtils.fnDataTablesPipeline,
		        "sAjaxSource": "${pageContext.request.contextPath}/segment/getEmployeeList",
				"iDisplayLength":5,
				"bPaginate" : true,
				"bFilter": false,
		        "sPaginationType": "full_numbers",
		        "aaSorting":[[0, 'desc']],
		        "bLengthChange": false,
		        "oLanguage": {
		            "oPaginate": {
		              "sFirst": "<<",
		              "sLast":">>",
		              "sNext":">",
		              "sPrevious":"<"
		            }
		         },
		         "fnPreDrawCallback":function(){
			            $("#waiting_a").show();
			      },
		         "fnDrawCallback": function( oSettings ) {
						$("#waiting_a").hide();
						//$(".dataTables_length").hide();
						//$("#employeeTable_paginate").addClass("pagination pagination-mini pagination-right gutterR10 pull-right");
			      },
			      "fnServerParams": function(aoData)
			        {
	              //		var segmentId = $( "#employeeList input[name = 'segmentId']" ).val(),
						aoData.push({"name":"segmentId", "value":segmentId});
	              	    aoData.push({"name":"isDefault", "value":isDefault});
			        },
			    	"aoColumns": [
									{ 
										"mDataProp": "employeeCode",
										"sWidth":"10%",
										"sType" : "numeric"
									},
									{ 
										"sWidth":"12%",
										"bSortable" : false
									},
									{ 
										"mDataProp": "ageGroup",
										"sWidth":"10%",
										"bSortable" : false
									},
									{ 
										"mDataProp": "address.zip",
										"sWidth":"10%",
										"bSortable" : false
									},
									{ 
										"mDataProp": "salaryRange",
										"sWidth":"10%",
										"bSortable" : false
									},
									{
										"mDataProp": "employmentType",
										"sWidth":"9%",
										"bSortable" : false
									},
									{
										"sWidth":"9%",
										"bSortable" : false
									}
								],
							
							"aoColumnDefs":[
												{
													"fnRender": function(oObj)
    													{
															return oObj.aData.firstName + ' ' + oObj.aData.lastName;
    													},
    													"aTargets" :[1]
												},
												{
													"fnRender": function(oObj)
												    	{
															var employeeCode=oObj.aData.employeeCode;
															
															var view="<a href="+"/employer/employees"+ "/view/" + employeeCode + " title="+"'view'"+ "class="+"'icon-view hide-text'"+">View</a>";
															return view;
												    	},
												    	"aTargets" :[6]
													}
											]
							
				});}; 
				
	 $('h1.accordionHeading').click(function(event){
	       event.preventDefault();
	       var segmentId = $(this).data("segmentId");
	       var isDefault = $(this).data("isDefault");
	       var url = '${pageContext.request.contextPath}/segment/view/' + segmentId;
	       var viewTemplate = Handlebars.compile($("#segment_view_template").html());
	       
	       if($('#segmentDetail_' + segmentId + ' .planCategory').length == 0) { 
		       $.ajax({
		    	   url : url,
		    	   cache : false,
		    	   success : function(data){
		    		   var segmentData = data;
		    		   var segmentDiv = $('#segmentDetail_' + segmentId);
		    	       segmentDiv.html(viewTemplate(segmentData));
		    	       createTable('employeeTable', segmentId, isDefault);
		    	   }
		       });
	       }
	    });

	$('#js-addSegment').on('click', function(){
		document.location.href = '${pageContext.request.contextPath}/segment/';
	});
});    
</script>
</body>
</html>