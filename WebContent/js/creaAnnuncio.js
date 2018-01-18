function checkPosition() {
	var lat=$("#my-lat").val();
	var lon=$("#my-lon").val();

	
	if(!lat || !lon )
		return false;
	else
		return true;
}

function checkPrice() {
	var value=$("#inputPrice").val();
	if (!isNaN(value) && value.toString().indexOf('.') != -1){
		return true;
	}
	return false;
}

function checkForm(){
    
    if(!checkPrice()){
    	alert("Please enter a correct value of price..(ex: 25,00)");
    	return false;
    }
    if(!checkPosition()){
    	alert("You didn't give your position!")
    	return false;
    }
    
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; 

    var yyyy = today.getFullYear();
    if(dd<10){dd='0'+dd} 
    if(mm<10){mm='0'+mm} 
    today = yyyy+'-'+mm+'-'+dd;     

    $("#date").val(today);
    return true;
}

var map;

function initMap() {
	google.maps.event.trigger(map, 'resize'); 
    var mapOptions = {
        center: new google.maps.LatLng(10, 10),
        zoom: 8
    };
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
    var geolocationDiv = document.createElement('div');
    var geolocationControl = new GeolocationControl(geolocationDiv, map);
    
    map.controls[google.maps.ControlPosition.TOP_CENTER].push(geolocationDiv);
    
}

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
    controlText.innerHTML = 'Center map on your location';
    controlUI.appendChild(controlText);

    // Setup the click event listeners to geolocate user
    google.maps.event.addDomListener(controlUI, 'click', geolocate);
    
}

function geolocate() {
    if (navigator.geolocation) {

        navigator.geolocation.getCurrentPosition(function (position) {
		    $("#my-lat").val(position.coords.latitude);
		    $("#my-lon").val(position.coords.longitude);
		    var pos = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

            marker = new google.maps.Marker({
                position: pos,
                draggable: true,
                animation: google.maps.Animation.DROP,
                map: map
            });
            map.setCenter(pos);
        });
    }
}

$(document).ready(function() {
	// Activate tooltip
	$('[data-toggle="tooltip"]').tooltip();

	// Select/Deselect checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function() {
		if (this.checked) {
			checkbox.each(function() {
				this.checked = true;
			});
		} else {
			checkbox.each(function() {
				this.checked = false;
			});
		}
	});
	checkbox.click(function() {
		if (!this.checked) {
			$("#selectAll").prop("checked", false);
		}
	});
	
	$("#newAdd").click(function name() {
		setTimeout(loadWithDelay,2000 );
	});
	
});

function loadWithDelay() {
	google.maps.event.trigger(map, 'resize');
}

