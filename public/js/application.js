$(document).ready(function(){
	$("#answer-form").on("submit", function(e){
		e.preventDefault();
		alert("Working");
		var input = ($("answer-text").serialize());
		$.ajax ({
			type: $("answer-form").attr('method'),
			url: $("answer-form").attr('action'),
			data: input,
			dataType: "json",
		}).done(function (msg) {
			alert(msg);
		})
	})
})