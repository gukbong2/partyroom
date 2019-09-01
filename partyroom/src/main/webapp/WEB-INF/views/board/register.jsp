<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<style>
.uploadResult {
	width: 100%;
	background-color: #e9ecef;
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



<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Register</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

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

<style>
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
<br /><br /><br />
<p class="center jumbotron jumbotron-fluid" style="font-weight: 1000; 
font-size: 1.5em; background-color: #475C7A; color: white; text-align: center;" > 문의글 작성</p>


<div class="bodyform"
		style="width: 75%; margin: auto; background-color: #e9ecef; padding: 20px;
		border-radius: 15px;">
		<div> <!-- 글쓰기 폼 -->
			 <form role="form" action="/board/register" method="post">
				<br style="clear: both">
				
				<!-- 후기 내역 시작 -->
				<div class="center">
					
				</div> <!-- 후기 내역 끝 -->
				
				<hr><br>
				<table style="margin: auto;">
					<tr>
						<td>
							<div class="col-xs-9 zeroPad">
								<input type="text" class="form-control" id="title" name="title" placeholder="제목" required><!--  -->
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<br>
							<textarea class="form-control" id="ckeditor" name="content" placeholder="content" required></textarea><!--  -->
						</td>
					</tr>
				</table>
				<input type="hidden" name='writer' id='writer' value="${member.name }" />
        	    <input type="hidden" name='email' id='email' value="${member.email }" />
				<br><br>
				
				  <div class="panel-heading">File Attach</div>
      <!-- /.panel-heading -->
		        <div class="form-group uploadDiv">
		            <input type="file" name='uploadFile' id="uploadFileBtn" multiple>
		        </div>
		        
		        <div class='uploadResult'> 
		          <ul>
		          
		          </ul>
		        </div>
				
				
				<!-- 글쓰기 버튼 -->
					<button type="submit" class="btn btn-default">Submit Button</button>&nbsp;
				<br>
				
			</form>
		</div> <!-- 글쓰기 폼 끝 -->
	<br>
	</div> 


	
<script>
    $(function(){
         
        CKEDITOR.replace( 'ckeditor', {
            width:'1330px',
            height:'600px',
        });
         
    });
</script>






<script>
$(document).ready(function(e){
  
    
	
	
	
	
	var formObj = $("form[role='form']");
	  
	  $("button[type='submit']").on("click", function(e){
	    
	    e.preventDefault();
	    
	    console.log("submit clicked");
	    
	    var str = "";
	    
	    $(".uploadResult ul li").each(function(i, obj){
	      
	      var jobj = $(obj);
	      
	      console.dir(jobj);
	      console.log("-------------------------");
	      console.log(jobj.data("filename"));
	      
	      
	      str += "<input type='hidden' name='attachList["+i+"].filename' value='"+jobj.data("filename")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].filetype' value='"+ jobj.data("type")+"'>";
	      
	    });
	    
	    console.log(str);
	    
	    formObj.append(str).submit();
	    
	  });
  
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  var maxSize = 5242880; //5MB
  
  function checkExtension(fileName, fileSize){
    
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(fileName)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true;
  }
  
  $("input[type='file']").change(function(e){
    var formData = new FormData();
    
    var inputFile = $("input[name='uploadFile']");
    
    var files = inputFile[0].files;
    
    for(var i = 0; i < files.length; i++){
      if(!checkExtension(files[i].name, files[i].size) ){
        return false;
      }
      formData.append("uploadFile", files[i]);
      
    }
    
    $.ajax({
      url: '/upload/uploadAjaxAction',
      processData: false, 
      contentType: false,
      data: formData,
      type: 'POST',
      dataType:'json',
        success: function(result){
          console.log(result); 
		  showUploadResult(result); //업로드 결과 처리 함수 
      }
    }); //$.ajax
    
  });  
  
  function showUploadResult(uploadResultArr){
	    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResult ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
    
       
		
		if(obj.image){
			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.filename);
			str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.filename+"' data-type='"+obj.image+"'"
			str +" ><div>";
			str += "<span> "+ obj.filename+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/upload/display?filename="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
		}else{
			var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.filename);			      
		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		      
			str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.filename+"' data-type='"+obj.image+"' ><div>";
			str += "<span> "+ obj.filename+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/resources/image/attach.png'></a>";
			str += "</div>";
			str +"</li>";
		}
    });
    
    uploadUL.append(str);
  }
  $(".uploadResult").on("click", "button", function(e){
	    
    console.log("delete file");
      
    var targetFile = $(this).data("file");
    var type = $(this).data("type");
    
    var targetLi = $(this).closest("li");
    
	    $.ajax({
	      url: '/upload/deleteFile',
	      data: {filename: targetFile, type:type},
	      dataType:'text',
	      type: 'POST',
	        success: function(result){
	           console.log(result);
	           
	           
	           
	           targetLi.remove();
	         }
	    }); //$.ajax
   });
  
  




  
  
  
  
});
</script>


<%@include file="../includes/footer.jsp"%>