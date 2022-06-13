public class AccountProcessor {
 @future
    public static void countContacts(List<Id> accountIds){
        
        
        List<Account> accountsToUpdate = new List<Account>();
        
        List<Account> account = [Select Id, Name, (Select Id from Contacts) from Account Where Id in :accountIds];
        
        For(Account acc:account){
            List<Contact> contactList =acc.Contacts;
            acc.Number_of_contacts__c = contactList.size();
            accountsToUpdate.add(acc);
        }
        update accountsToUpdate;
    }
}