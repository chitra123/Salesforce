/**
 * An apex page controller that supports self registration of users in communities that allow self registration
 */
public with sharing class CommunitiesSelfRegController {

    public String firstName {get; set;}
    public String lastName {get; set;}
    public String email {get; set;}
    public String password {get; set {password = value == null ? value : value.trim(); } }
    public String confirmPassword {get; set { confirmPassword = value == null ? value : value.trim(); } }
    public String communityNickname {get; set { communityNickname = value == null ? value : value.trim(); } }
    
    public CommunitiesSelfRegController() {}
    
    private boolean isValidPassword() {
        return password == confirmPassword;
    }

    public PageReference registerUser() {
    
           // it's okay if password is null - we'll send the user a random password in that case
        if (!isValidPassword()) {
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.ERROR, Label.site.passwords_dont_match);
            ApexPages.addMessage(msg);
            return null;
        }    
        system.debug('profile>>>'+UserInfo.getProfileId());
        //Account acc = [select id from Account where Name = 'Portal Account' limit 1];
        Profile portalUserProfile = [select id from Profile where Name = 'Customer Portal Manager Standard'];
        String profileId = portalUserProfile.id; 
        String roleEnum = UserInfo.getUserRoleId(); 
        //String accountId = acc.id;
        
        String userName = firstName+ '.'+lastName+'@community.com.'+communityNickname;

        User u = new User();
        u.Username = userName;
        u.Email = email;
        u.FirstName = firstName;
        u.LastName = lastName;
        u.CommunityNickname = communityNickname;
        u.ProfileId = '00e90000001N2PT';
        
        system.debug('user>>>'+u);
        String userId;
        try{
         userId= Site.createPortalUser(u, '0019000001iWTO0', password);
          system.debug('userId>>>'+userId );
          }
          catch(Exception ex){
          system.debug('ex>>'+ex);
          }
        if (userId != null) { 
            if (password != null && password.length() > 1) {
                return Site.login(userName, password, ApexPages.currentPage().getParameters().get('startURL'));
            }
            else {
                PageReference page = System.Page.CommunitiesSelfRegConfirm;
                page.setRedirect(true);
                return page;
            }
        }
        return null;
    }
}