@isTest
public class TestAccountList {
    
    @IsTest
    public static void testAccountList() {
        PaginationNumberController c = new PaginationNumberController(); 
        List<Account> lstacct = TestDataFactory.createAccounts(100);
        insert lstacct;
        List<Account> accts = [select Name, Phone from Account where id IN:lstacct];
        for(Account acct: accts){
            System.assert(acct.Id!=null);
        }
        system.assert(lstacct.size()>0);
        
        List<Contact> lstcon = TestDataFactory.createContacts(100,lstacct);
        
        insert lstcon;
        List<Contact> conts = [select Name, Email from Contact where id IN:lstcon];
        for(Contact con: conts){
            System.assert(con.Id!=null);
        }
        system.assert(lstcon.size()>0);
        String conId=ApexPages.currentPage().getParameters().get('id');

        c.getAccount();   
        system.assert(c.getAccount()!=null);
        c.getDisableNext();
        System.assertEquals(true,c.getDisableNext());
        c.getDisablePrevious();
        System.assertEquals(true,c.getDisablePrevious());
        c.Next();
        system.assertEquals(20,c.counter);
        c.Previous(); 
        system.assertEquals(0,c.counter);
        c.getMyCommandButtons();
        c.SelectedPage='10';
        c.total_size=100;
        c.refreshGrid();        
        c.getMyCommandButtons(); 
        c.getTotal_size();
        system.assertEquals(100, c.getTotal_size());
        c.getPageNumber();
        c.getTotalPages(); 
        System.assertEquals(5, c.getTotalPages());
        c.ContactLists();
        c.Redirect();
        System.assertEquals('/apex/ContactDetail?id='+conId,c.Redirect().geturl());
    }    
    
    
}
