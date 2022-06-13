public class AnimalLocator {
    
    public static String getAnimalNameById(Integer ID) {
        
        String animal = ' ';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String s = string.valueOf(ID);
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+ ID);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        Map<String,Object> animals = new Map<String,Object>();
        
        if(response.getStatusCode() == 200) {
            
            Map<String,Object> results = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
            animals = (Map<String,Object>) results.get('animal');         
            animal = String.valueOf(animals.get('name'));
        } else {
            
            system.debug(response.getBody());
            
        }
        Return animal;
        
    } 

}