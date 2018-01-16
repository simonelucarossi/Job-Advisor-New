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
			
			var marker = new google.maps.Marker({
                position: positionMap,
                map: map
             });
			
			marker.addListener('click', function() {
				geocodeLatLng(geocoder, map, infoWindow);
			});
 
			
			
			
			 var contentString = '<div id="content">'+
	            '<div id="siteNotice">'+
	            '</div>'+
	            '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
	            '<div id="bodyContent">'+
	            '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
	            'sandstone rock formation in the southern part of the '+
	            'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
	            'south west of the nearest large town, Alice Springs; 450&#160;km '+
	            '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
	            'features of the Uluru - Kata Tjuta National Park. Uluru is '+
	            'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
	            'Aboriginal people of the area. It has many springs, waterholes, '+
	            'rock caves and ancient paintings. Uluru is listed as a World '+
	            'Heritage Site.</p>'+
	            '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
	            'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
	            '(last visited June 22, 2009).</p>'+
	            '</div>'+
	            '</div>';

			 /* var infowindow = new google.maps.InfoWindow({
	          content: contentString
	        });

	        var marker = new google.maps.Marker({
	          position: positionMap,
	          map: map,
	          title: 'Uluru (Ayers Rock)'
	        });
	        marker.addListener('click', function() {
	          infowindow.open(map, marker);
	        });
			*/
			 
			
	        
	        function geocodeLatLng(geocoder, map, infowindow) {
	            geocoder.geocode({'location': positionMap}, function(results, status) {
	              if (status === 'OK') {
	            	  console.log("cacca");
	                if (results[0]) {
	                  map.setZoom(20);
	                  
	                  infowindow.setContent(results[0].formatted_address);
	                  infowindow.open(map, marker);
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