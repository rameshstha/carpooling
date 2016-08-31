"use strict";
$(function() {
	$("#loader").hide().ajaxStart(function() {
		$(this).show();
	}).ajaxStop(function() {
		$(this).hide();
	});
	
	
	
	window.onload = function() {
		loadPostDetails($('#postData').val());
		loadPostDetailsRide($('#postDataRide').val());
	}

});

/*
 * function loadPostDetails(data){ var html='';
 * 
 * console.log(JSON.parse(data).length); for(var i=0;i<JSON.parse(data).length;i++){
 * console.log(JSON.parse(data)[i].fullname);
 * 
 * console.log(data); $.each(JSON.parse(data),function(index,item){
 * console.log("test=="+item.fullname); html+='<p><span>Name: </span><em>'+item.fullname+'</em><span>Email:
 * </span>'; html+='<p>'+item.post+'</p>'; });
 * 
 * $('#postInfo').html('').html(html); // loadPost(); }
 */

function loadPostDetails(data) {

	$("#mainContainer").html("");
	if (data == "") {
		alert("Data needed");
	} else {

		$
				.ajax({
					"type" : "GET",
					"data" : JSON.parse(data)

				})
				.done(
						function() {
							for (var i = 0; i < JSON.parse(data).length; i++) {
								$("#mainContainer").append("<div class=\"box\">");
								$("#mainContainer").append(
										"<p><em>" + JSON.parse(data)[i].source +"</em>&nbsp; to &nbsp; <em>"+JSON.parse(data)[i].destination
												+ "</em></p>");
								$("#mainContainer").append(
										"<p>" + JSON.parse(data)[i].seat+"<em> Seat Required :: Non Smoker"
												+ "</em></p>");
								$("#mainContainer").append(
										"<p>On:" + JSON.parse(data)[i].dateandtime + "</em>,&nbsp;<em> By: " + JSON.parse(data)[i].fullname
												+ "</em></p>");
				
								$("#mainContainer")
										.append(
												" <em><button id=\"likeClick\" class=\"btn btn-success\" data-postid=\""
														+ JSON.parse(data)[i].postid
														+ "\">Like</button>&nbsp;&nbsp;<button id=\"showComment\" class=\"btn btn-default\" data-postid=\""
														+ JSON.parse(data)[i].postid
														+ "\">Show Comment</button></em></p>");
								$("#mainContainer").append("</div>");
							}

						}).fail(
						function(xhr, statusText, errorText) {
							$("#mainContainer").html(
									"<div class='error'><h1>" + xhr.status
											+ "</h1>" + errorText + "</div>");
							// console.log(xhr.status+" -- "+statusText+" --
							// "+errorText);

						});
		$("#mainContainer").on("click", "#showComment", function() {
			var postid = $(this).data("postid");
			var my = $(this);
			$.ajax({
				"type" : "GET"
			}).done(function(allcomment) {
				/*
				 * var allContent = "<div class='comment'> "; for (var j = 0; j <
				 * allcomment.length; j++) { allContent += "<div class='cname'><strong>Comments
				 * By: </strong>" + allcomment[j].name + " <em> "+
				 * allcomment[j].email+" </em></div>"; allContent += "<div
				 * class='cbody'>" + allcomment[j].body + "</div>"; }
				 * allContent += "</div>"; my.after($(allContent)); my.hide();
				 */
				console.log(postid);

			})

		});
		$("#mainContainer").on("click", "#likeClick", function() {
			var postid = $(this).data("postid");
			var userid = $(this).data("postid");
			var my = $(this);
			$.ajax({
				"type" : "GET"
			}).done(function(allcomment) {
				/*
				 * var allContent = "<div class='comment'> "; for (var j = 0; j <
				 * allcomment.length; j++) { allContent += "<div class='cname'><strong>Comments
				 * By: </strong>" + allcomment[j].name + " <em> "+
				 * allcomment[j].email+" </em></div>"; allContent += "<div
				 * class='cbody'>" + allcomment[j].body + "</div>"; }
				 * allContent += "</div>"; my.after($(allContent)); my.hide();
				 */
				console.log(postid);

			})

		});
	}
};

function loadPostDetailsRide(data) {

	$("#mainContainer").html("");
	if (data == "") {
		alert("Data needed");
	} else {

		$
				.ajax({
					"type" : "GET",
					"data" : JSON.parse(data)

				})
				.done(
						function() {
							for (var i = 0; i < JSON.parse(data).length; i++) {
								$("#mainContainerRide").append("<div class=\"box\">");
								$("#mainContainerRide").append(
										"<p><em>" + JSON.parse(data)[i].source +"</em>&nbsp; to &nbsp; <em>"+JSON.parse(data)[i].destination
												+ "</em></p>");
								$("#mainContainerRide").append(
										"<p>" + JSON.parse(data)[i].seat+"<em> Seat Required :: Non Smoker"
												+ "</em></p>");
								$("#mainContainerRide").append(
										"<p>On:" + JSON.parse(data)[i].dateandtime + "</em>,&nbsp;<em> For: " + JSON.parse(data)[i].fullname
												+ "</em></p>");
				
								$("#mainContainerRide")
										.append(
												" <em><button id=\"likeClickRide\" class=\"btn btn-success\" data-postidRide=\""
														+ JSON.parse(data)[i].postid
														+ "\">Like</button>&nbsp;&nbsp;<button id=\"showCommentRide\" class=\"btn btn-default\" data-postid=\""
														+ JSON.parse(data)[i].postid
														+ "\">Show Comment</button></em></p>");
								$("#mainContainerRide").append("</div>");
							}

						}).fail(
						function(xhr, statusText, errorText) {
							$("#mainContainerRide").html(
									"<div class='error'><h1>" + xhr.status
											+ "</h1>" + errorText + "</div>");
							// console.log(xhr.status+" -- "+statusText+" --
							// "+errorText);

						});
		$("#mainContainerRide").on("click", "#showCommentRide", function() {
			var postid = $(this).data("postidRide");
			var my = $(this);
			$.ajax({
				"type" : "GET"
			}).done(function(allcomment) {
				/*
				 * var allContent = "<div class='comment'> "; for (var j = 0; j <
				 * allcomment.length; j++) { allContent += "<div class='cname'><strong>Comments
				 * By: </strong>" + allcomment[j].name + " <em> "+
				 * allcomment[j].email+" </em></div>"; allContent += "<div
				 * class='cbody'>" + allcomment[j].body + "</div>"; }
				 * allContent += "</div>"; my.after($(allContent)); my.hide();
				 */
				console.log(postid);

			})

		});
		$("#mainContainerRide").on("click", "#likeClickRide", function() {
			var postid = $(this).data("postid");
			var userid = $(this).data("postid");
			var my = $(this);
			$.ajax({
				"type" : "GET"
			}).done(function(allcomment) {
				/*
				 * var allContent = "<div class='comment'> "; for (var j = 0; j <
				 * allcomment.length; j++) { allContent += "<div class='cname'><strong>Comments
				 * By: </strong>" + allcomment[j].name + " <em> "+
				 * allcomment[j].email+" </em></div>"; allContent += "<div
				 * class='cbody'>" + allcomment[j].body + "</div>"; }
				 * allContent += "</div>"; my.after($(allContent)); my.hide();
				 */
				console.log(postid);

			})

		});
	}
};



