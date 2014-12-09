
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
		
		
		<%
			Iterator<BlobInfo> blobIterator = new BlobInfoFactory().queryBlobInfos();

			while( blobIterator.hasNext()) { 
				BlobKey bk = blobIterator.next().getBlobKey();
				ServingUrlOptions options = ServingUrlOptions.Builder.withBlobKey(bk);
		%>		
				<img src="<%= imageService.getServingUrl(options)%>">
		<% }%>
	
	</body>
</html>