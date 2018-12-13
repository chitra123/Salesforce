<aura:application >
    <ltng:require styles="/resource/bootstrap"/>
    <aura:handler name="init" value="{!this}" action="{!c.doInit}"/>
    <div class="bootstrap-sf1">
        <div class="navbar navbar-inverse">
            <div class="navbar-header">
                <a href="#" class="navbar-brand">My Expenses</a>
            </div>
        </div>
        <div class="container">
            <c:TestLightning />
        </div>
    </div>
</aura:application>