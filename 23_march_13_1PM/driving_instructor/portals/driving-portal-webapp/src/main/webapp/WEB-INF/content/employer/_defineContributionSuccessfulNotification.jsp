<%@include file="../../../includes/_tagLibs.jsp" %>
<div id="overlay"></div>
<div class="popupBox" id="popup">
  <div class="popupTitle clearfix">
    <h1 class="popupTitleText pull-left"><s:message code="label.employee.defineContributionSuccessfulNotification.employerContributionHasBeenDefined" /></h1>
    <h2 class="hide">Load Plans from Library</h2>
    <span role="button" class="icon-close-popup closePopUp pull-right"><span class="hide-text"><s:message code="label.employee.defineContributionSuccessfulNotification.close" /></span></span>
  </div>
  <div class="popupContent">
    <input type="button" id="js-enrollmentPeriod" name="define_enrollment_period" value="<s:message code="label.employee.defineContributionSuccessfulNotification.defineEnrollmentPeriod" />" class="btn btn-primary marginR10">
    <input type="button" id="js-manageEmployees" name="manage_employees" value="<s:message code="label.employee.defineContributionSuccessfulNotification.manageEmployees" />" class="btn btn-primary marginR10">
    <input type="button" id="js-findPlan" name="find_plan" value="<s:message code="label.employee.defineContributionSuccessfulNotification.findPlans" />" class="btn btn-primary">
  </div>
</div>