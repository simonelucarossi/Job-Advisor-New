# Job Advisor New
## Informazioni
Il sito permette di cercare professionisti nelle proprie vicinanze, sceglierne uno in base a recensioni lasciate da altri utenti o in base al prezzo.
I pannelli a cui si può accedere o le funzionalità disponibili cambiano in base al tipo di account.
* **Amministratore:** può creare, bannare ed eliminare utenti, modificare o eliminare annunci o recensioni. Può infine recensire gli annunci accedendo direttamente all'annuncio.
* **Professionista:** può creare nuovi annunci personali dal pannello, può anche recensire annunci di altri professionisti.
* **Utente:** può soltanto ricercare professionisti e recensire i loro annunci.

## Utenti creati
* **Username:** simonerossi - **Password:**  asd - **Tipologia:** Amministratore
* **Username:** angelopollinzi - **Password:** asd - **Tipologia:** Amministratore
* **Username:** antoniolanza - **Password:** asd - **Tipologia:** Professionista
* **Username:** luigipingitore - **Password:** asd - **Tipologia:** Professionista
* **Username:** matteozavolio - **Password:** asd - **Tipologia:** Professionista
* **Username:** giuseppemazzotta - **Password:** asd - **Tipologia:** Utente

## Query di ricerca disponibili 
Nella home del sito è possibile cercare solo queste tre categorie (è possibile aggiungere altre categorie aggiungendo nuovi annunci) di professionisti:
* Developer
* Designer
* Teacher

## Configurazione
Per far partire il progetto in locale bisogna modificare il percorso delle librerie e includere quelle mostrate nello screen qui sotto, i file .jar da inserire sono presenti nella cartella "jar_libraries" che si trova nella directory principale del progetto.
Inoltre il progetto è stato sviluppato usufruendo di Tomcat 9.0, nella cartella è presente anche il file zip della versione 9 di Tomcat (nel caso fosse necessario).

![Job-Advisor-New](/screen/screen1.png)

## Avvertenze
1. Quando si effettua il logout da un account, il sito viene reindirizzato ad una pagina che ha nella parte finale del link "logout", eliminarlo o cliccare sul logo del sito per poter tornare alla home e poter effettuare nuovamente il login.
2. Il tasto per ordinare la lista di annunci in base alla distanza (dal piu' vicino al più lontano o viceversa) non funziona sul db di Elephant, mentre con il db locale si, probabilmente non riconosce la funzione di postgres il db di Elephant.
3. Il DB è presente online su Elephant, è stato scelto un DB di Londra, dunque potrebbe essere leggermente lento nel caricamento della lista degli annunci o nel caricamento di un singolo annuncio, dunque, per favore, attendere qualche secondo.
4. All'interno di un annuncio è presente un tasto per contattare il professionista e un secondo tasto per lasciare una recensione, mentre il primo è sempre visibile, il secondo è visibile soltanto una volta effettuato l'accesso con il proprio account.
5. La home page è stata quasi del tutto fatta a mano, le pagine della lista degli annunci e di un singolo annuncio sono fatte completamente a mano (anche responsive) mentre i pannelli sono stati fatti utilizzando Bootstrap.
6. L'amministratore all'interno del proprio pannello può usufruire di una barra laterale che appare quando si avvicina il mouse alla parte sinistra dello schermo (come si nota nello screen riportato qui sotto), funzione che è disponibie solo nella versione Desktop. 

![Job-Advisor-New](/screen/screen2.png)