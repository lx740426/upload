<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-1.4.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/plupload.full.min.js"></script>

</head>

<body>

<ul id="filelist"></ul>
<br />

<div id="container">
    <a id="browse" href="javascript:;">浏览...</a> <br />
    <a id="start-upload" href="javascript:;">开始上传</a>
</div>

	


	<script type="text/javascript">
	   var uploader = new plupload.Uploader({
		  browse_button: 'browse', // this can be an id of a DOM element or the DOM element itself
		  url: '${pageContext.request.contextPath}/upload',
		  chunk_size : '10mb',
		  multi_selection:false,
		  filters: {
			    mime_types : [{ title : "Zip files", extensions : "zip,rar,7z" }],
		        prevent_duplicates : true //不允许选取重复文件
		  },
		    
		 init:{
			 PostInit: function() {
					document.getElementById('filelist').innerHTML = '';

					document.getElementById('start-upload').onclick = function() {
						uploader.start();
						return false;
					};
				},

				FilesAdded: function(up, files) {
					plupload.each(files, function(file) {
						document.getElementById('filelist').innerHTML += '<div id="' + file.id + '">' + file.name + ' (' + plupload.formatSize(file.size) + ') <b></b></div>';
					});
				},

				UploadProgress: function(up, file) {
					document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>' + file.percent + "%</span>";
				},

				Error: function(up, err) {
					document.getElementById('console').appendChild(document.createTextNode("\nError #" + err.code + ": " + err.message));
				}
			 
		 }
		  
		});
	   
	  
	   uploader.init();
	</script>
</body>
</html>
