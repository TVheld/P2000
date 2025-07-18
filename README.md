# P2000 Meldingen App

Een iOS-app gebouwd in SwiftUI die realtime P2000-meldingen toont. De applicatie gebruikt de JSON-feed van [Veiligheidsregio.net](https://feeds.veiligheidsregio.net/feeds/p2000.json) en presenteert de gegevens in een moderne interface geïnspireerd op het iOS 26 Liquid Glass concept.

## Functionaliteiten

- **Home**: overzicht van de meest recente meldingen met mogelijkheid om te filteren op hulpdienst.
- **Kaart**: interactieve kaart met meldingen van de afgelopen uren. De gebruiker kan zelf het tijdsvenster instellen.
- **Zoeken**: zoek meldingen op plaatsnaam of tekst.
- **Instellingen**: kies taal, pas de straal van meldingen aan en schakel caching in of uit. Onder de slider toont een kaart visueel de ingestelde radius.

De code in deze repository bevat een basisimplementatie van het bovengenoemde concept. Extra functies zoals widgets, live activities en pushmeldingen kunnen hierop verder worden uitgebouwd.
