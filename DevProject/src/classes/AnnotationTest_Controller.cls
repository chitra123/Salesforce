public class AnnotationTest_Controller{
    public Blob doc {get;set;}
    public AnnotationTest_Controller(){
        Document docs = [select id,Body from Document limit 1];
        doc = docs.body;
        system.debug('docs >>>'+docs );
    }
}