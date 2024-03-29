
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobKey" %>
<% BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService(); %>

<%@ page import="com.google.appengine.api.blobstore.BlobInfo" %>
<%@ page import="com.google.appengine.api.blobstore.BlobInfoFactory" %>

<%@ page import="java.util.*" %>  
<%@ page import="javax.jdo.Query" %>  
<%@ page import="javax.jdo.PersistenceManager" %>  
<%@ page import="com.google.appengine.api.users.User" %>  
<%@ page import="com.google.appengine.api.datastore.Key" %>  
<%@ page import="com.google.appengine.api.users.UserService" %>  
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.google.appengine.api.images.ImagesService" %>
<%@ page import="com.google.appengine.api.images.ImagesServiceFactory" %>
<%@ page import="com.google.appengine.api.images.ServingUrlOptions" %>
<% ImagesService imageService = ImagesServiceFactory.getImagesService(); %>

<%@ page import="java.net.*" %>
<%@ page import="ie.mydit.flanagan6.mark.*" %>  

<html>
	<head>
		<title>Upload an image</title>
		
	</head>
	<body>
		<h1>Welcome to FloopBox</h1>
	
		<ul>
			<li><a href="upload.jsp">Upload to FloopBox</a></li>
			<li><a href="viewImages.jsp">View Uploaded images</a></li>
			<li><a href="login">Login</a></li>
		</ul>
	</body>
</html>