<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客列表</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/template.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.bootpag.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<style type="text/css">
body {
	padding: 0;
	margin: 0;
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

#head #nav {
	width: 100%;
	height: 80px;
	position: absolute;
	top: 0;
	background-color: white;
}

#head img {
	position: absolute;
	top: 81px;
	width: 100%;
	height: 100%;
}

#head #nav #nav-ul li a {
	color: black;
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
	border-top-color: #4fa5ee;
}

#head #nav #nav-ul li {
	position: relative;
}

#content {
	width: 100%;
	margin: 100px auto;
	background-color: #ebebeb;
}

#content  #title {
	width: 100%;
	text-align: center;
	color: balck;
	font-size: 25px;
	margin-bottom: 20px;
}

#content #author {
	text-align: center;
}

#content #date {
	width: 100%;
	text-align: right;
	color: #999;
}

#article-list .article {
	width:80%;
	margin-right: auto;
	margin-left: auto;
	padding-right: 30px;
	padding-left: 30px;
	padding: 30px;
	background-color: #fff;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.2);
	padding-bottom: 30px;
	margin-bottom: 5px;
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
#article-list .article .article-head h1 .article-link:hover {
	color: inherit;
	text-decoration: underline;
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
</style>
</head>
<body>
	<div id="warpper">
		<div id="head">
			<div id="nav">
				<ul id="nav-ul">
					<li class="nav-li"><a class="li-a" target="_blank"
						href="${pageContext.request.contextPath }/indexjsp/index.jsp">首页</a></li>
					<li class="nav-li"><a class="li-a" href="#">博客</a></li>
				</ul>
			</div>
			<img id="head_bgimg"
				src="${pageContext.request.contextPath }/indexjsp/images/man-bike-trail-clouds-sky.jpg">
		</div>
		<script id="articleTemp" type="text/html">

   		  <div class="article">
			<div class="article-head">
				<h1><a class="article-link" href="${pageContext.request.contextPath }/index/indexArticleContentAction!getData.action?id={{id}}">{{title}}</a></h1>
				<span class="article-meta"> <time class="post-date" datetime="">{{releaseDate}}</time> 
				<span class="article-author">{{nickName}}</span> </span>
			</div>
		</div>

   	</script>
		<div id="content"></div>
<p id="pagination" style="margin-left:20px"></p>
	</div>

</body>
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
				'rows' : 15,
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
	    total: parseInt((firstTotal + 15 -1) / 15),    // total pages
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
				'rows' : 15,
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
			    $('#pagination').bootpag({total:parseInt((total + 15 -1) / 15)});
				$('html,body').animate({scrollTop: $('#content').offset().top}, 0);
	    	}
	    });
	});
});
</script>
</html>