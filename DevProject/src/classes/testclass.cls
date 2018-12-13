public class testclass{

    public boolean flag{get;set;}
    public String out{get;set;}
    public testclass(){
     //  out= new String();
    }
    public void chkContent(){
       
       //flag = Apexpages.currentpage().getparameters().get('flag');
        system.debug('flag>>>'+flag);
        
        if(flag==true)
           out='button1';
        else
            out='button2';
        
           system.debug('out--->>'+out);
           
          // return null;
    }
    
}