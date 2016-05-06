public class AccountController {
 
  private string accountID = '';
  public Account accountItem{get;set;}
 
  public AccountController(){
    //Constructor
    list<account> accountList = new list<account>();
    accountID = System.currentPageReference().getParameters().get('aId');  
    accountList = [Select ID, Name, AccountNumber From Account Where ID = :accountID];
    if(accountList.isEmpty() == false){
      accountItem = accountList[0];
    }else{
      ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, 'The Account ID is invalid.');
      ApexPages.addMessage(msg);
      ApexPages.addMessage('This is new Error Message : '+msg);
    }
  }
 /* */
  public pageReference cancelAction(){
    return returnToOrigination();
  }
 
  public pageReference saveItem(){
    //Do something to the Account object and then update it
    if(AccountItem.AccountNumber == null)
        accountItem.AccountNumber = accountItem.ID;
    update accountItem;
    return returnToOrigination();
  }
 
  private pageReference returnToOrigination(){
    PageReference page = new PageReference('/'+accountItem.ID);
    page.setRedirect(true);
    return page;
  }
   
}
