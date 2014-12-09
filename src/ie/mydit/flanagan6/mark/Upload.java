package ie.mydit.flanagan6.mark;

import java.io.IOException;
import java.util.List;
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
		
		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
		List<BlobKey> blobKey = blobs.get("myFile");
		System.out.println("1");
		int i = blobs.size() - 1;
		
		
		if (blobKey == null) {
			System.out.println("null");
			res.sendRedirect("/"); // if null return to page
			
		} else {
			System.out.println("not null");
			PersistenceManager pm = PMFactory.get().getPersistenceManager();//get Persitance manager instance
			ImageBlob m = new ImageBlob(blobKey.get(i).getKeyString()); //create image  object
			//BlobInfo binfo = new BlobInfo(blobKey.get(i)));
			
			try {
				pm.makePersistent(m);//Add Image to the datastore
				System.out.println("Made persistent");
			} finally {
				System.out.println("closing");
				//pm.close();
				
			}
			//System.out.println("Uploaded a file with blobKey:" + blobKey.getKeyString());
			System.out.println("Redirecting");
			res.sendRedirect("index.jsp"); //Return to homepage
		}//end if else
	}//end doPost()
}//end class