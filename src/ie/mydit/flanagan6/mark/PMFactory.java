package ie.mydit.flanagan6.mark;

import javax.jdo.JDOHelper;
import javax.jdo.PersistenceManagerFactory;

public final class PMFactory {
	
	private static final PersistenceManagerFactory pmf = 
			JDOHelper.getPersistenceManagerFactory("transactions-optional");
	private PMFactory() {
		
	}
	
	public static PersistenceManagerFactory get(){
		return pmf;
	}

}
