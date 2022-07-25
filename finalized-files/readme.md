**Ordnung der XSLT Files**

1. mets.xml transformieren mit 00_page2tei-0.xsl zu TEI File
2. 01_text-ohne-bindestrich.xsl (Durch Bindestrich getrennte Wörter zusammenfügen)
3. 02_jahr-markieren.xsl 
4. 03_jahr-inhalt.xsl
5. 04_iso-date.xsl (Alle Datumsangaben in date Elemente mit @from @to zusammenführen)
6. 05_note-placeName.xsl (note placeName Elemente einfügen)
7. 06_events.xsl (Transformation zu event Elemente)
8. 07_placeName-lookup.xsl (Lookup der Geoname IDs in listplace.xml) 

    Manuelle Nachbearbeitung (Korrektur der Ortsnamen, Datumsangaben): manuelle-nachb.xml

9. Transformation von manuelle-nachb.xml mit 07_placeName-lookup.xsl
