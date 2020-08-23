public class BitlyService {
    
    private String accessToken;	    	 
    	  
    public String shorten( String url ) {	
         HttpRequest req = new HttpRequest();	 
        req.setEndpoint('https://api-ssl.bitly.com/v4/shorten');

        req.setMethod('POST');	
		req.setHeader('Authorization','Bearer e8a7e213ed1dd3c46cd181583a335dc5bf16d33e');
        req.setHeader('Content-Type', 'application/json');
    	req.setHeader('Accept','*/*');
       
		string websiteToshorten=url;
req.setBody(
    '{' +
    '"long_url": "'+websiteToshorten+'",' +
    '"domain": "bit.ly",' +
    '"group_guid": ""' +
    '}'
);
		Http http = new Http();	  
        HttpResponse res = http.send(req);
        System.debug(res.getBody()); 	
		Map<String, Object> b = (Map<String,Object>) JSON.deserializeUntyped(res.getBody());
        system.debug(b.get('link'));
        
        return String.valueOf(b.get('link'));	
    }	    	
}  