@isTest
global class TestHttpCalloutMock implements HttpCalloutMock  {
    
    public HttpResponse respond( HttpRequest req ) {

        String endpoint = req.getEndpoint();

        if ( endpoint.contains('/oauth/access_token') ) {
            return buildOAuthResponse( req );
        } else if ( endpoint.contains('/v3/shorten') ) {
            return buildShortenResponse( req );
        }

        return null;
    }

    private HttpResponse buildOAuthResponse( HttpRequest req ) {

        HttpResponse res = new HttpResponse();

        res.setBody('123');
        res.setStatusCode(200);

        return res;
    }

    private HttpResponse buildShortenResponse( HttpRequest req ) {

        HttpResponse res = new HttpResponse();

        res.setBody('https://www.salesforce.com');
        res.setStatusCode(200);

        return res;
    }
     
    

}