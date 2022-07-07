# schnitzler-orte
A listEvent of all places Arthur Schnitzler went to in his holidays

work in progress, data in development


## Ziel:

```
<listEvent>
    <event  from="1877-07-21" to="1877-08-06">
       <desc>
          <placeName ref="geonamesId">Fusch</placeName>
       </desc>
       <note>Sommerurlaub</note>
    </event>
    <event from="1877-07-21" to="1877-08-06">
      
       <desc>
          <placeName>Veldeser See</placeName>
       </desc>
       <note>Sommerurlaub</note>
    </event>
</listEvent>
```


## Export

1. Export des Dokuments (METS, Pages)
 
2. Transformation der METS-Datei mit 00-page2tei-0.xsl (METS to TEI)

## Bindestriche und Zeilenumbruch entfernen
3. Transformation mit 01-text-ohne-bindestrich.xsl (lb vor Bindestrich entfernen)
 
4. Transformation mit 02-text-ohne-bindestrich-2.xsl (mit Bindestrich getrenntes Wort zusammenfügen)
 
## Jahre markieren

5. Transformation mit 03-jahr-markieren.xsl (Jahr auszeichnen)
 
6. Transformation mit 04-jahr-inhalt.xsl (year-Attribut mit Jahr einfügen, ggf. cert-Attribut)

## Datum, Orte und Zusätze markieren
 
7. Transformation mit 05-datum-markieren.xsl (Tag und Monat auszeichnen, Orte als placeName und Zusätze als notes kennzeichnen)
 
8. Transformation mit 06-date-zu-iso.xsl (ISO-Daten generieren)

9. Transformation mit 07-date-zu-iso-2.xsl (ISO-Daten generieren, zweiter Schritt)

10. Transformation mit 08-date-zu-iso-3.xsl (ISO-Daten generieren, dritter Schritt)
  
11. Transformation mit 09-group-datum-ort.xsl (Daten und Orte gruppieren)
 
12. Transformation mit 10-dates-zu-event.xsl (Events erstellen)
 
13. Transformation mit 11-placeName-lookup.xsl (geonames-Abgleich)
 
13. Transformation mit 12-listevent-to-nodegoat-csv.xsl (TEI to CSV) - TO DO
