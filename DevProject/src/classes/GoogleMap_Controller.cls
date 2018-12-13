public class GoogleMap_Controller{
    static public Location getLocation(String street, String city, String state, String postalCode, String country){
        
        Location geolocation = new Location();
         
        // create an address string
        String address = '';
        if (street != null)
            address += street +', ';
        if (city != null)
            address += city +', ';
        if (state != null)
            address += state +' ';
        if (postalCode != null)
            address += postalCode +', ';
        if (country != null)
            address += country;

        address = EncodingUtil.urlEncode(address, 'UTF-8');

        // build callout
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://maps.googleapis.com/maps/api/geocode/json?address='+address+'&sensor=false');
        req.setMethod('GET');
        req.setTimeout(60000);

        try{
            // callout
            HttpResponse res = h.send(req);
            system.debug(res.getBody());
            // parse coordinates from response
            JSONParser parser = JSON.createParser(res.getBody());
            double lat = null;
            double lon = null;
            while (parser.nextToken() != null) {
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&
                    (parser.getText() == 'location')){
                       parser.nextToken(); // object start
                       while (parser.nextToken() != JSONToken.END_OBJECT){
                           String txt = parser.getText();
                           parser.nextToken();
                           if (txt == 'lat')
                               lat = parser.getDoubleValue();
                           else if (txt == 'lng')
                               lon = parser.getDoubleValue();
                       }

                }
            }

            // update coordinates if we get back
            if (lat != null){
                geolocation.lat = lat;
                geolocation.lon = lon;
            }

        }catch (Exception e) {
            
        }
        return geolocation;
    }
    
    public class Location{
        public Decimal lat;
        public Decimal lon;
    }
}