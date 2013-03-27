<article class="mainArticle">
<!-- Beginning of Main Article -->
        	<form id="signupForm" class="form-horizontal" method="get">
        <div class="form-section">
          <div class="content">
            <fieldset class="noBorder">
              <!-- Beginning of Main Heading -->
              <header class="sectionHeader">
                <h1 class="pageHeading">Manage Driving Instructors</h1>
                <h2 class="hide">Heading 2</h2>
              </header>
              <!-- End of Main Heading -->
              <div class="contentBlock">
                <div class="editDetailsBox">
                  <div class="control-group marginB20 marginT10">
                    <input type="button" id="js-add_employee" value="Add Instructor" class="btn btn-primary marginR10 deviceBottom">
                  </div>
                  <h3>Search Driving Instructors</h3>
                  <div class="control-group searchBy gutterB20 gutterT10">
                    <div class="pull-left marginR40">
                      <label for="search_by">Search By:</label>
                      <select class="select-large" name="search_by" id="search_by">
                        <option value="">Select</option>
                        <option value="instructor_name">Instructor Name</option>
                        <option value="instructor_area_code">Instructor AreaCode</option>
                      </select>
                    </div>
                    <div class="pull-left marginR20">
                      <label for="keyword">Keyword:</label>
                      <input type="text" name="keyword" id="keyword" class="input-large">
                    </div>
                    <div class="pull-left">
                      <label class="hide-text" for="go">Go:</label>
                      <input type="submit" name="go" id="go" value="GO" class="btn">
                    </div>
                  </div>
                  <h3>Driving Instructor List</h3>
                  <div id="manageEmployee" class="marginB20">
                  	
                  </div>
                </div>
              </div>
            </fieldset>
            <div class="controls-row gutterB20">
              <input type="button" id="js-findPlans" class="btn btn-primary pull-left" value="Find Plans">
              <div class="pagination pagination-mini pagination-right gutterR10 pull-right">
                  <ul>
                    <li><a href="#">«</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">»</a></li>
                  </ul>
              </div>
            </div>
          </div>
        </div>
      </form>
<!-- End of Main Article --> 
</article>

<script id="manageEmployeeView" type="text/manageEmployee-template">
        <table class="employeeListTable table table-striped" data-role="table" id="my-table" data-mode="reflow">
            <thead>
                <tr class="first-row">
					<th>Employee ID</th>
					<th>Employee Name</th>
					<th>Member ID</th>
					<th>Plan Name</th>
					<th>Type</th>
					<th>Segment <span class="icon-sorting-down"></span></th>
					<th colspan="5">Status</th>
				  </tr>
            </thead>
            <tbody>
                {{#manageEmployee}}
				<tr>
					<td>{{employeeid}}</td>
					<td>{{employeename}}</td>
					<td>{{memberid}}</td>
					<td>{{planname}}</td>
					<td>{{type}}</td>
					<td>{{segment}}</td>
					<td class="changeStatus">{{status}}</td>
					<td>{{{view}}}</td>
					<td>{{{edit}}}</td>
					<td>{{{delete}}}</td>
					<td>{{{terminate}}}</td>
				</tr>
                {{/manageEmployee}}
             </tbody>
        </table>
    </script>