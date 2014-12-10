package ie.mydit.flanagan6.mark;

import java.util.Date;

import com.google.appengine.api.datastore.Key;  

import javax.jdo.annotations.IdGeneratorStrategy;  
import javax.jdo.annotations.PersistenceCapable;  
import javax.jdo.annotations.Persistent;  
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class ImageBlob {
	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Key key;
	@Persistent
	private String imgKey;
	
	private Date uploadDate;
	
	public String getImgKey() {
		return imgKey;
	}

	public ImageBlob(String imgKey, Date uploadDate){
		this.imgKey = imgKey;
		this.uploadDate = uploadDate;
	}
	
	
}
