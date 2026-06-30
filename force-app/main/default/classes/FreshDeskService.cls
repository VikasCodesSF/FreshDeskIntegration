public class FreshDeskService {
    //VERSION 2 - Alternative - Ue custom label
    public static String ENDPOINT='https://deloitte-helpdesk.freshdesk.com';    
    public static void createTicket(){
        // Version 1
        //String userName = 'ozZ49gwpCTZkWlWYiifB'; -- Put this in Custom label
        //String password = 'X';
        //String combinedString = userName+':'+password;
        // Convert String combinedString in to Blob because base64Encode using blobValue as input
        //Blob blobValue = Blob.valueOf(combinedString);
        
        //Version 2
        Blob blobValue = Blob.valueOf(System.Label.FreshDeskApiKey+':'+'X');
        
        // Instantiate a new HTTP request, specify the method (GET) as well as the endpoint
        HttpRequest req = new HttpRequest();
        //Version 1
        //req.setEndpoint('https://deloitte-helpdesk.freshdesk.com/api/v2/tickets');
        
        //Version 2
        req.setEndpoint(ENDPOINT+'/api/v2/tickets');
        req.setMethod('POST');
        req.setHeader('Content-Type','application/json');
        req.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(blobValue));
        
        //Version 1
        //String requestBody = '{ "description": "Details about the refund credit...", "subject": "Expecting Support", "email": "vikas@outerspace.com", "priority": 1, "status": 2, "source": 1 }';
        
        //Version 2 -- Recent Salesforce Literals - Multiline String
        /* String requestBody = '''
        { 
            "description": "Details about the refund credit...", 
             "subject": "Expecting Support", 
             "email": "vikas@outerspace.com", 
             "priority": 1, 
             "status": 2, 
             "source": 1 
        }
        ''';*/
            
        //Version 3 -- Pass dymanic value - real time integartion need it
        /*String requestBody = '''
        { 
            "description": "${descriptionVar}", 
             "subject": "${subjectVar}", 
             "email": "${emailVar}", 
             "priority": 1, 
             "status": 2, 
             "source": 1 
        }
        '''.template(new Map<String, Object>{
            'descriptionVar'=> 'Details about the refund credit...', 
             'subjectVar' => 'Login Issue', 
             'emailVar'=> 'vikas@outerspace.com'
            });*/
    
    //Version 4 -- Create Map before hand 
     Map<String, Object> mapValue = new Map<String, Object>{
            'descriptionVar'=> 'Details about the refund credit...', 
             'subjectVar' => 'Issue in Refund', 
             'emailVar'=> 'vikas@outerspace.com',
             'priority' => 2
            };
        
        String requestBody = '''
        { 
            "description": "${descriptionVar}", 
             "subject": "${subjectVar}", 
             "email": "${emailVar}", 
             "priority": ${priority}, 
             "status": 2, 
             "source": 1 
        }
        '''.template(mapValue);
            
        req.setBody(requestBody);
        
        // Instantiate a new Http object
        Http h = new Http();
        //Version 2 - Try Catch block
        try{
            
            HttpResponse httpRes = h.send(req); 
            
            System.debug(httpRes.getStatusCode());
            System.debug(httpRes.getBody());
            
            if(httpRes.getStatusCode() == 200 || httpRes.getStatusCode() == 201){
                //success                             
            }else{
                //error
            }
            
        }catch(System.CalloutException ex){
            System.debug('Line Number'+ ex.getLineNumber());
            System.debug('Cause'+ ex.getCause());
            System.debug('Message'+ ex.getMessage());
            System.debug('StraceTraceString'+ ex.getStackTraceString());
            System.debug('TypeName'+ ex.getTypeName());
        }catch(System.Exception ex){
            System.debug('Line Number'+ ex.getLineNumber());
            System.debug('Cause'+ ex.getCause());
            System.debug('Message'+ ex.getMessage());
            System.debug('StraceTraceString'+ ex.getStackTraceString());
            System.debug('TypeName'+ ex.getTypeName());
        }       
    } 
}