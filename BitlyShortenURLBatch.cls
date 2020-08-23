global class BitlyShortenURLBatch implements Database.Batchable<sObject>, Database.AllowsCallouts {
    
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        
        return Database.getQueryLocator([SELECT id, Shortened_URL__c, URL__c FROM Account where id=:'0012w00000J6pi6']);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> accList) {
     
        BitlyService service=new BitlyService();
        for ( Account acc : accList) {	  
                
            system.debug('in for');
            system.debug(acc.URL__c);
			
            acc.Shortened_URL__c = service.shorten(acc.URL__c);	
            system.debug('Short URL'+acc.Shortened_URL__c);
        }	   

        if ( accList.size() > 0 ) {	
            update accList;	      
        }	
        
        system.debug('accList'+accList);
        
    }
    
    global void finish(Database.BatchableContext BC) {
    }
    
}