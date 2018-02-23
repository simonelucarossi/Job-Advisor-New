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
        center: new google.maps.LatLng(10,10),
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

	$('th.sort i').click(function(){
		
		if(this.className==="fa fa-sort-desc"){
			$(this).toggleClass('fa fa-sort-desc fa fa-sort-asc');
		}else{
			$(this).toggleClass('fa fa-sort-asc fa fa-sort-desc');
		}
		
	    var table = $(this).parents('table').eq(0)
	    var rows = table.find('tr:gt(0)').toArray().sort(comparer($(this).index()))
	    this.asc = !this.asc
	    if (!this.asc){rows = rows.reverse()}
	    for (var i = 0; i < rows.length; i++){table.append(rows[i])}
	})
	function comparer(index) {
	    return function(a, b) {
	        var valA = getCellValue(a, index), valB = getCellValue(b, index)
	        return $.isNumeric(valA) && $.isNumeric(valB) ? valA - valB : valA.toString().localeCompare(valB)
	    }
	}
	function getCellValue(row, index){ return $(row).children('td').eq(index).text() }
	
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
	
	$('#addForm').submit(function() {
		event.preventDefault();
		if(checkForm()){
			$.ajax({
				method: "POST",
				url: "/JobAdvisorNew/views/createAd",
				data:$("#addForm").serialize(),
				success: function () {
					location.reload();
				}
			});
		}
	});
	
	$("#newAdd").click(function name() {
		setTimeout(loadWithDelay,2000 );
	});
	
	$("#deleteButton").click(function(e) {
		var myCheckboxes = [];
		$(":checkbox").each(function() {
			var ischecked = $(this).is(":checked");
	        if (ischecked) {
	            myCheckboxes.push($(this).val());
	        }
		});

		if(myCheckboxes[0] === "on")
			myCheckboxes.shift();
		
		if(myCheckboxes.length > 0){
		    $.ajax({
		           type: "POST",
		           url: "/JobAdvisorNew/deleteAd",
		           dataType: 'json',
		           data: {
		        	   myCheckboxes: JSON.stringify(myCheckboxes)
		           },
		           error: function (data) {
		        	   location.reload();
		           }
		     });
		}else{
			alert("No user selected,please select at least one ad and retry!");	
		}
	    e.preventDefault(); 
	});
	
	 
	
	$('.edit').click(function(e) {
		 var id = $(this).closest("tr").find("td").eq(1).text();
		 $.ajax({
			 method: "GET",
				url: "/JobAdvisorNew/api/annuncio/" + id,
				dataType: "json",
				success: function (result) {
					$('#editForm input[name=id]').val(id);
					$('#editForm input[name=category]').val(result.categoria);
					$('#editForm textarea[name=description]').val(result.descrizione);
					$('#editForm input[name=price]').val(result.prezzo);
	           }
	         });
		 $("#saveButton").click(function name() {
			 $.ajax({
				 method: "POST",
					url: "/JobAdvisorNew/updateAd",
					data:$("#editForm").serialize(),
					success: function (result) {
						location.reload();
		           }
		         });
		 });
	});
	
	
	
	$("td:last-child").click(function(e) {
		 var id = $(this).closest("tr").find("td").eq(1).text();
		 $.ajax({
			 method: "GET",
				url: "/JobAdvisorNew/api/annuncio/" + id,
				dataType: "json",
				success: function (result) {
					$('#showForm input[name=id]').val(id);
					$('#showForm input[name=category]').val(result.categoria);
					$('#showForm textarea[name=description]').val(result.descrizione);
					$('#showForm input[name=price]').val(result.prezzo);
					$('#showForm input[name=date]').val(result.data);
	           }
	         });
	});
	
	
	
	$("#searchInput").keyup(function () {
	    //split the current value of searchInput
	    var data = this.value.split(" ");
	    //create a jquery object of the rows
	    var jo = $('tbody').find("tr");
	    if (this.value == "") {
	        jo.show();
	        return;
	    }
	    //hide all the rows
	    jo.hide();

	    //Recusively filter the jquery object to get results.
	    jo.filter(function (i, v) {
	        var $t = $(this);
	        for (var d = 0; d < data.length; ++d) {
	            if ($t.is(":contains('" + data[d] + "')")) {
	                return true;
	            }
	        }
	        return false;
	    }).show();
	}).focus(function () {
	    this.value = "";
	    $(this).css({
	        "color": "black"
	    });
	    $(this).unbind('focus');
	}).css({
	    "color": "#C0C0C0"
	});
	
});

function loadWithDelay() {
	google.maps.event.trigger(map, 'resize');
}
