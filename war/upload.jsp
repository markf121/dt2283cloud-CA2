<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobKey" %>
<% BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService(); %>
<%@ page import=" java.security.Principal" %>
<%@ page import="com.google.appengine.api.blobstore.BlobInfo" %>
<%@ page import="com.google.appengine.api.blobstore.BlobInfoFactory" %>

<% if(request.getUserPrincipal() == null){//Check if user is logged in 
		response.sendRedirect("/login");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Upload an image</title>
		
	</head>
	<body>
	
	
		<form action="<%= blobstoreService.createUploadUrl("/upload") %>"
			method="post" enctype="multipart/form-data">
			<input type="text" name="foo"><br>
			<input type="file" name="myFile" required><br>
			<input type="checkbox" name="private" value="private">
			<input type="submit" value="Submit">
		</form>
		
		
</body>
</html>