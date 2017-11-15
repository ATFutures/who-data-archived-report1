LFILE = README
OSMDATAFILE = code/download-osm-data
WPDATAFILE = code/convert-worldpop-data

all: osm worldpop

knith: $(LFILE).Rmd
	echo "rmarkdown::render('$(LFILE).Rmd',output_file='$(LFILE).html')" | R --no-save -q

knitr: $(LFILE).Rmd
	echo "rmarkdown::render('$(LFILE).Rmd',rmarkdown::md_document(variant='markdown_github'))" | R --no-save -q

open: $(LFILE).html
	xdg-open $(LFILE).html &

osm: $(OSMDATAFILE).R
	Rscript --verbose $(OSMDATAFILE).R

worldpop: $(WPDATAFILE).R
	Rscript --verbose $(WPDATAFILE).R

clean:
	rm -rf *.html *.png README_cache 
