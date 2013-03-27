Plan = {
	template : {},
	draggable_opts : { 
		revert: "invalid",
		handle: ".over",
		start: function(){
			$('#sigmentsColls').slideDown();
			$(".pageFooter").animate({"padding-bottom" : 275});
			$('#collepsSegment span').removeClass('icon-arrow-up-large');				
		},
		helper: function(){
			//var dummy = $(this).clone().width($(this).outerWidth()).css({zIndex : '9999'});
			var dummy = $(this).find('.planNme a').clone();
				dummy = $(dummy).text();
			/*$('ul#dump').append("<li>"+dummy+"</li>").find("li").width("200px").css({'z-index' : '9999'});*/
			return $('ul#dump').append("<li>"+dummy+"</li>").find("li").width("auto").css({'z-index' : '9999'});
		},
		stop: function(){
			$('ul#dump li').remove();
		}, 
		cursorAt: { right: 5, top: 20 },
		opacity: 0.35
	},
	populate : function(productCategory, callbackFunc) {
		$("#js-" + productCategory+ "-link .dataList > ul").empty();
		var queryString = Plan.getQueryString(productCategory);
		$.ajax({
			url:"/employer/plans/search/result?" + queryString,
			async:false,
			//TODO
			type:"GET",
			success : function(data, status, jqXHR){
				callbackFunc(productCategory, data);
			},
			error : function(data, status, jqXHR){
				
			}
		});
	},
	createPaginator : function(productCategory, totalRecords) {
		var displayLength = 10;
		$("#js-" + productCategory+ "-link .pagination").smartpaginator({ 
			totalrecords: totalRecords,
			recordsperpage: displayLength,
			controlsalways: true,
			next: 'Next', 
			prev: 'Prev', 
			first: 'First', 
			last: 'Last',
			length: 4,
			onchange: function(newPage) {
			//	var queryString = Plan.getQueryString(productCategory) + "&rs=" + displayLength * (newPage - 1);
				$("#js-" + productCategory+ "-link .listData .displayStart").val(displayLength * (newPage - 1));
				Plan.populate(productCategory, Plan.populatePlans);
			},
			theme: 'black' });
	},
//	populatePlans : function(productCategory) {
//		$("#js-" + productCategory+ "-link .dataList > ul").empty();
//		var data = Plan.fetchPlans(productCategory);
//		var template = Plan.getTemplate(productCategory);
//		$.each(data.planMetaData, function(index, item){
//			$("#js-" + productCategory+ "-link .dataList > ul").append(template(item));
//		});
//		Plan.makeDraggable(productCategory);
//		return data;
//	},
//	initializePlans : function(productCategory) {
//		var data = Plan.populatePlans(productCategory);
//		Plan.createPaginator(productCategory, data.totalRecords);
//		Plan.initializeFilters(productCategory, data.filters);
//		Plan.initializeSorting(productCategory);
//	},
	populatePlans : function(productCategory, data){
		var template = Plan.getTemplate(productCategory);
		$.each(data.planMetaData, function(index, item){
			$("#js-" + productCategory+ "-link .dataList > ul").append(template(item));
		});
		Plan.makeDraggable(productCategory);
	},
	populatePlansAndPaginator : function(productCategory, data){
		Plan.populatePlans(productCategory, data);
		Plan.createPaginator(productCategory, data.totalRecords);
	},
	populatePage : function(productCategory, data){
		Plan.populatePlansAndPaginator(productCategory, data);
		Plan.initializeFilters(productCategory, data.filters);
		Plan.initializeSorting(productCategory);
	},
	getQueryString : function(productCategory) {
		var queryArray =  $("#js-" + productCategory+ "-link").serializeArray();
//		$.each(queryArray, function(index, query){
//			if(query.value === ""){
//				queryArray.splice(index, 1);
//			}
//		});
//		return $.param(queryArray);
		
		queryArray = $.grep(queryArray, function(query){
			if(query.value === ""){
				return false;
			}
			return true;
		});
		return $.param(queryArray);// + "&t=" + $("#sessionToken").val();
		
		
//		var displayLength = 10;
//		return "rtf=" + displayLength;
	},
	getTemplate : function(productCategory) {
		if(!Plan.template[productCategory]){
			Plan.template[productCategory] = Handlebars.compile($("#" + productCategory + "_list_template").html());
		}
		return Plan.template[productCategory];
	},
	initializeSorting : function(productCategory){
		$('#js-' + productCategory+ '-link .sorting > ul > li > a' ).click(function(){
			var name = $(this).data('name');
			var order = $(this).data('order');
			$('#js-' + productCategory+ '-link .sorting > ul > li > a > span' ).removeClass();
			$('#js-' + productCategory+ '-link .sorting > ul > li > a' ).data("order", "");
			if(order == undefined || order == '' || order == 'desc'){
				order = 'asc';
				$(this).children("span").addClass("icon-sorting-up");
			}else{
				order = 'desc';	
				$(this).children("span").addClass("icon-sorting-down");
			}
			$(this).data('order', order);
			$('#js-' + productCategory+ '-link .listData .sortColumn').val(name);
			$('#js-' + productCategory+ '-link .listData .sortOrder').val(order);
			Plan.populate(productCategory, Plan.populatePlans);
		});
	},
	initializeFilters : function(productCategory, filters){
		
		$.each(filters, function(index, filter){
			if(filter.values != undefined){
				Plan.initializeListFilter(productCategory, filter);
			}else if(filter.max != undefined && filter.min != undefined){
				Plan.initializeSliderFilter(productCategory, filter);
			}
		});
			//Plan.initializeSliderFilter(productCategory, data.filters[0]);
	},
	initializeSliderFilter : function(productCategory, filterData){
		var name = filterData.name.capitalize(),
		min = filterData.min,
		max = filterData.max;
		
		// Slider already Exists
	/*	try{
			$("#" + productCategory + name).slider("widget");
			return;
		}catch(e){
		}*/
		
		// Range Slider start
		$("#js-" + productCategory+ "-link ." + name + "Filter").slider({
			range: true,
			min: min,
			max: max,
			values: [min, max],
			slide: function( event, ui ) {
				$( "#amount" ).val( "$" + ui.values[0] + " - $" + ui.values[1] );
				$(ui.handle).text('$'+ui.value);
				$(ui.handle).next().val(ui.value);
			},
			create: function( event, ui ) {
				var firstA = $(this).find('a').first();
				var lastA = $(this).find('a').last();
				
				firstA.text('$'+$(this).slider("values", 0));
				$('<input type="hidden" name="'+ "filter_" + filterData.name +'_min" />').insertAfter(firstA); 
				
				lastA.text('$'+$(this).slider("values", 1));
				$('<input type="hidden" name="'+ "filter_" + filterData.name +'_max"/>').insertAfter(lastA);
			},
			stop: function( event, ui ) {
				Plan.clearInputOnFilterChange(productCategory);
				Plan.populate(productCategory, Plan.populatePlansAndPaginator);
			}
		});
		$("#js-" + productCategory+ "-link ." + name + "Filter").parent().show();
		
	},
	initializeListFilter : function(productCategory, filterData){
		var name = filterData.name.capitalize(),
		values = filterData.values;
		
		var filterContainer = $("#js-" + productCategory+ "-link ." + name + "Filter");
		if(filterContainer.is("select")){
			filterContainer.attr('name', 'filter_' + filterData.name);
			$.each(filterData.values, function(index, value){
				filterContainer.append('<option value=' + value + '>' + value + '</option>')
			});
		}else if(filterContainer.hasClass('radio')){
			$.each(filterData.values, function(index, value){
				filterContainer.append('<input type="radio" name='+ "filter_" + filterData.name +' value='+ value +'>'+ value +'</input>');
			});
		}else if(filterContainer.hasClass('checkbox')){
			$.each(filterData.values, function(index, value){
				filterContainer.append('<input type="checkbox" name='+ "filter_" + filterData.name +' value='+ value +'>'+ value +'</input>');
			});
		}
		$("#js-" + productCategory+ "-link ." + name + "Filter").parent().show();
	},
	clearInputOnFilterChange : function(productCategory){
		$("#js-" + productCategory+ "-link .listData .displayStart").val("");
	},
	displayTab : function(tabName){
		var productCategory = tabName.substring(tabName.indexOf('-') + 1, tabName.lastIndexOf('-'));
		if(!$("#" + tabName + " .pageLoaded").val() || $("#" + tabName + " .pageLoaded").val() == "0"){
			Plan.populate(productCategory, Plan.populatePage);
			$("#" + tabName + " .pageLoaded").val("1");
		}
	},
	makeDraggable : function(productCategory){
		// Draggable
		$("#js-" + productCategory+ "-link .dataList > ul > li" ).draggable(Plan.draggable_opts);
	},
	makeDroppable : function(){
		$( "section.sigmentContaner" ).droppable({
			activeClass: "",
			hoverClass: "dropHover",
			accept: ":not(.ui-sortable-helper)",
			tolerance: 'pointer',
			drop: function( event, ui) {
				if(ui.draggable.find('.planNme a').text().length && $(this).find('ul.addPlanin').index() != -1){
					var planSelectionType = $(this).find("input.planSelectionType").val();
					if(planSelectionType != 'SELECTED_PLAN'){
						return;
					}
					var segmentId = $(this).data("segmentId"),
					planId = ui.draggable.find('div.dataRow').data("planId"),
					productCategory = ui.draggable.parents(".planList").siblings(".listData").find("input.productCategory").val(),
					dump = $(this).find('ul.planAddedin'),
					target = $(this).find(".planLists"),
					that = $(this);
					
					$.ajax({
						url:"/employer/plans/addPlanToSegment?segmentId=" + segmentId + "&planId=" + planId + "&productCategory=" + productCategory,
						type:"GET",
						success : function(data, status, jqXHR){
							dump.prepend($('<li class="clearfix" data-plan-id="' + planId + '"><span class="pull-left">'+ui.draggable.find('.planNme a').text()+'</span><span class="icon-remove-plan pull-right marginT5 marginR5"><span class="hide-text">Remove</span></span></li>'));
							if($('li',dump).length < 3){
								that.find('ul.addPlanin li').first().remove();
							}
							that.find('a.js-coveredEmployees').text(data.coveredEmployeeCount);
						},
						error : function(data, status, jqXHR){
							
						}
					});
				}
			}
		});
	}
};