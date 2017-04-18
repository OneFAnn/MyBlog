<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/template.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.bootpag.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Myblog</title>


<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background-color: #ebebeb;
}

ul, li {
	padding: 0;
	margin: 0;
	list-style: none;
}

#head {
	width: 100%;
	height: 560px;
	position: relative;
}

#head img {
	width: 100%;
	height: 100%;
}

#head #nav {
	width: 100%;
	height: 80px;
	position: absolute;
	top: 0;
}

#head #nav #nav-ul li a {
	color: white;
	font-family: "微软雅黑";
	text-decoration: none;
	display: block;
	float: left;
	line-height: 60px;
	width: 90px;
	padding: 10px;
	text-align: center;
	border-top: 4px solid transparent;
}

#head #nav #nav-ul li a:hover {
	
}

#head #nav:hover {
	background-color: white;
}

#head #nav #nav-ul li a:hover {
	border-top-color: #4fa5ee;
}

#head #nav #nav-ul li {
	position: relative;
	color: white;
}

#head-title {
	position: absolute;
	top: 380px;
	color: white;
	text-align: center;
	width: 100%;
	font-size: 50px;
	font-family: 'country_gothic', Arial, Helvetica, Simsun, STHeiti;
}
#main {
	position: relative;
	box-sizing: border-box;
	padding: 20px 15px 20px 15px;
}

#article-list .article {
	width: 67%;
	padding-right: 30px;
	padding-left: 30px;
	padding: 30px;
	background-color: #fff;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.2);
	padding-bottom: 30px;
	margin-bottom: 10px;
	border-bottom: 1px solid #e8e8e8;
}

#article-list .article .article-head h1 {
	display: block;
	font-size: 2em;
	-webkit-margin-before: 0.67em;
	-webkit-margin-after: 0.67em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
	font-weight: bold;
}

#article-list .article .article-head h1 .article-link {
	color: inherit;
	text-decoration: none;
}

#article-list .article .article-head span {
	font-size: 14px;
	margin-top: 0;
	font-weight: 300;
	font-family: "Lora", serif;
	margin-bottom: 1rem;
	color: #9a9a9a;
}

#article-list .article  .article-content {
	margin-top: .8em;
}

#article-list .article  .article-content .readmore {
	-moz-transition: color 0.2s linear;
	-o-transition: color 0.2s linear;
	-webkit-transition: color 0.2s linear;
	transition: color 0.2s linear;
	color: #5679a3;
	text-decoration: underline;
}

#bloggerInfo {
	position: relative;
	left: 70%;
	width: 28%;
	height: 300px;
	top: 20px;
	float: right;
	background-color: #fff;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.2);
	position: absolute;
	padding-bottom: 80px;
	margin-bottom: 10px;
	border-bottom: 1px solid #e8e8e8;
}

#profilepic:hover {
	background: #fff;
	border: 5px solid #88acdb;
	-webkit-box-shadow: 0 0 1.5em #88acdb;
	box-shadow: 0 0 1.5em #88acdb;
	-webkit-animation: profilepic 0.15s linear infinite alternate;
	-moz-animation: profilepic 0.15s linear infinite alternate;
	-ms-animation: profilepic 0.15s linear infinite alternate;
	animation: profilepic 0.15s linear infinite alternate;
	-webkit-animation: profilepic 0.15s linear infinite alternate;
}

#profilepic {
	box-shadow: 0 0 1.5em #88acdb;
	z-index: 100;
	display: block;
	width: 150px;
	height: 150px;
	position: absolute;
	top: 20px;
	left: 28%;
	-webkit-box-orient: horizontal;
	-webkit-box-pack: center;
	-webkit-box-align: center;
	text-align: center;
	border-width: 5px;
	border-style: solid;
	border-color: #88acdb;
	border-image: initial;
	border-radius: 50%;
	overflow: hidden;
	background: rgb(136, 172, 219);
}

#profilepic .imgHead {
	width: 100%;
	height: 100%;
	border-radius: 50%;
	-webkit-animation-duration: 0.4s;
	-moz-animation-duration: 0.4s;
	-ms-animation-duration: 0.4s;
	animation-duration: 0.4s;
	-webkit-animation-delay: 0.3s;
	-moz-animation-delay: 0.3s;
	-ms-animation-delay: 0.3s;
	animation-delay: 0.3s;
	-webkit-animation-duration: 0.4s;
	-webkit-animation-delay: 0.3s;
}
@-moz-keyframes profilepic {
  0% {
    right: 4px;
    top: 1x;
  }
  100% {
    right: 0px;
    top: -1px;
  }
}
@-webkit-keyframes profilepic {
  0% {
    right: 4px;
    top: 1x;
  }
  100% {
    right: 0px;
    top: -1px;
  }
}
@-o-keyframes profilepic {
  0% {
    right: 4px;
    top: 1x;
  }
  100% {
    right: 0px;
    top: -1px;
  }
}
@keyframes profilepic {
  0% {
    right: 4px;
    top: 1x;
  }
  100% {
    right: 0px;
    top: -1px;
  }
}
#aboutMe {
	position: absolute;
	top: 200px;
	width: 100%;
	text-align: center;
}

#aboutMe #nickName {
	text-align: center;
}

#aboutMe #sign {
	text-align: center;
	padding: 10px;
}
#dateArchiving_ul li{
	padding-bottom: 10px;
	padding-left: 20px;
	font-size: 15px;
}
#typeArchiving_ul li{
	padding-bottom: 10px;
	padding-left: 20px;
	font-size: 15px;
}
#datelist_title{
	padding:10px;
	padding-left:25px;
	font-size: 15px;
}
#rightList{
	position: relative;
	left: 70%;
	width: 20%;
	top: 350px;
	float: right;
	background-color: #fff;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.2);
	position: absolute;
	margin-bottom: 10px;
	border-bottom: 1px solid #e8e8e8;
}
#typeList_title{
	padding:10px;
	padding-left:25px;
	font-size: 15px;
}
</style>
<script type="text/javascript">

	$(function() {
		$('#nav').on({
			mouseenter : function(argument) {
				$('#nav ul li .li-a').css("color", "#20303c");

			},
			mouseleave : function(argument) {
				$('#nav ul li .li-a').css("color", "white");
			}
		});

	});

</script>
<script type="text/javascript">
	//分页数据
$(document).ready(function() {
	var firstTotal;
	//初始化第一页数据
			$.ajax({
	    	url: "${pageContext.request.contextPath }/index/IndexBlogsAction!getBlogsData.action",
	    	method: "post",
	    	async: false,
	    	data:{
				'page' : 1,
				'rows' : 5,
				'sort' : 'releaseDate',
			    'order': 'desc'
	    	},
	    	dataType: "json",
	    	success: function (data) {
	    		var $ul = $('<ul id="article-list" />');
				$.each(data.rows, function(i, obj) {
					// template 将数据填充到模板中 返回填充好的html
					var $li;
					$li = $(template("articleTemp", obj));
					$li.appendTo($ul);
				});
				$ul.appendTo('#content');
				firstTotal = data.total;
	    	}
	    });
		// init bootpag
	$('#pagination').bootpag({
	    total: parseInt((firstTotal + 5 -1) / 5),    // total pages
	    page: 1,            // default page
	    maxVisible: 5,     // visible pagination
        leaps: true         // next/prev leaps through maxVisible
	}).on("page", function(event, num){	
		$('#content').html('');
	    var total;
		$.ajax({
			async: false,
	    	url: "${pageContext.request.contextPath }/index/IndexBlogsAction!getBlogsData.action",
	    	method: "post",
	    	data:{
				'page' : num,
				'rows' : 5,
				'sort' : 'releaseDate',
			    'order': 'desc'
	    	},
	    	dataType: "json",
	    	error:function (XMLHttpRequest, textStatus, errorThrown) {
	    		  // 通常情况下textStatus和errorThown只有其中一个有值 
	    		  console.info('错误');
	    	},
	    	success: function (data) {
	    		var $ul = $('<ul id="article-list" />');
				$.each(data.rows, function(i, obj) {
					// template 将数据填充到模板中 返回填充好的html
					var $li;
					$li = $(template("articleTemp", obj));
					$li.appendTo($ul);
				});
				$ul.appendTo('#content');
				total = data.total;
			    $('#pagination').bootpag({total:parseInt((total + 5 -1) / 5)});
				$('html,body').animate({scrollTop: $('#head-title').offset().top}, 0);
	    	}
	    });
	});
});
</script>
</head>
<body>
	<div id="container">
		<div id="head">
			<img id="head_bgimg" src="${pageContext.request.contextPath }/indexjsp/images/sailboat-lake.jpg">
			<div id="nav">
				<ul id="nav-ul">
					<li class="nav-li"><a class="li-a" href="${pageContext.request.contextPath }/indexjsp/index.jsp">首页</a></li>
					<li class="nav-li"><a class="li-a" href="${pageContext.request.contextPath }/indexjsp/blogsList.jsp">博客</a></li>
					<li class="nav-li"><a class="li-a" href="#">联系作者</a></li>
				</ul>
			</div>
			<div id="head-title">
				<span>WELCOME TO<br></span>
				<span>MYBLOG</span>
			</div>
		</div>
		<a href="#1F" name="1F"></a> 
	<script id="articleTemp" type="text/html">
   		<li class="article">
			<div class="article-head">
				<h1><a class="article-link" href="${pageContext.request.contextPath }/index/indexArticleContentAction!getData.action?id={{id}}">{{title}}</a></h1>
				<span class="article-meta"> <time class="post-date" datetime="">{{releaseDate}}</time> 
				<span class="article-author">{{nickName}}</span> </span>
			</div>
			<div class="article-content">
				{{summary}}.....
				<a href="${pageContext.request.contextPath }/index/indexArticleContentAction!getData.action?id={{id}}" class="readmore">Read more »</a>
			</div>
   		</li>
   	</script>
		<div id="main">
			<div id="content"></div>
			<div id="bloggerInfo">
				<a id="profilepic"> <img src="" class="imgHead">
				</a>

				<div id="aboutMe">
					<div id="nickName">
						<span></span>
					</div>
					<div id="sign">
						<span></span>
					</div>
				</div>
			</div>
			<div id="rightList">
				<div id="typeList">
					<div id="typeList_title">
						<p>按类型归档</p>
					</div>
					<div id="type_Archiving"></div>
				</div>
				<div id="datelist">
					<div id="datelist_title">
						<p>按日期归档</p>
					</div>
					<div id="date_Archiving"></div>
				</div>

			</div>
			<script id="typeArchivingTemp" type="text/html">
   		<li class="typeArchiving">
			<a href="${pageContext.request.contextPath }/index/IndexBlogsAction!forwtypeArchivingJsp.action?typeId={{typeId}}">{{typeName}}(<span>{{cnt}}</span>)</a>
   		</li>
   	</script>
	<script id="dateArchivingTemp" type="text/html">
   		<li class="dateArchiving">
			<a href="${pageContext.request.contextPath }/index/IndexBlogsAction!forwdateArchivingJsp.action?releaseDate={{pubtime}}">{{pubtime}}(<span>{{cnt}}</span>)</a>
   		</li>
   	</script>
		</div>
	</div>
	<p id="pagination" style="margin-left:20px"></p>
</body>
<script type="text/javascript">
$.ajax({
	url: "${pageContext.request.contextPath }/index/IndexBlogsAction!dateArchiving.action",
	method: "post",
	async: false,
	data:{
	},
	dataType: "json",
	success: function (data) {
		var $ul = $('<ul id="dateArchiving_ul" />');
		$.each(data, function(i, obj) {
			// template 将数据填充到模板中 返回填充好的html
			var $li;
			$li = $(template("dateArchivingTemp", obj));
			$li.appendTo($ul);
		});
		$ul.appendTo('#date_Archiving');
	}
});
</script>
<script type="text/javascript">
$.ajax({
	url: "${pageContext.request.contextPath }/index/IndexBlogTypeAction!typeArchiving.action",
	method: "post",
	async: true,
	data:{
	},
	dataType: "json",
	success: function (data) {
		var $ul = $('<ul id="typeArchiving_ul" />');
		$.each(data, function(i, obj) {
			// template 将数据填充到模板中 返回填充好的html
			var $li;
			$li = $(template("typeArchivingTemp", obj));
			$li.appendTo($ul);
		});
		$ul.appendTo('#type_Archiving');
	}
});
</script>
<script type="text/javascript">
$(document).ready(function() {
$.ajax({
	url: "${pageContext.request.contextPath }/index/IndexBloggerAction!getMeInfo.action",
	method: "post",
	async: true,
	data:{
	},
	dataType: "json",
	success: function (data) {
		$('div#nickName span').html(data.nickName);
		$('div#sign span').html(data.sign);
		$('.imgHead').attr('src','${pageContext.request.contextPath}/upload/bloggerImage/'+data.imageUrl); 
	}
});
});
</script>
</html>