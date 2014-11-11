function init_gmaps() {
  var mapOptions = {
    zoom: 1,
    center: new google.maps.LatLng(0, 0)
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  
  var location;
  for(var i = 0; i < gon.locs.length; i++){
	  location = gon.locs[i];
	  
	  var marker = new google.maps.Marker({
	    position: new google.maps.LatLng(location.latitude, location.longitude),
	    map: map
	  });

	  google.maps.event.addListener(marker, 'click', function() {
		window.location = gon.locations_path + '/' + location.id;
	  });	
  }
}
