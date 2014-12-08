
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobKey" %>
<% BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService(); %>

<%@ page import="java.util.*" %>  
<%@ page import="javax.jdo.Query" %>  
<%@ page import="javax.jdo.PersistenceManager" %>  
<%@ page import="com.google.appengine.api.users.User" %>  
<%@ page import="com.google.appengine.api.datastore.Key" %>  
<%@ page import="com.google.appengine.api.users.UserService" %>  
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.images.*" %>
<% ImagesService imageService = ImagesServiceFactory.getImagesService(); %>

<%@ page import="java.net.*" %>
<%@ page import="ie.mydit.flanagan6.mark.*" %>  

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
		
		
		
		
		<% 	PersistenceManager pm = PMFactory.get().getPersistenceManager();
			Query q = pm.newQuery("select from " + Image.class.getName());
			List<ImageBlob> imgs = (List<ImageBlob>) q.execute();
		
			for(ImageBlob i : imgs) { 
				BlobKey bk = new BlobKey(i.getImgKey()); %>
				<img src="<% imageService.getServingUrl(bk); %>">
			
			<% }%>
		
	</body>
</html>