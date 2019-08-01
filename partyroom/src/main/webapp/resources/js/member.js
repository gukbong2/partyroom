console.log("멤버서비스 모듈");

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
	
	function remove(email, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/check/' + email,
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	
	return {
		idCheck : idCheck
	};
})();
