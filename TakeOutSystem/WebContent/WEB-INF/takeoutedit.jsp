<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.djtu.pojo.Takeout"%>
<%@page import="cn.edu.djtu.pojo.UserInfo"%>
<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">

<title>Dashboard Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css" />
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">
<link href="assets/css/dataTables.bootstrap.css" rel="stylesheet" />
<!-- Custom styles for this template -->
<link href="dist/css/dashboard.css" rel="stylesheet">
<link href="starter-template.css" rel="stylesheet">
<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="assets/js/ie-emulation-modes-warning.js"></script>
<link rel="stylesheet" href="assets/css/bootstrap-fileupload.min.css">
<link href="assets/fancybox/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet">
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<%
	if (session.getAttribute("userid") == null) {
		response.sendRedirect("index.action");
	} else if (session.getAttribute("iscmd").equals(0)) {
		response.sendRedirect("index.action");
	} else if (session.getAttribute("takeouts") == null) {
		response.sendRedirect("takeout.action?mark=back");
	}
%>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a class="navbar-brand"
					href="takeout.action?mark=back">迅捷外卖订餐系统后台</a></li>
				<li><a href="index.action">首页</a></li>
				<li><a href="takeout.action">外卖</a></li>
			</ul>
			<ul class="nav navbar-nav" style="float: right">
				<li><a href="logout.action">退出</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li class="active"><a href="takeout.action?mark=back">菜品浏览<span
							class="sr-only">(current)</span></a></li>
					<li><a href=userlist.action>用户浏览</a></li>
					<li><a href="orders.action?mark=back">订单管理</a></li><li><a href="messagedisplay.action">消息编辑</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<div class="table-responsive">
					<div class="container">
						<div class="panel-body">
							<div class="row">
								<div>
									<div class="col-lg-7">
										<form role="form" enctype="multipart/form-data" action="addtakeout.action" method="post">
											<div class="form-group">
												<label>菜品名称</label> <input class="form-control" name="name">
											</div>
											<div class="form-group">
												<label>单价</label> <input class="form-control" name="prise">
											</div>
											<div class="form-group" >
												<label>描述</label>
												<textarea class="form-control" rows="3" name="discription"></textarea>
											</div>
											选择图像:
											<div class="fileupload fileupload-new"
												data-provides="fileupload">
												 <input type="hidden" >
												<div class="input-group">
													<span class="btn btn-file btn-info"> <span
														class="fileupload-new">选择文件</span> <span
														class="fileupload-exists">更换文件</span> <input type="file"
														name="myFile">
													</span> <a href="#" class="btn btn-danger fileupload-exists"
														data-dismiss="fileupload">移除文件</a> <br> <br>
													<div class="col-lg-3">
														<i class="icon-file fileupload-exists"></i> <span
															class="fileupload-preview"></span>
													</div>
												</div>
											</div>
											<p>${addmsg}</p>											<button type="submit" class="btn btn-default">提交</button>
											<button type="reset" class="btn btn-default">还原</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Bootstrap core JavaScript
    ================================================== -->
			<!-- Placed at the end of the document so the pages load faster -->
			
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
	<!-- GLOBAL SCRIPTS -->
	<script src="dist/js/jquery-3.1.1.min.js"></script>
	<script src="assets/js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="dist/js/jquery-3.1.1.min.js"></script>
	<script src="dist/js/bootstrap.min.js"></script>
	<script src="assets/js/docs.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="assets/js/ie10-viewport-bug-workaround.js"></script>
	<script src="assets/js/bootstrap-fileupload.js"></script>
		<script src="assets/js/image_gallery.js"></script>
		    <script src="assets/fancybox/jquery-1.4.3.min.js"></script> <!--important for gallery-->
     <script src="assets/fancybox/fancybox/jquery.mousewheel-3.0.4.pack.js"></script> 
    <script src="assets/fancybox/fancybox/jquery.fancybox-1.3.4.js"></script>
     <script src="assets/js/image_gallery.js"></script>
</body>
</html>
