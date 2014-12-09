<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobKey" %>
<% BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService(); %>

<%@ page import="com.google.appengine.api.blobstore.BlobInfo" %>
<%@ page import="com.google.appengine.api.blobstore.BlobInfoFactory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Upload an image</title>
		
	</head>
	<body>
		<form action="<%= blobstoreService.createUploadUrl("/upload") %>"
			method="post" enctype="multipart/form-data">
			<input type="text" name="foo"><br>
			<input type="file" name="myFile"><br>
			<input type="submit" value="Submit">
		</form>
		
		
</body>
</html>