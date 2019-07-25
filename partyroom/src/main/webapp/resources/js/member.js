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
	
	
	
	
	
	return {
		idCheck : idCheck
	};
})();
