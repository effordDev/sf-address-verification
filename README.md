# sf-address-verification
## LWC
Comprised of one lightning web component that handles the ui  
![image](https://user-images.githubusercontent.com/36901822/147955790-b3c9783b-b4fe-4353-95b6-2acb4954aa74.png)  

Example of UI  
![image](https://user-images.githubusercontent.com/36901822/147955960-76bb928f-1be2-45f1-b455-7b684b28c5ab.png)  
![image](https://user-images.githubusercontent.com/36901822/147956019-7075b503-e4cd-4ba2-9472-a696a7bf4602.png)  
![image](https://user-images.githubusercontent.com/36901822/147957054-100d63cf-5727-4108-8415-755dcb200668.png)


Data (1 / 4) for predications:
```
{
    "description": "2137 North Oceanshore Boulevard, Flagler Beach, FL, USA",
    "matched_substrings": [
        {
            "length": 4,
            "offset": 0
        },
        {
            "length": 26,
            "offset": 5
        }
    ],
    "place_id": "ChIJre6NwpK_5ogRNhcWHjbfs0w",
    "reference": "ChIJre6NwpK_5ogRNhcWHjbfs0w",
    "structured_formatting": {
        "main_text": "2137 North Oceanshore Boulevard",
        "main_text_matched_substrings": [
            {
                "length": 4,
                "offset": 0
            },
            {
                "length": 26,
                "offset": 5
            }
        ],
        "secondary_text": "Flagler Beach, FL, USA"
    },
    "terms": [
        {
            "offset": 0,
            "value": "2137"
        },
        {
            "offset": 5,
            "value": "North Oceanshore Boulevard"
        },
        {
            "offset": 33,
            "value": "Flagler Beach"
        },
        {
            "offset": 48,
            "value": "FL"
        },
        {
            "offset": 52,
            "value": "USA"
        }
    ],
    "types": [
        "street_address",
        "geocode"
    ]
}
```
Selected Address Data from https://maps.googleapis.com/maps/api/place/details:
```
{
    "address_components": [
        {
            "long_name": "2137",
            "short_name": "2137",
            "types": [
                "street_number"
            ]
        },
        {
            "long_name": "North Oceanshore Boulevard",
            "short_name": "N Ocean Shore Blvd",
            "types": [
                "route"
            ]
        },
        {
            "long_name": "Flagler Beach",
            "short_name": "Flagler Beach",
            "types": [
                "locality",
                "political"
            ]
        },
        {
            "long_name": "Flagler County",
            "short_name": "Flagler County",
            "types": [
                "administrative_area_level_2",
                "political"
            ]
        },
        {
            "long_name": "Florida",
            "short_name": "FL",
            "types": [
                "administrative_area_level_1",
                "political"
            ]
        },
        {
            "long_name": "United States",
            "short_name": "US",
            "types": [
                "country",
                "political"
            ]
        },
        {
            "long_name": "32136",
            "short_name": "32136",
            "types": [
                "postal_code"
            ]
        },
        {
            "long_name": "2802",
            "short_name": "2802",
            "types": [
                "postal_code_suffix"
            ]
        }
    ],
    "adr_address": "<span class=\"street-address\">2137 N Ocean Shore Blvd</span>, <span class=\"locality\">Flagler Beach</span>, <span class=\"region\">FL</span> <span class=\"postal-code\">32136-2802</span>, <span class=\"country-name\">USA</span>",
    "formatted_address": "2137 N Ocean Shore Blvd, Flagler Beach, FL 32136, USA",
    "geometry": {
        "location": {
            "lat": 29.506834,
            "lng": -81.14035899999999
        },
        "viewport": {
            "northeast": {
                "lat": 29.5082423802915,
                "lng": -81.13884826970849
            },
            "southwest": {
                "lat": 29.5055444197085,
                "lng": -81.1415462302915
            }
        }
    },
    "icon": "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/geocode-71.png",
    "icon_background_color": "#7B9EB0",
    "icon_mask_base_uri": "https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet",
    "name": "2137 N Ocean Shore Blvd",
    "place_id": "ChIJre6NwpK_5ogRNhcWHjbfs0w",
    "plus_code": {
        "compound_code": "GV45+PV Flagler Beach, FL, USA",
        "global_code": "76XWGV45+PV"
    },
    "reference": "ChIJre6NwpK_5ogRNhcWHjbfs0w",
    "types": [
        "street_address"
    ],
    "url": "https://maps.google.com/?q=2137+N+Ocean+Shore+Blvd,+Flagler+Beach,+FL+32136,+USA&ftid=0x88e6bf92c28deead:0x4cb3df361e161736",
    "utc_offset": -300,
    "vicinity": "Flagler Beach"
}
```

## APEX
Handles callout to google
## Metadata
Stores Google place API Key
## Remote Site Settings
Allows SF to call to https://maps.googleapis.com
