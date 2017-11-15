<!-- README.md is generated from README.Rmd. Please edit that file -->
who-data
========

[![Build Status](https://travis-ci.org/ATFutures/who.svg)](https://travis-ci.org/ATFutures/who) [![Project Status: Concept - Minimal or no implementation has been done yet.](http://www.repostatus.org/badges/0.1.0/concept.svg)](http://www.repostatus.org/#concept)

Data for [`who` repo](https://github.com/ATFutures/who).

### Installation

``` r
devtools::install_github("ATFutures/who")
```

### Usage

`makefile` based. Files for [`worldpop`](http://www.worldpop.org.uk) must be manually downloaded - see specific `[city]/worldpop` directories for details. These are national level `zip`-archived files which need to be cropped to the city level only, and are converted to `geotif` format. This can be done, and all OSM data also downloaded into corresponding directories with a single `make` call. Alternatively, the components can be executed with

    make osm
    make worldpop

Note that `make osm` will always overwrite any existing OSM data, whereas `make worlpop` will only convert files if they've not already been converted.

EC Joint Research Centre Data Collection
========================================

The JRCDC offers global gridded population density data [here](http://data.jrc.ec.europa.eu/dataset/jrc-ghsl-ghs_pop_gpw4_globe_r2015a/resource/ece1dd0b-a69a-4804-a69b-0984b15efcdd), with the actual downloads [here](http://cidportal.jrc.ec.europa.eu/ftp/jrc-opendata/GHSL/GHS_POP_GPW4_GLOBE_R2015A/).
