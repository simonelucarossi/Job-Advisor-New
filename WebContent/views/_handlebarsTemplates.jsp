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
						<p>Val.Media: 3.5</p>
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
					<h1>Professionista: {{creatore}}</h1>
					<h2>Categoria: {{categoria}}</h2>
					<h3>Data annuncio: {{data}}</h3>
				</div>
				<div id="annuncio-bottoni">
					<button id="contatta-bottone" class="btn btn-default" type="submit">
						<a href="#">Contatta</a>
					</button>
					<button id="recensione-bottone" class="btn btn-default" type="submit">
						<a href="#">Lascia una recensione</a>
					</button>
				</div>
			</div>
		</div>
		<div class="annuncio-posizione">
			<div id="annuncio-posizione-titolo">
				<h2>Posizione</h2>
			</div>
			
			<div id="map" style="height: 400px;" data-longitudine="{{longitudine}}" data-latitudine="{{latitudine}}"></div>

		</div>
	</div>
	<div class="annuncio-reviews">
		<div id="annuncio-reviews-titolo">
			<h2>Reviews</h2>
		</div>
	</div>

</script>