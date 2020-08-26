@isTest
public class TestBitlyService {
    
    @IsTest
    public static void TestBitlyService() {
        
        BitlyShortenURLBatch bs=new BitlyShortenURLBatch();
        List<Account> lstacct = TestDataFactory.createAccounts(100);
        insert lstacct;
        List<Account> accts = [select Name, Phone, URL__c, Shortened_URL__c from Account where id IN:lstacct];
        for(Account acct: accts){
            System.assert(acct.Id!=null);
            System.assert(acct.URL__c!=null);

        }
        system.assert(lstacct.size()>0);
        
        Test.startTest();
        database.executeBatch(bs);
        Test.stopTest();
        
        Account[] accUpdatedList = [SELECT Id,Name, URL__c, Shortened_URL__c FROM Account];
		System.assert(accUpdatedList[0].Shortened_URL__c!=null);
        
    }

}