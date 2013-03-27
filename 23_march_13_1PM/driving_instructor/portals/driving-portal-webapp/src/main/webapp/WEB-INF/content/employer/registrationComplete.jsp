<%@ include file="../../../includes/_tagLibs.jsp" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Blue Sky</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta content="employerLayout" name="decorator">
<meta name="author" content="">
</head>
	<!-- Put content of breadcrum of here -->
	<content tag="breadcrum">
		<li><a href="#" class="disable"><s:message code="layout.breadcrum.employersRegistration" /></a></li>
	</content>	 
	<!-- selectedMenu is for header menu -->
	<parameter name="selectedMenu" value="header_manageEmployee"/>
	
    <!-- Beginning of Registration Steps -->
    <div class="steps clearfix">
        <div class="pull-left">
            Register in <span class="easy">3 Easy Steps</span>
        </div>
        <div class="stepsfollow">
            <ul>
                <li class="done"><span class="icon-circle">1</span>Employers Registration</li>
                <li class="done"><span class="icon-circle">2</span>Company Information</li>
                <li class="done"><span class="icon-circle">3</span>Registration Complete</li>
            </ul>
        </div>
    </div>
    <!-- End of Registration Steps -->
    <section class="registrationPage">         
    	<form id="signupForm" class="form-horizontal" method="get">
            <div class="form-section">
              <div class="content contentAlt">
                  <div class="thankYouPage">
                    <h1>Thank you for registering!</h1>
                    <p>Thank you for registering with us. Upon successful validation of your company credentials, you would receive an approval mail from exchange post which you can login into exchange and manage your employees.</p>
                    <p><a href="/employer">Click here to login to your account.</a></p>
                  </div>
              </div>
            </div>
          </form>
    </section>
<script type="text/javascript">
$.validator.setDefaults({
	submitHandler: function() { alert("submitted!"); }
});

$(document).ready(function() {
	$('[placeholder]').placeholder();
	// validate the comment form when it is submitted
	$("#commentForm").validate();

	// validate signup form on keyup and submit
	$("#signupForm").validate({
		rules: {
			legal_company_name: "required",
			company_name: "required",
			year_of_incorporation: "required",
			federal_tax_id: "required",
			current_ft_employees: "required",
			ft_employees: "required",
			company_logo: "required",
			addr_line_1: "required",
			city: "required",
			zip_code: "required",
			country: "required",
			state: "required"
		},
		messages: {
			legal_company_name: "Please enter your Legel Company Name",
			company_name: "Please enter your Company Name",
			year_of_incorporation: "Please enter your Year of Incorporation",
			federal_tax_id: "Please enter your Federal Tax ID",
			current_ft_employees: "Please enter your Current Full Time Employees",
			ft_employees: "Please enter your Full Time Employees",
			company_logo: "Please upload your Company Logo",
			addr_line_1: "Please enter your Address",
			city: "Please enter your City",
			zip_code: "Please enter your Zip Code",
			country: "Please enter your Country",
			state: "Please enter your State"
		},
		errorElement: "div"	
	});	
});
</script>
</body>
</html>