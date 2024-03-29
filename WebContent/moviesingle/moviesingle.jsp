<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bean.Movie" import="java.util.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>电影简介</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <script src="js/jquery-3.2.1.slim.min.js"></script>
    <link rel="stylesheet" href="css/styles-merged.css">
    <link rel="stylesheet" href="css/style.min.css">
    <link rel="stylesheet" href="css/custom.css">
  </head>
  <body>
  <div class="probootstrap-loader"></div>

  <header role="banner" class="probootstrap-header">
    <div class="container">
       
        
        <a href="#" class="probootstrap-burger-menu visible-xs" ><i>菜单</i></a>
        <div class="mobile-menu-overlay"></div>

        <nav role="navigation" class="probootstrap-nav hidden-xs">
          <ul class="probootstrap-main-nav">
         
          	<li><a href="/BadBanana/IndexMovieInformationIndexServlet">首页</a></li>
            <li class="active"><a href="moviesingle.jsp">电影简介</a></li>
            <li><a href="portfolio.jsp">演职员表</a></li>
            <li><a href="services.jsp">评论</a></li>
            <li><a href="/BadBanana/FindAllMovieInformationServlet">热门电影</a></li>
           				<c:if test="${empty user }">
							<li class="mr-lg-4 mr-3"><a href="/BadBanana/loginandregister/login.jsp?loginPath=moviesingle" class="scroll">登录</a></li>
						</c:if>
						<c:if test="${!empty user }">
						<li class="mr-lg-4 mr-3"><a href="/BadBanana/UserServlet?method=userHome&homeName=${user.username }" class="scroll">${user.username}</a><a>${time}!</a></li>
						<li class="mr-lg-4 mr-3"><a href="/BadBanana/clearSessionServlet?quitPath=moviesingle" class="scroll">退出</a></li>
						</c:if>
          </ul>
          <div class="extra-text visible-xs"> 
            <a href="#" class="probootstrap-burger-menu"><i>菜单</i></a>
          </div>
        </nav>
    </div>
    <script type="text/javascript">
   	 var col=[  "<a href='#' onclick='collection(0)'>收藏该电影</a>",
   		 		"<a href='#' onclick='collection(1)'>取消收藏</a>"]; 
   	 var method=["collection","cancelCollection"];
    	function collection(index) {
    		console.log(index);
    		$.ajax({
				url : "/BadBanana/CollectionServlet",
				data : {
					"movieid" : "${movie.movieid}",
					"userid":"${user.userid}",
					"method":method[index%2]
				},
				success : function(data) {
  			  		$("#collection").html(col[data.meth]);
  			  		console.log("success");
				},
				dataType : "json",
				async : false
			});
    		
    	}
    </script>
  </header>
  <!-- END: header -->

  <div class="probootstrap-main">
  
    <section class="probootstrap-section-half">
      <div class="probootstrap-image probootstrap-animate" data-animate-effect="fadeIn" style="background-image: url(${movie.imgPathOne})"></div>
      <div class="probootstrap-text">
        <div class="probootstrap-inner probootstrap-animate">
          <h1 class="heading"> ${movie.moviename}</h1>
          <p>${movie.generalizeOne}</p>
          <p><a href="https://baike.baidu.com" class="btn btn-primary">了解更多</a>
          		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          		
                    <label id="collection" name="collection" >
                	    <c:if test="${empty user }">
							<a href="#" onclick="alert('请先登录')" class="scroll">收藏该电影</a>
						</c:if>
						<c:if test="${!empty user }">
							<c:if test="${isCollection }">
								<a href='#' onclick='collection(1)'>取消收藏</a>
							</c:if>
							<c:if test="${!isCollection }">
								<a href='#' onclick='collection(0)'>收藏该电影</a>
							</c:if>
						</c:if>
                    </label>
          </p>

        </div>
      </div>
    </section>
    <!-- END section -->
    <section class="probootstrap-section-half probootstrap-reverse">
      <div class="probootstrap-image probootstrap-animate"  data-animate-effect="fadeIn" style="background-image: url(${movie.imgPathTwo})"></div>
      <div class="probootstrap-text">
        <div class="probootstrap-inner probootstrap-animate">
          <h1 class="heading">剧情简介</h1>
          <p>${movie.generalizeTwo}</p>
        </div>
      </div>
    </section>
    <!-- END section -->
   
    <div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >网站建设</a></div>
    <!-- END section -->
    
    <!-- END section -->
  </div>
  <footer class="probootstrap-footer">
    <div class="container">
      <div class="row">
      
      </div>
    </div>
  </footer>

  

  <div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-chevron-thin-up"></i></a>
  </div>
  

  <script src="js/scripts.min.js"></script>
  <script src="js/main.min.js"></script>
  <script src="js/custom.js"></script>

  </body>
</html>