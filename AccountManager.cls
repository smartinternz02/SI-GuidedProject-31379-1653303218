@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;        
        String accountId = request.requestURI.substringBetween('/Accounts/','/contacts');
        Account result =  [SELECT Id, Name, (SELECT Id, Name from contacts) from Account where Id=:accountId];
                               return result;
    }
}