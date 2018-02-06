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
						<p>Prezzo: 75</p>
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
					<button id="recensione-bottone" class="btn btn-default">
						<a href="#">Leave a review</a>
					</button>
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
				<div id="review" style="
    				width: 100%;
    				border-bottom: 2px solid #333333f7;
    				padding-bottom: 2px;
					display: flex;
				">
					<img src="/JobAdvisorNew/img/user-icon.png" style="
    height:  100%;
    width: 120px;
    margin-bottom: -3px;
">
    		<div class="review-details-box" style="
    height: 100%;
    padding-left: 12px;
    padding-right:  12px;
    padding-top:  12px;
    width: 100%;
    margin-bottom: 3px;
">
    			<div id="review-title" style="
    display: flex;
    justify-content: space-between;
">
    				<h2 style="
    font-size:  1.75rem;
    padding-bottom: 10px;
    font-family:  Helvetica;
    color: #077ce2;
">{{title}} </h2>
                    <div id="review-star" style="
    display:  flex;
">
                    	<img src="/JobAdvisorNew/img/star.png" style="
    height:  30px;
    margin-top: -2px;
    padding-right: 10px;
">
                        <p style="
    font-size:  26px;
    margin-top: -3px;
">{{valutazione}}</p>
                    </div>
    			</div>
    			<div id="review-text">
    				<p> {{testo}} </p> 
    			</div>
				<div id="review-creator" style="padding-top: 18px;">
    				<p>Review written by: {{reviewer}} </p> 
    			</div>
    </div>
</div>
</script>