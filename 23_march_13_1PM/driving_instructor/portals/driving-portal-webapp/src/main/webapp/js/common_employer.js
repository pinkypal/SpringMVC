/* *************** Plan Details Page *************** */
function plan_details() {
	var planCategoryModel, source, template;
	
	// Plan Category Data
	planCategoryModel = { planCategories: [
	   {
		   'planType' : 'Office Visit for Primary Doctor',
		  'PPO' : '$20 copay'
	   },
	   {
		  'planType' : 'Office Visit for Specialist',
		  'PPO' : '40% Co insurance after deductible'
	   },
	   {
		  'planType' : 'Annual Deductible',
		  'PPO' : '$2000.00'
	   },
	   {
		  'planType' : 'Annual Out of Pocket limit',
		  'PPO' : '$11,000.00'
	   }
	]};
	
	// Rendering Plan category view
	source   = $("#planCategoryView").html();
	template = Handlebars.compile(source);
	$('section.planCategory > div').html(template(planCategoryModel));
}

/* *************** Compare Plan Login Page *************** */
function compare_plan_login() {
	var tabs, tabContent, tabModule;
	
	tabs = $('#tabGroup > li > a');
	tabContent = $('#tabContent');
	
	tabModule = new tabingModule();
	tabModule.init(tabs, tabContent);
}

/* *************** Compare Plan Page *************** */
function compare_plan() {
	var tabs, tabContent, tabModule;
	
	tabs = $('#tabGroup > li > a');
	tabContent = $('#tabContent');
	
	tabModule = new tabingModule();
	tabModule.init(tabs, tabContent);
}

/* *************** Choose Benefits Page *************** */
function choose_benefits() {
	// Accordion main checkBox click event
	$('section.planCategory h1 input:checkbox').on('change', function() {
		var self = $(this);
		
		// If accordion checkBox is checked
		if(self.is(':checked')) {
			self.closest('.accordionHeading').next().find('input:checkbox').prop('checked', true);
		}
		
		// If accordion checkBox is not checked
		else {
			self.closest('.accordionHeading').next().find('input:checkbox').prop('checked', false);
		}
				
	});
	
	// Services checkBox click event
	$('section.planCategory > div').on('change', 'input:checkbox', function() {
		var self = $(this);
		
		// If clicked service checkBox is unchecked
		if(!(self.is(':checked'))) {
			// If all services gonna be unchecked
			if(self.closest('section.planCategory').find('input:checkbox:checked').length < 2) {
				self.closest('section.planCategory').find('h1 input:checkbox').prop('checked', false);
			}
		}
		
		// If clicked service checkBox is checked
		else {
			// If any service gonna be checked
			if(self.closest('section.planCategory').find('input:checkbox:checked').length > 0) {
				self.closest('section.planCategory').find('h1 input:checkbox').prop('checked', true);
			}
		}
	});
}


/* *************** Manage Employee Page *************** */
function manage_employee() {
	var manageEmployeeModel, source, template;
	
	// Manage Employee Data
	manageEmployeeModel = { manageEmployee: [
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="view" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="view" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'Active',
		  'view' : '<a class="icon-view hide-text" title="view" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : '<a href="#" title="delete" class="icon-trash hide-text removeRow">Delete</a>'
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'Active',
		  'view' : '<a class="icon-view hide-text" title="view" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : '<a href="#" title="delete" class="icon-trash hide-text removeRow">Delete</a>'
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="view" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="view" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'Active',
		  'view' : '<a class="icon-view hide-text" title="view" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : '<a href="#" title="delete" class="icon-trash hide-text removeRow">Delete</a>'
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'Active',
		  'view' : '<a class="icon-view hide-text" title="view" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : '<a href="#" title="delete" class="icon-trash hide-text removeRow">Delete</a>'
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="view" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="view" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'Active',
		  'view' : '<a class="icon-view hide-text" title="View" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="Edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : '<a href="#" title="Delete" class="icon-trash hide-text removeRow">Delete</a>'
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'Active',
		  'view' : '<a class="icon-view hide-text" title="view" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : '<a href="#" title="Delete" class="icon-trash hide-text removeRow">Delete</a>'
	   },{
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="View" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="Edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="View" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="Edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'Active',
		  'view' : '<a class="icon-view hide-text" title="View" href="manage-employee-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="Edit" href="manage-employee-edit-employee.html">Edit</a>',
		  'delete' : '<a href="#" title="Delete" class="icon-trash hide-text removeRow">Delete</a>'
	   }
	]};
	
	// Rendering Manage Employee view
	source   = $("#manageEmployeeView").html();
	template = Handlebars.compile(source);
	$('#manageEmployee').html(template(manageEmployeeModel));

}


/* *************** Employer Account Manage Employee Page *************** */
function my_account_manage_employee() {
	var accountManageEmployeeModel, source, template;
	
	// Employer Account Manage Employee Data
	accountManageEmployeeModel = { accountManageEmployee: [
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="view" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="view" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'Active',
		  'view' : '<a class="icon-view hide-text" title="view" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : '<a href="#" title="delete" class="icon-trash hide-text removeRow">Delete</a>'
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'Active',
		  'view' : '<a class="icon-view hide-text" title="view" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : '<a href="#" title="delete" class="icon-trash hide-text removeRow">Delete</a>'
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="view" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="view" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'Active',
		  'view' : '<a class="icon-view hide-text" title="view" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : '<a href="#" title="delete" class="icon-trash hide-text removeRow">Delete</a>'
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'Active',
		  'view' : '<a class="icon-view hide-text" title="view" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : '<a href="#" title="delete" class="icon-trash hide-text removeRow">Delete</a>'
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="view" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="view" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'Active',
		  'view' : '<a class="icon-view hide-text" title="View" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="Edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : '<a href="#" title="Delete" class="icon-trash hide-text removeRow">Delete</a>'
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'Active',
		  'view' : '<a class="icon-view hide-text" title="view" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : '<a href="#" title="Delete" class="icon-trash hide-text removeRow">Delete</a>'
	   },{
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="View" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="Edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'In Progress',
		  'view' : '<a class="icon-view hide-text" title="View" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="Edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : ''
	   },
	   {
		  'employeeid' : 'EM5895555',
		  'employeename' : 'Mr. Smith Jones',
		  'memberid' : 'ID5895',
		  'planname' : 'Insurance Name A',
		  'type' : 'Full Time',
		  'segment' : 'Alpha',
		  'status' : 'Active',
		  'view' : '<a class="icon-view hide-text" title="View" href="my-account-view-employee.html">View</a>',
		  'edit' : '<a class="icon-edit hide-text" title="Edit" href="my-account-edit-employee.html">Edit</a>',
		  'delete' : '<a href="#" title="Delete" class="icon-trash hide-text removeRow">Delete</a>'
	   }
	]};
	
	// Rendering Employer Account Manage Employee view
	source   = $("#accountManageEmployeeView").html();
	template = Handlebars.compile(source);
	$('#accountManageEmployee').html(template(accountManageEmployeeModel));

}
