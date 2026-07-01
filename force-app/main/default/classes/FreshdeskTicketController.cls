public class FreshdeskTicketController {
	
    @AuraEnabled
    public static HttpResponseWrapper craeteTicket(Map<String, Object> inputMap){
        System.Debug(inputMap);
        HttpResponseWrapper wrapper = FreshDeskService.createTicket(inputMap);
        return wrapper;
    }
}