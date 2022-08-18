# schnitzler-orte
A listEvent of all places Arthur Schnitzler went to in his holidays

work in progress, data in development

final xml is the last document in /finalized-files/transformed-xml 


## enrich with pmb-uris

to enrich the data with pmb-uris you'll need to
* create a virtual environment e.g. `virtualenv env`
* activate it e.g. `source env/bin/activate`
* install needed packages `pip install -r requirements.txt`
* and finally run `python check_against_pmb.py`

this script creates a file `finalized-files/places_with_pmb.csv` with two new columns `geonames` and `pmb_id`
