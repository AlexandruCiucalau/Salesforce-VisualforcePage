public class Contact_Searcher {
    Account a;
    public Contact_Searcher(ApexPages.StandardController controller)
    {
        a = (Account) controller.getRecord();
    }
   
    public string searchValue
    {
        get
        {
            if(searchValue == null)
                searchValue = '';
            return searchValue;
        }
        set;
    }
   
    public List<Contact> searchResults
    {
        get
        {
            if(searchResults == null)
                searchResults = new List<Contact>();
            return searchResults;
        }
        set;
    }
       
    public void searchContacts()
    {
        if(searchValue == '')
            return;
        System.Debug('Initializing search, keyword is : ' + searchValue);       
        String finalSearchValue = '%' + searchValue + '%';
        List<Contact> contacts = new List<contact>();
        contacts = [select Id, Name from Contact where Account.Id = :ApexPages.CurrentPage().getParameters().get('Id')
                    and Name like :finalSearchValue];
        searchResults = contacts;
    }
}