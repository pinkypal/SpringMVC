<%@ include file="_tagLibs.jsp" %>
<%@ include file="_messages.jsp" %>

<header class="pageHeader">
    <div class="container">
        <div class="pull-left marginT10 marginB5">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="hide-text">British Driving School</a>
        </div>
        <aside class="pull-right">
            <ul class="topLinks align-right marginB5">
                <li><a href="${pageContext.request.contextPath}/admin/dashboard"><s:message code="label.layout.home" text="Home"/></a></li>
                <li>|</li>
                <li><a href="#"><s:message code="label.layout.whychooseus" text="Why Choose US"/></a></li>
                <li>|</li>
                <li><a href="#"><s:message code="label.layout.help" text="Hep" /></a></li>
                <li>|</li>
                <li><a href="#"><s:message code="label.layout.contactus" text="Contact Us"/></a></li>
            </ul>
            <div class="tollFree align-right"><s:message code="label.layout.callustollfree" text="Call Us Toll Free" /> <span>1800-3010-3333</span>
                <a href="#"><span><s:message code="label.layout.livechat" text="Live Chat"/></span></a>
            </div>
        </aside>
    </div>
</header>

<!-- Beginning of Navigation Bar -->
<div class="navigation">
  <div class="container navbar">
    <div class="navbar-inner"> <a href="#" class="brand"><span class="icon-home"></span>British Driving School</a>
      <nav class="nav pull-right">
	      <ul class="clearfix">
	        <li><a id="header_dashBoard" href="${pageContext.request.contextPath}/admin/dashboard" class="${'header_dashBoard' == selectedMenu ? 'active': '' }"><s:message code="label.layout.dashBoard" text="Dashboard" /></a></li>
	        <li><a id="header_report" href="${pageContext.request.contextPath}/admin/reports" class="${'header_report' == selectedMenu ? 'active': '' }"><s:message code="label.layout.reports" text="Report" /></a></li>
	      </ul>
     <%--  <security:authorize access="isAuthenticated()">
	          <li><a id="header_defineContribution" href="${pageContext.request.contextPath}/define-contributions" class="${'header_defineContribution' == selectedMenu ? 'active': '' }"><s:message code="label.layout.definecontribution" /></a></li>
	          <li><a id="header_defineEnrollmentPeriod" href="${pageContext.request.contextPath}/define-enrollment-period" class="${'header_defineEnrollmentPeriod' == selectedMenu ? 'active': '' }"><s:message code="label.layout.defineEnrollmentPeriod" /></a></li>
	          <li><a id="header_manageEmployee" href="${pageContext.request.contextPath}/employees/list" class="${'header_manageEmployee' == selectedMenu ? 'active': '' }"><s:message code="label.layout.manageemployee" /></a></li>
	          <li><a id="header_findPlans" href="${pageContext.request.contextPath}/plans" class="${'header_findPlans' == selectedMenu ? 'active': '' }"><s:message code="label.layout.findplans" /></a></li>
	          <li><a id="header_myaccount" href="${pageContext.request.contextPath}/" class="${'header_myaccount' == selectedMenu ? 'active': '' }"><s:message code="label.layout.myaccount" /></a></li>
      </security:authorize> --%>
      </nav>
    </div>
  </div>
</div>
<!-- End of Navigation Bar -->  