@isTest
public class AccountControllertest {
    @isTest
    public static void AccountControllertest() {
        Account acct=new Account();
        acct = TestDataFactory.createAccounts()[0];
        insert acct;
        system.assertEquals(acct.name, 'Test Account1');
        ApexPages.StandardController sc = new ApexPages.StandardController(acct);
        AccountController2 acc = new AccountController2(sc);
        acc.save();
    }
}
