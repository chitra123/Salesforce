<aura:application >
	<aura:handler name="init" value="{!this}" action="{!c.doInit}" />
    <button onclick="{!c.showFromWindow}">Show from in App</button>
    
    <c:NonLockerWindow /> 
 
    <c:LockerWindow />
    
    <c:MyContainer ></c:MyContainer>
</aura:application>