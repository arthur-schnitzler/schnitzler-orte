**Ordnung der XSLT Files**

1. mets.xml transformieren mit 00_page2tei-0.xsl zu TEI File
2. 01_text-ohne-bindestrich.xsl (Durch Bindestrich getrennte Wörter zusammenfügen)
3. 02_jahr-markieren.xsl 
4. 03_jahr-inhalt.xsl
5. 04_iso-date.xsl (Alle Datumsangaben in <date> mit @from @to zusammenführen)
6. 05_note-placeName.xsl (<note> <placeName> einfügen)
7. 06_events.xsl (Transformation zu <event>)
8. 07_placeName-lookup.xsl (Lookup der Geoname IDs in listplace.xml) 
