window.GMaps = {
		initialize: function($map) {
			var positionMap = {
					lat : $map.data("latitudine"),
					lng : $map.data("longitudine")
			};
			
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 14,
				center : positionMap
			});
			
			var geocoder = new google.maps.Geocoder;
			var infoWindow = new google.maps.InfoWindow;
			
			var marker1 = new google.maps.Marker({
                position: positionMap,
                map: map
             });

			var geolocationDiv = document.createElement('div');
	        var geolocationControl = new GeolocationControl(geolocationDiv, map);
	        
	        map.controls[google.maps.ControlPosition.TOP_CENTER].push(geolocationDiv);
			
	        function GeolocationControl(controlDiv, map) {

	            var controlUI = document.createElement('div');
	            controlUI.style.backgroundColor = '#444';
	            controlUI.style.borderStyle = 'solid';
	            controlUI.style.borderWidth = '1px';
	            controlUI.style.borderColor = 'white';
	            controlUI.style.height = '28px';
	            controlUI.style.marginTop = '5px';
	            controlUI.style.cursor = 'pointer';
	            controlUI.style.textAlign = 'center';
	            controlUI.title = 'Click to center map on your location';
	            controlDiv.appendChild(controlUI);

	            var controlText = document.createElement('div');
	            controlText.style.fontFamily = 'Arial,sans-serif';
	            controlText.style.fontSize = '10px';
	            controlText.style.color = 'white';
	            controlText.style.paddingLeft = '10px';
	            controlText.style.paddingRight = '10px';
	            controlText.style.marginTop = '8px';
	            controlText.innerHTML = 'How much is it far?';
	            controlUI.appendChild(controlText);

	            google.maps.event.addDomListener(controlUI, 'click', function getDistance() {
		        	navigator.geolocation.getCurrentPosition(function (position) {
		        		 var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
		                 var marker2 = new google.maps.Marker({
		                    position: pos,
		                    animation: google.maps.Animation.DROP,
		                    map: map
		                 });
		                 
		                 poly = new google.maps.Polyline({
		                     strokeColor: '#FF0000',
		                     strokeOpacity: 1.0,
		                     strokeWeight: 3,
		                     map: map,
		                   });
		                 map.setZoom(7);
		                 var path = [marker1.getPosition(), marker2.getPosition()];
		                 poly.setPath(path);
		                 
		                 destination=new google.maps.LatLng(positionMap.lat, positionMap.lng);
		                 var service = new google.maps.DistanceMatrixService();
		        			service.getDistanceMatrix(
		        			  {
		        			    origins: [pos],
		        			    destinations: [destination],
		        			    travelMode: 'DRIVING',
		        			  }, callback);

		        			function callback(response, status) {
		        				  if (status == 'OK') {
		        				    var origins = response.originAddresses;
		        				    var destinations = response.destinationAddresses;

		        				    for (var i = 0; i < origins.length; i++) {
		        				      var results = response.rows[i].elements;
		        				      for (var j = 0; j < results.length; j++) {
		        				        var element = results[j];
		        				        var distance = element.distance.text;
		        				        var duration = element.duration.text;
		        				        var from = origins[i];
		        				        var to = destinations[j];
		        				        controlText.innerHTML = distance+' - '+ duration;
		        				      }
		        				    }
		        				  }
		        				}
		                 
		              });
		        });
	        }
			
			marker1.addListener('click', function() {
				geocodeLatLng(geocoder, map, infoWindow);
			});
	        
	        function geocodeLatLng(geocoder, map, infowindow) {
	            geocoder.geocode({'location': positionMap}, function(results, status) {
	              if (status === 'OK') {
	                if (results[0]) {
	                  
	                  infowindow.setContent(results[0].formatted_address);
	                  infowindow.open(map, marker1);
	                } else {
	                  window.alert('No results found');
	                }
	              } else {
	                window.alert('Geocoder failed due to: ' + status);
	              }
	            });
	        }
			
		}

};
