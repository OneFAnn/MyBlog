<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>博客内容</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/template.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.bootpag.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<style type="text/css">
body{
	padding: 0;
	margin: 0;
	background-color: #f1f1f1;
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
}
#head img{
 position: absolute;
 top:83px;
 	width: 100%;
	height: 100%;
}
#head #nav #nav-ul li a {
	color:black;
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
#content{
	width:800px;
	margin:160px auto;
}
#content  #title{
	width:100%;
	text-align: center;
	color:balck;
	font-size: 25px;
	margin-bottom: 20px;
}
#content #author{
	text-align: center;
}
#content #date{
    width:100%;
	text-align: right;
	color:#999;
}
#warpper .comments .comment-items{
	width:80%;
	margin-right: auto;
	margin-left: auto;
	padding-right: 30px;
	padding-left: 30px;
	padding: 30px;
	background-color: #fff;
	box-shadow: 0 1px 2px rgba(0,0,0,.1);
	padding-bottom: 30px;
	margin-bottom: 5px;
	border-bottom: 1px solid #e8e8e8;
}
</style>
</head>
<body>
	<div id="warpper">
		<div id="head">
			<div id="nav">
				<ul id="nav-ul">
					<li class="nav-li"><a class="li-a" target="_blank" href="${pageContext.request.contextPath }/indexjsp/index.jsp">首页</a></li>
					<li class="nav-li"><a class="li-a" href="${pageContext.request.contextPath }/indexjsp/blogsList.jsp">博客</a></li>
					<li class="nav-li"><a class="li-a" href="#">相册</a></li>
					<li class="nav-li"><a class="li-a" href="#">联系作者</a></li>
				</ul>
			</div>
			<img id="head_bgimg" src="${pageContext.request.contextPath }/indexjsp/images/man-bike-trail-clouds-sky.jpg">
		</div>
		<div id="content">
			<div id="title">${title }</div>
			<div id="author">${author }</div>
			<div id="date">${releaseDate }</div>
			${content }
	   </div>
	<div class="comments">
        <div class="title" style="text-align:center">
            <span style="font-size:20px">评论</span>
        </div>
        <div class="comment-items">
            
          <script id="commentTemp" type="text/html">
            <div class="comment-item">
                <div class="comment-item-info">
                    <span class="comment-date">{{commentDate}}</span>
                    <span style="color:#128ee9" class="comment-author">{{userIp}}:</span>
                </div>
                <div class="comment-item-content">
                    <span style="font-size:20px; color:#8E354A"><p>{{content}}<br></p></span>
                </div>
            </div>
           </script>
        </div>

        <div id="comment-write">
             <form id="commentSubmit" class="form-horizontal">
                  <div class="form-group">
                    <label class="col-sm-2 control-label">昵称</label>
                    <div class="col-sm-4">
                      <input type="text"  name="userIp" class="form-control" id="inputEmail3" placeholder="你的昵称">
                    </div>
                  </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-4">
                          <input type="text" name="email" class="form-control" id="inputPassword3" placeholder="你的邮箱（不会被公开）">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">你的评论</label>
                        <div class="col-sm-4">
                            <textarea name="content" class="form-control"  rows="4" placeholder="写下你的评论..."></textarea>
                        </div>
                    </div>
                    <button style="margin-left:40%" type="submit"  class="btn btn-info">提交评论</button>
            </form>
        </div>
    </div>
	</div>
	
</body>
<script type="text/javascript">
$( document ).ready(function() {
	getComment();
	});	
function getComment(){
	$.ajax({
		url: "${pageContext.request.contextPath }/index/IndexBlogsCommentsAction!getComment.action",
		method: "post",
		async: false,
		data:{
			'blogId':'${id}'
		},
		dataType: "json",
		success: function (data) {
			var $ul = $('<ul id="comment_ul" />');
			$.each(data.rows, function(i, obj) {
				// template 将数据填充到模板中 返回填充好的html
				var $li;
				$li = $(template("commentTemp", obj));
				$li.appendTo($ul);
			});
			$ul.appendTo('.comment-items');
		}
	})
}
//提交评论表单
$('#commentSubmit').submit(function(){
        jQuery.ajax({
        	contentType: "application/x-www-form-urlencoded;charset=utf-8",
            url: "${pageContext.request.contextPath }/index/IndexBlogsCommentsAction!save.action?blogId=${id}",   // 提交的页面
            data: $('#commentSubmit').serialize(), // 从表单中获取数据
            method:"post",
            dataType: "json",                   
            success: function(data) {
                alert(data.msg);
                $(".comment-items").html("");
                getComment();
            }
        });
        return false;
    });


</script>
</html>