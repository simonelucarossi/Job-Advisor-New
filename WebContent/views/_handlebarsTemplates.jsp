<script id="annuncio-template" type="text/x-handlebars-template">
 <a href="annuncio/{{id}}">
		<div id="{{id}}" class="entry">
				
				<div class="entry-details">
					<img id="image-entry"
						src="/JobAdvisorNew/img/user-icon.png" />
					<h3 id="title-entry">{{categoria}}</h3>
					<p id="position-entry">{{creatore.nomeCompleto}}</p>
					
				</div>

				<div class="help-entry">
					<div class="review-entries">
						<img class="review-entry" src="img/star.png" />
						<p>Val.Media: {{valutazione}}</p>
					</div>

					<div class="price-entries">
						<img class="price-entry" src="img/euro.png" />
						<p>Prezzo: {{prezzo}}</p>
			</div>
		</div>
	</div>
	</a></input>
</script>

<script id="annuncio-details" type="text/x-handlebars-template">
	<div class="annuncio-details">
		<div class="annuncio-info">
			<img id="img-annuncio" src="/JobAdvisorNew/img/user-icon.png"/>
			<div class="annuncio-descrizione">
				<div id="annuncio-informazioni">
					<h1>Pro: {{creatore}}</h1>
					<h2>Category: {{categoria}}</h2>
					<h3>Ads Date: {{data}}</h3>
				</div>
				<div id="annuncio-bottoni">
					<button id="contatta-bottone" class="btn btn-default">
						<a href="#">Contact</a>
					</button>
					{{#if loggedin}}
					<button id="recensione-bottone" class="btn btn-default">
						<a href="#">Leave a review</a>
					</button>
					{{/if}}
				</div>
			</div>
		</div>
		<div class="annuncio-posizione">
			<div id="annuncio-posizione-titolo">
				<h2>Position</h2>
			</div>
			
			<div id="map" style="height: 400px;" data-longitudine="{{longitudine}}" data-latitudine="{{latitudine}}"></div>

		</div>
	</div>
	<div class="annuncio-reviews">
		<div id="annuncio-reviews-titolo">
			<h2>Reviews</h2>
		</div>
		<div class="review js-roriva">
    		   	
		</div>
	</div>

</script>

<script id="review-details" type="text/x-handlebars-template">
				<div id="review">
					<img id="img-review" src="/JobAdvisorNew/img/user-icon.png">
    		<div class="review-details-box">
    			<div id="review-title">
    				<h2 id="title-review">{{title}} </h2>
                    <div id="review-star">
                    	<img id="img-review-star" src="/JobAdvisorNew/img/star.png">
                        <p id="p-review-star">{{valutazione}}</p>
                    </div>
    			</div>
    			<div id="review-text">
    				<p> {{testo}} </p> 
    			</div>
				<div id="review-creator">
    				<p>Review written by: {{reviewer}} </p> 
    			</div>
    </div>
</div>
</script>