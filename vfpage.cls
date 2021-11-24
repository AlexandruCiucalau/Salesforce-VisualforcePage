<apex:page standardController="Account" extensions="Contact_Searcher">
    <apex:form >
        <apex:pageBlock title="Account details" mode="edit">
        <apex:pageBlockButtons >
            <apex:commandButton action="{!save}"
                                value="Save"/>
            <apex:commandButton action="{!cancel}"
                                value="Cancel"/>
            </apex:pageBlockButtons>
        <apex:pageBlockSection title="Account Details Section" columns="6">
            <apex:inputField value="{!account.name}"/>
            <apex:inputField value="{!account.accountnumber}"/>
			<apex:inputField value="{!account.type}"/>
            <apex:inputField value="{!account.Active__c}"/>
			<apex:inputField value="{!account.phone}"/>
            <apex:inputField value="{!account.fax}"/>            
            </apex:pageBlockSection>
            
         <apex:pageBlock title="Contact Search">
      <h2 class="maintitle">Enter Search String&nbsp;&nbsp;</h2>
      <apex:inputText id="searchBox" value="{!searchValue}" />
      <apex:commandButton id="submit" value="Search" action="{!searchContacts}" />
    </apex:pageBlock> 
            <apex:pageBlock title="Search Results">
      <apex:pageBlockTable value="{!searchResults}" var="c">
        <apex:column value="{!c.Name}" />
        <apex:column value="{!c.Phone}"/>
        <apex:column value="{!c.Is_Primary_Contact__c}"/>
      </apex:pageBlockTable>
    </apex:pageBlock> 
            
         <apex:dataTable value="{!account.Contacts}" var="contacts">
            <apex:column >
             <apex:facet name="header">Name</apex:facet>
                {!contacts.Name}
             </apex:column>
             
            <apex:column >
             <apex:facet name="header">Phone</apex:facet>
             	{!contacts.Phone}
             </apex:column>
             
            <apex:column >
             <apex:facet name="header">Title</apex:facet>
                {!contacts.Title}
             </apex:column>
             
             <apex:column >
             <apex:facet name="header">Is Primary Contact</apex:facet>
                 {!contacts.Is_Primary_Contact__c}
             </apex:column>
             
             <apex:outputLink value="https://brave-moose-3ruslq-dev-ed.lightning.force.com/lightning/r/Contact/0030900000fmlwZAAQ/view">Set As Primary</apex:outputLink>
             <apex:image id="theImage" value="https://developer.salesforce.com/files/salesforce-developer-network-logo.png" width="220" height="100" alt="Description of image here"/>
             <apex:column headerValue="{!IF(Is_Primary_Contact__c, theImage,https://brave-moose-3ruslq-dev-ed.lightning.force.com/lightning/r/Contact/0030900000fmlwZAAQ/view">
             </apex:column>
            
            </apex:dataTable>
        </apex:pageBlock>
    </apex:form>
</apex:page>