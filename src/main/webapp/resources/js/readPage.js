/**
 * 
 */
Handlebars.registerHelper("preettifyDate",function(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var date = dateObj.getDate();
	var hh = dateObj.getHours();
	var mm = dateObj.getMinutes();
	
	return year+"/"+month+"/"+date+" "+hh+":"+mm;
});

var printData = function(replyArr, target, templateObject){
	 var template = Handlebars.compile(templateObject.html());
	 
	 var html = template(replyArr);
	 $(".replyLi").remove();
	 target.after(html);
}

function getPage(pageInfo){
	$.getJSON(pageInfo,function(data){
		console.log(data.list);
		printData(data.list,$("#repliesDiv"), $('#template'));
		printPaging(data.pageMaker, $(".pagination"));
		
		$(".timeline li:nth-child(2n)").addClass("timeline-inverted");
	});
}

var printPaging = function(pageMaker, target){
	console.log(pageMaker);
	var str='';
	
	if(pageMaker.prev){
		str += "<li class='paginate_button previous' aria-controls='dataTables-example' tabindex='0' id='dataTables-example_previous'><a href='"+(PageMaker.startPage-1)+"'> << </a></li>";
	}
	
	for(var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
		var strClass = pageMaker.cri.page == i? 'class=active':'';
		str += "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
	}
	
	if(pageMaker.next){
		str += "<li class='paginate_button next' aria-controls='dataTables-example' tabindex='0' id='dataTables-example_next'><a href='"+(PageMaker.endPage+1)+"'> >> </a></li>";
	}
	
	target.html(str);
}
