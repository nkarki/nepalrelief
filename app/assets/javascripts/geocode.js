var map = null;
var marker = null;
function initialize() {
    if(typeof loc !== 'undefined'){
        lat = loc.lat;
        lng = loc.lng;
    }else{
        lat = -34.397;
        lng = 150.644;
    }
	var mapOptions = {
		center: { lat: lat, lng: lng},
		zoom: 8
	};
	if($('#map-canvas')[0]) {
        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        if(typeof(controller) === 'undefined') { // this means we're in the detail view and not in the create view.
          zoomToLocation();
        }
        if(typeof formarker !== 'undefined'){
          zoomToLocation();
        }
    }    
}


function getGeoCode() {  

    if(controller) {
        var address1 = $('#' + controller + '_address_1').val();
        var address2 = $('#' + controller + '_address_2').val();
        var city = $('#' + controller + '_city').val();
        var state = $('#' + controller + '_state').val();
        var zip = $('#' + controller + '_zip').val();

        var addressArray = [];
        address1 += ' ' + address2;
        addressArray.push(address1);
        addressArray.push(city);
        addressArray.push(state);
        addressArray.push(zip);

        if (address1 != "" && city != "") {
            var url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + encodeURIComponent(addressArray.join()) + '&key=AIzaSyANSKT2dUGVFpRgfNrho-dpGg0EysDiwzI';

            var get = $.get(url);

            get.done(function (data) {
                console.log(data);
                if (data.status == 'OK') {
                    var location = data.results[0].geometry.location;

                    if (marker) {
                        marker.setMap(null);
                        marker = null
                    }

                    marker = new google.maps.Marker({
                        position: location,
                        title: data.results[0].formatted_address
                    });

                    marker.setMap(map);
                    map.panTo(location);
                    $('#' + controller + '_latitude').val(location.lat);
                    $('#' + controller + '_longitude').val(location.lng);
                }
            });
        }
    }
}

loadGoogleMapsScript = function() {

    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyANSKT2dUGVFpRgfNrho-dpGg0EysDiwzI&callback=initialize';
    document.body.appendChild(script);
    if(typeof(controller) !== 'undefined') {
        $('#' + controller + '_address_1').on('focusout', getGeoCode);
        $('#' + controller + '_city').on('focusout', getGeoCode);
        $('#' + controller + '_state').on('focusout', getGeoCode);
        $('#' + controller + '_zip').on('focusout', getGeoCode);
    }
};
//$(document).ready(loadGoogleMapsScript); //calls for the function we defined above (first loading)
$(document).on('ready page:load', loadGoogleMapsScript); // the same but for the other loadings
