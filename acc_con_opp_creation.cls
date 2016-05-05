public class acc_con_opp_creation
{
 public account createAccount(string p)
 {
 account a = new account();
 a.name = p;
 insert a;
 
 contact c = new contact();
 c.lastname = 'Mohammed';
 c.accountid = a.id;
 insert c;
 
 opportunity opp = new opportunity();
 opp.name = 'Test Opty';
 Date d = Date.newinstance(2012,2,17);
 opp.closeDate = d;
 opp.StageName = 'Closed Lost';
 opp.accountid = a.id;
 insert opp;
 
 return a;
 
 }
}