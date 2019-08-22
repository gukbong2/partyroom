<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
</style>

</head>
<body>
	
	<h1>ajax uplaod</h1>
	
	<div class='uploadDiv'>
		<input type='file' name='uploadFile' multiple>
	</div>

	<div class='uploadResult'>
		<ul>

		</ul>
	</div>


	<button id='uploadBtn'>Upload</button>


	


	<script type="text/javascript">
			
			
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; //5MB
		
			function checkExtension(fileName, fileSize) {
		
				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}
		
				if (regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}
			
			//uploadDiv 복사
			var cloneObj = $(".uploadDiv").clone();
			
			
			//파일 이름 출력
			var uploadResult = $(".uploadResult ul");
			
			function showUploadedFile(uploadResultArr) {

				var str = "";

			$(uploadResultArr).each(function(i, obj) {
			
				if(!obj.image) {
					str += "<li><img src='/resources/image/attach.png'>" + obj.filename + "</li>";
				} else {
					var fileCallPath = encodeURIComponent (obj.uploadPath + "/s_" + obj.uuid + "_" + obj.filename);
					
					str += "<li><img src='/upload/display?filename="+fileCallPath+"'></li>";
				}
				
				});
			
				uploadResult.append(str);
			}
			
			
			
			
			$("#uploadBtn").on("click", function(e) {
				
				var formData = new FormData();
				
				var inputFile = $("input[name='uploadFile']");
				
				var files = inputFile[0].files;
				
				console.log(files);
				
				for (var i = 0; i < files.length; i++) {
					
					if(!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
					
					formData.append("uploadFile", files[i]);
				}
				
				$.ajax({
					url : '/upload/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'post',
					dataType : 'json',
					success : function(result) {
						
						console.log(result);
						
						showUploadedFile(result);
						
						$(".uploadDiv").html(cloneObj.html());
						
					}
				
				});
				
			});
			
			
					
			
			
			
			
			
			
			
			
			
			
			
			
	</script>
	
	
</body>
</html>