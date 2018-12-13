public with sharing class TestShufle {
	/*
    public List<TimeTable> dataTime{get;set;}
    public List<Time> timeDiff {get; set;}
    public Integer minutes;
    //public List<TeacherClassSubjectMap__c> templist{get;set;}
    integer count=0;
    integer j=0;
    //integer k=0;
    public List<TeacherClassSubjectMap__c> subList{get;set;}
    public List<TeacherClassSubjectMap__c> subList2{get;set;}
    public Id classId{get;set;}
    public String teach{get; set;}
    
    
    public class TimeTable{
        public TeacherClassSubjectMap__c sub{get;set;}
        public String timeD{get;set;}
        
        public TimeTable(TeacherClassSubjectMap__c sub,String timeD){
            this.sub = sub;
            this.timeD = timeD;
        }
    }
    
    public Generate_Time_Table(ApexPages.StandardController controller) {
    
      dataTime = new List<TimeTable>();  
      timeDiff  = new List<Time>();
      
      subList=new List<TeacherClassSubjectMap__c>();
      subList2=new List<TeacherClassSubjectMap__c>();
     // templist= new List<TeacherClassSubjectMap__c>();
      
      TeacherClassSubjectMap__c brkList = new TeacherClassSubjectMap__c();
      brkList.Teachers_Subject__c = 'a0j90000000GcMY'; 
      minutes = 0;
      classId=ApexPages.currentPage().getParameters().get('selectedClass');
      //minutes = Integer.valueOf(ApexPages.currentPage().getParameters().get('minutes'));
      sublist=[select name,Class_Subjects__c,Teachers_Subject__c,ClassName__c from TeacherClassSubjectMap__c where TeacherClassSubjectMap__c.ClassName__c=:classId];
   		
      Class__c classObj = [select Name,Number_of_Periods__c from Class__c where id = :sublist[0].ClassName__c];
      sublist2 = [select name from ClassSubjectMap__c where ClassName__r.Name =:classObj.Name];
     
      teach = classObj.Name;
      timeDiff.add(Time.newInstance(8,0,0,0));
        
      for(integer i= 0;i<classObj.Number_of_Periods__c ;i++){
                            
            if((i==2&&count==0)||(i==6&&count==1))
           {   
               count++;
               minutes = minutes+15;
               timeDiff.add(Time.newInstance(8,minutes, 0, 0));
               dataTime.add(new TimeTable(brkList,String.valueOf(timeDiff[j])+'-'+String.valueOf(timeDiff[j+1]))); 
               i=i-1;
           }
           else{
               
                minutes = minutes+30;
                timeDiff.add(Time.newInstance(8,minutes, 0, 0));
               dataTime.add(new TimeTable(sublist[i],String.valueOf(timeDiff[j])+'-'+String.valueOf(timeDiff[j+1]))); 
           }
           j++;
           }
           system.debug('dataTime>>'+dataTime);
  }*/
}