@isTest
public class AccountControllertest {
    @isTest
    public static void AccountControllertest() {
        List<Account> lstacct = TestDataFactory.createAccounts(100);
        insert lstacct;
        List<Account> accts = [select Name, Phone from Account where id IN:lstacct];
        for(Account acct: accts){
            System.assert(acct.Id!=null);
        }
        System.assert(lstacct.size()>0);
        
        ApexPages.StandardController sc = new ApexPages.StandardController(lstacct[0]);
        AccountController2 acc = new AccountController2(sc);
        acc.save();
        System.assertEquals('/apex/AccountList2', acc.save().geturl());
    }
}
