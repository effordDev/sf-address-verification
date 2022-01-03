public with sharing class Google {

    //reidefford test => (2090 N Ocean Blvd)
    
    @AuraEnabled
    public static String addressAutoComplete(String input){

        String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input='+
            EncodingUtil.urlEncode(input, 'UTF-8') +
            '&types=' + 'address' +
            '&key=' + Google.getAPIKey();
        
        return Google.fetch(url);
    }

    @AuraEnabled
    public static String addressDetails(String place_id){

        String url = 'https://maps.googleapis.com/maps/api/place/details/json?'+
            '&key=' + Google.getAPIKey() +
            '&place_id=' + place_id;
        
        return Google.fetch(url);
    }
    
    public static String getAPIKey(){
        return [
            SELECT API_Key__c 
            FROM Google__mdt 
            LIMIT 1
        ].API_Key__c;
    }

    public static String fetch(String url){

        HttpRequest req = new HttpRequest();
        req.setEndpoint( url );
        req.setMethod('GET');
        
        return Test.isRunningTest() 
            ? '{ "Running": "Test" }'
            : new Http().send( req ).getBody();
    }

    public static String getTestData(){
        return '"{"predictions":[{"description":"1507 West 4th Street, Coffeyville, KS, USA","id":"bf2a0c0386f115ab368c688ca78d65c5f764dd14","matched_substrings":[{"length":2,"offset":0}],"place_id":"ChIJ1dXyB3yEt4cRQSwiCyHb71s","reference":"ChIJ1dXyB3yEt4cRQSwiCyHb71s","structured_formatting":{"main_text":"1507 West 4th Street","main_text_matched_substrings":[{"length":2,"offset":0}],"secondary_text":"Coffeyville, KS, USA"},"terms":[{"offset":0,"value":"1507"},{"offset":5,"value":"West 4th Street"},{"offset":22,"value":"Coffeyville"},{"offset":35,"value":"KS"},{"offset":39,"value":"USA"}],"types":["street_address","geocode"]},{"description":"1502 South Spruce Street, Coffeyville, KS, USA","id":"9357331c7632183b6557c495cc71d9a829180dd5","matched_substrings":[{"length":2,"offset":0}],"place_id":"ChIJh9knVvKEt4cRjM1tB26OBMo","reference":"ChIJh9knVvKEt4cRjM1tB26OBMo","structured_formatting":{"main_text":"1502 South Spruce Street","main_text_matched_substrings":[{"length":2,"offset":0}],"secondary_text":"Coffeyville, KS, USA"},"terms":[{"offset":0,"value":"1502"},{"offset":5,"value":"South Spruce Street"},{"offset":26,"value":"Coffeyville"},{"offset":39,"value":"KS"},{"offset":43,"value":"USA"}],"types":["street_address","geocode"]},{"description":"1503 Columbus Avenue, Coffeyville, KS, USA","id":"b92acc9be78dd22871c6f566bab7c57a8eee6c1b","matched_substrings":[{"length":2,"offset":0}],"place_id":"ChIJgxmcWAuEt4cRONIUNX409DA","reference":"ChIJgxmcWAuEt4cRONIUNX409DA","structured_formatting":{"main_text":"1503 Columbus Avenue","main_text_matched_substrings":[{"length":2,"offset":0}],"secondary_text":"Coffeyville, KS, USA"},"terms":[{"offset":0,"value":"1503"},{"offset":5,"value":"Columbus Avenue"},{"offset":22,"value":"Coffeyville"},{"offset":35,"value":"KS"},{"offset":39,"value":"USA"}],"types":["street_address","geocode"]},{"description":"1505 West 2nd Street, Coffeyville, KS, USA","id":"787025b381c1e5cc1a4106db8c9782a1ab254aa6","matched_substrings":[{"length":2,"offset":0}],"place_id":"ChIJZcw9fXmEt4cRxsYevFcZbFs","reference":"ChIJZcw9fXmEt4cRxsYevFcZbFs","structured_formatting":{"main_text":"1505 West 2nd Street","main_text_matched_substrings":[{"length":2,"offset":0}],"secondary_text":"Coffeyville, KS, USA"},"terms":[{"offset":0,"value":"1505"},{"offset":5,"value":"West 2nd Street"},{"offset":22,"value":"Coffeyville"},{"offset":35,"value":"KS"},{"offset":39,"value":"USA"}],"types":["street_address","geocode"]},{"description":"1503 West 6th Street, Coffeyville, KS, USA","id":"4e2ed1e87e9b1abf99b0148d9a7c96e159461ccd","matched_substrings":[{"length":2,"offset":0}],"place_id":"ChIJd5wkLnyEt4cRVmEjVjkGNJY","reference":"ChIJd5wkLnyEt4cRVmEjVjkGNJY","structured_formatting":{"main_text":"1503 West 6th Street","main_text_matched_substrings":[{"length":2,"offset":0}],"secondary_text":"Coffeyville, KS, USA"},"terms":[{"offset":0,"value":"1503"},{"offset":5,"value":"West 6th Street"},{"offset":22,"value":"Coffeyville"},{"offset":35,"value":"KS"},{"offset":39,"value":"USA"}],"types":["street_address","geocode"]}],"status":"OK"}"';
    }
}