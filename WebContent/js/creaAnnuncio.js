function checkPrice() {
	var value=$("#inputPrice").val();
	if (!isNaN(value) && value.toString().indexOf('.') != -1){
		return true;
	}
	alert("Please enter a correct value of price..(ex: 25,00)");
	return false;
}

function setDate(){
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; 

    var yyyy = today.getFullYear();
    if(dd<10){dd='0'+dd} 
    if(mm<10){mm='0'+mm} 
    today = yyyy+'-'+mm+'-'+dd;     

    $("#date").val(today);
    return checkPrice();
}

var map;

function initMap() {
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
