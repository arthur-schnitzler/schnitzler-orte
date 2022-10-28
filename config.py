MASTER_FILE = "./editions/schnitzler_places.xml"
MASTER_ENRICHED = "./editions/schnitzler_places_enriched.xml"

NAME_SPACES = {
    "tei": "http://www.tei-c.org/ns/1.0",
    "xml": "http://www.w3.org/XML/1998/namespace",
}

# places with this names should be ignored
FILTER_WORDS = [
    "hotel",
    "restaurant",
    "gasthaus",
    "straße",
    "gasse",
    "allee"
]

PMB_LISTPLACE_DUMP = "https://oeawcloud.oeaw.ac.at/index.php/s/Kbnien5KfnPaFsK/download/listplace.xml"