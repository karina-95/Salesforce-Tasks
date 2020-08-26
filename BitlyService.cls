public class BitlyService {
    
    private String accessToken;	
    public BitlyService() {	     
       this.accessToken = getAccessToken();
    }	    	  
    public String shorten( String url ) {	
        HttpRequest req = new HttpRequest();	 
        req.setEndpoint('callout:Bitly/v4/shorten' );
        req.setMethod('GET');	
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept','application/json');
        system.debug(req.getEndpoint());
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
        Map<String, Object> b = (Map<String,Object>) JSON.deserializeUntyped(res.getBody());
        system.debug(b.get('link'));
        
        return String.valueOf(b.get('link'));	
       
    }	    	
   
    
    private String getAccessToken() {
       	HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Bitly/oauth/access_token');	
        req.setMethod('POST');	
        req.setHeader('Content-Type', 'x-www-form-urlencoded');
        req.setHeader('Accept','x-www-form-urlencoded');
        req.setHeader('Content-length', '0');
        Http http = new Http();	 
        HttpResponse res = http.send(req);
        return res.getBody();
       
       	
    }
    
    
}