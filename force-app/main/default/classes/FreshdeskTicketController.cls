public class FreshdeskTicketController {
	
    @AuraEnabled
    public static void craeteTicket(Map<String, Object> inputMap){
        System.Debug(inputMap);
        FreshDeskService.createTicket(inputMap);
    }
}