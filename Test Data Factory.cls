public abstract class TestDataFactory {
 
    //Account creation
    
    public static List<Account> createAccounts(Integer numAccts) {
        
        List<Account> accounts = new List<Account>();
        
            
            for(Integer i = 0; i < numAccts; i++) 
    {
        Account a = new Account(Name = 'TestAccount' + i,
                                Phone = '(415) 419-8873' +i);
        accounts.add(a);
    }
            
        
        
        return accounts;
        
    }
    
    public static List<Contact> createContacts(Integer numCont, List<Account> acct) {
        
        List<Contact> contacts = new List<Contact>();
        
         
        for(integer i=0; i<numCont; i++){
            Contact con = new Contact( firstname = 'Test Contact' +i,
                                       lastname= 'Test Contact' +i,
                                       AccountId = acct[i].Id,
                                       Phone= '(415) 419-8873' +i);                                       
            
            contacts.add(con);
            
        }
        
        return contacts;
        
    }
    
}
