<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/template.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.bootpag.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<title>${releaseDate}</title>
<style type="text/css">
	body{
		padding:0;
		margin:0;
		background-color: #ebebeb;
	}
	#title{
		text-align: center;
	}
	h2{
		width:100%;
	}
	ul,li{
		padding:0;
		margin:0;
		list-style: none;
	}
	#container{
		width:800px;
		margin:20px auto;
	}
	#article-list .article {
	width: 100%;
	padding-right: 30px;
	padding-left: 30px;
	padding: 30px;
	background-color: #fff;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.2);
	padding-bottom: 30px;
	margin-bottom: 10px;
	border-bottom: 1px solid #e8e8e8;
}
</style>
</head>

<body>
<div id="container">
	<div id="content">
		<div id="title"><h2>${releaseDate}</h2></div>	
		<div id="articleList"></div>
	</div>
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
</div>
<p id="pagination" style="margin-left:20px"></p>
</body>
<script type="text/javascript">
	//分页数据
$(document).ready(function() {
	var firstTotal;
	//初始化第一页数据
			$.ajax({
	    	url: "${pageContext.request.contextPath }/index/IndexBlogsAction!dateArchivingContent.action",
	    	method: "post",
	    	async: false,
	    	data:{
				'page' : 1,
				'rows' : 10,
				'sort' : 'releaseDate',
			    'order': 'desc',
			    'releaseDate':'${releaseDate}'
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
				$ul.appendTo('#articleList');
				firstTotal = data.total;
	    	}
	    });
		// init bootpag
	$('#pagination').bootpag({
	    total: parseInt((firstTotal + 10 -1) / 10),    // total pages
	    page: 1,            // default page
	    maxVisible: 5,     // visible pagination
        leaps: true         // next/prev leaps through maxVisible
	}).on("page", function(event, num){	
		$('#articleList').html('');
	    var total;
		$.ajax({
			async: false,
	    	url: "${pageContext.request.contextPath }/index/IndexBlogsAction!dateArchivingContent.action",
	    	method: "post",
	    	data:{
				'page' : num,
				'rows' : 10,
				'sort' : 'releaseDate',
			    'order': 'desc',
			    'releaseDate':'${releaseDate}'
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
				$ul.appendTo('#articleList');
				total = data.total;
			    $('#pagination').bootpag({total:parseInt((total + 10 -1) / 10)});
				$('html,body').animate({scrollTop: $('body').offset().top}, 0);
	    	}
	    });
	});
});
</script>

</html>