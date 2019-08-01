<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@include file="../includes/header.jsp"%>

<p class="center jumbotron jumbotron-fluid"
		style="font-weight: 1000; font-size: 1.5em; background-color: #475C7A;
		color: white; text-align: center;" >갤러리</p>
		

<style>
.container-fluid {
  width: 80%;
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
}
</style>
		
		
 <div class="container-fluid">
    <!--Carousel Wrapper-->
    <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails" data-ride="carousel">
      <!--Slides-->
      <div class="carousel-inner" role="listbox">
        <div class="carousel-item active">
          <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(88).jpg" alt="First slide">
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(121).jpg" alt="Second slide">
        </div>
        <div class="carousel-item">
          <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(31).jpg" alt="Third slide">
        </div>
      </div>
      <!--/.Slides-->
      <!--Controls-->
      <a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
      <!--/.Controls-->
      <ol class="carousel-indicators">
        <li data-target="#carousel-thumb" data-slide-to="0" class="active"> <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Others/Carousel-thumbs/img%20(88).jpg"
            class="img-fluid"></li>
        <li data-target="#carousel-thumb" data-slide-to="1"><img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Others/Carousel-thumbs/img%20(121).jpg"
            class="img-fluid"></li>
        <li data-target="#carousel-thumb" data-slide-to="2"><img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Others/Carousel-thumbs/img%20(31).jpg"
            class="img-fluid"></li>
      </ol>
    </div>
    <!--/.Carousel Wrapper-->

  </div>