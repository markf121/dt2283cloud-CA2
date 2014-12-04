package ie.mydit.flanagan6.mark;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

public class Upload extends HttpServlet {
/**
*
*/
	private static final long serialVersionUID = 1L;
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException {
		@SuppressWarnings("deprecation")
		Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(req);//getUploadedBlobs
		BlobKey blobKey = blobs.get("myFile");
		if (blobKey == null) {
			res.sendRedirect("/");
		} else {
			System.out.println("Uploaded a file with blobKey:" + blobKey.getKeyString());
			res.sendRedirect("/serve?blob-key=" + blobKey.getKeyString());
			try {
				Thread.sleep(5000);//adds a delay to distinguish the stages of uploading and downloading
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//end if else
	}//end doPost()
}//end class