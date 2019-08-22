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
	width: 80px;
}

.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
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

	<div class='bigPictureWrapper'>
		 <div class='bigPicture'>
		 
		 </div>
	</div>
	
	


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
			
			function showImage(fileCallPath) {
				console.log("fileCallPath : " + fileCallPath);
				
				$(".bigPictureWrapper").css("display", "flex").show();
				
				 $(".bigPicture")
				  .html("<img src='/upload/display?filename="+fileCallPath+"'>")
				  .animate({width:'100%', height: '100%'}, 1000);
			}
			
			$(".bigPictureWrapper").on("click", function(e){
				  $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
				  setTimeout(() => {
				    $(this).hide();
				  }, 1000);
			});
			
			
			
			//uploadDiv 복사
			var cloneObj = $(".uploadDiv").clone();
			
			
			//파일 이름 출력
			var uploadResult = $(".uploadResult ul");
			
			function showUploadedFile(uploadResultArr) {

				var str = "";

			$(uploadResultArr).each(function(i, obj) {
			
				if(!obj.image) {

					var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.filename);
				       
					var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");
					
					str += "<li><div><a href='/upload/download?filename="+fileCallPath+"'>"+
			           "<img src='/resources/image/attach.png'>"+obj.filename+"</a>"+
			           "<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>"+
			           "<div></li>"
				   // str += "<li><a href='/upload/download?filename="+fileCallPath+"'><img src='/resources/image/attach.png'>"+obj.filename+"</a></li>"
				
				} else {
					
					var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.filename);
				       
				     var originPath = obj.uploadPath+ "\\"+obj.uuid +"_"+obj.filename;
				       
				     originPath = originPath.replace(new RegExp(/\\/g),"/");
				       
				     str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"+
		              "<img src='/upload/display?filename="+fileCallPath+"'></a>"+
		              "<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>"+
		              "<li>";
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
			
			$(".uploadResult").on("click", "span", function(e) {
				
				var targetFile = $(this).data("file");
				
				var type = $(this).data("type");
				
				console.log(targetFile);
				
				$.ajax({
					
					url : '/upload/deleteFile',
					data : {filename : targetFile,
							type : type	
					},
					dataType : 'text',
					type : 'post',
					success : function(result) {
						console.log(result);
					}
					
					
				});
				
			});
			
			
					
			
			
			
			
			
			
			
			
			
			
			
			
	</script>
	
	
</body>
</html>