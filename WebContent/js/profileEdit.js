$(function(){
	console.log($('#jsonArrayValue').val());
	loadprofileData($('#jsonArrayValue').val());
});

function loadprofileData(data){
	$("#fullname").val(JSON.parse(data)[0].fullname);
	$("#gender").val(JSON.parse(data)[0].gender);
	$("#state").val(JSON.parse(data)[0].state);
	$("#city").val(JSON.parse(data)[0].city);
	$("#street").val(JSON.parse(data)[0].street);
	$("#zip").val(JSON.parse(data)[0].zipcode);
	$("#birthyear").val(JSON.parse(data)[0].birthyear);
	$("#email").val(JSON.parse(data)[0].email);
	$("#password").val(JSON.parse(data)[0].password);
	$("#userid").val(JSON.parse(data)[0].userid);
}