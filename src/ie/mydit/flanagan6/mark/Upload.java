package ie.mydit.flanagan6.mark;

import java.io.IOException;
import java.util.Map;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;


public class Upload extends HttpServlet {

	
	private static final long serialVersionUID = 1L;
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException {
		@SuppressWarnings("deprecation")
		Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(req);
		BlobKey blobKey = blobs.get("myFile");
		if (blobKey == null) {
			res.sendRedirect("/"); // if null return to page
		} else {
			PersistenceManager pm = PMFactory.get().getPersistenceManager();//get Persitance manager instance
			ImageBlob m = new ImageBlob(blobKey.getKeyString()); //create image  object
			try {
				pm.makePersistent(m);//Add Image to the datastore
			} finally {
				pm.close();
			}
			//System.out.println("Uploaded a file with blobKey:" + blobKey.getKeyString());
			res.sendRedirect("index.jsp"); //Return to homepage
		}//end if else
	}//end doPost()
}//end class