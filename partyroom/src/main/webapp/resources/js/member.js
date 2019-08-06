
var memberService = (function() {
	
	function idCheck(email, callback, error) {
		
		$.get("/check/" + email + ".json", function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	
	function phoneCheck(phone, callback, error) {
		$.get("/check/phone" + phone + ".json", function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	

	
	return {
		idCheck : idCheck,
		phoneCheck : phoneCheck
	};
})();



//function remove(email, callback, error) {
//$.ajax({
//	type : 'delete',
//	url : '/check/' + email,
//	success : function(deleteResult, status, xhr) {
//		if (callback) {
//			callback(deleteResult);
//		}
//	},
//	
//	error : function(xhr, status, er) {
//		if (error) {
//			error(er);
//		}
//	}
//});
//}

