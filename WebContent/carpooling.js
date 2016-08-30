$(function() {
	

	$("form[name='registration']").validate({
		// Specify validation rules
		rules : {
			zip : {
				required : true,
				regx : /^[0-9]{5}$/
			},
			birthyear : {
				required : true,
				regx : /^[0-9]{4}$/
			},
			password:{
				required:true,
				regx:/^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])[0-9a-zA-Z]{6,}$/
			},
			email:{
				required:true,
				regx:/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/
			},
			birthyear:{
				required:true,
				checkAge:birthyear
			}
				
		},
		messages : {
			zip : "Zip must be numbers of exactly length 5",
			birthyear:"Only persons over the age of 18 can register",
			password:"Password must be atleast 6 letters having atlest one capital letter, one small letter and one number",
			email:"Enter the valid email"
		},
		submitHandler : function(form) {
			form.submit();
		}
	});

});

$.validator.addMethod("regx", function(value, element, regexpr) {
	return regexpr.test(value);
});

$.validator.addMethod("checkAge", function (value, element) {
    if (this.optional(element)) {
        return true;
    }

    var birthyear = value;
   
    if (new Date().getFullYear() - birthyear <= 18) {
        return false;
    }
    return true;
});
