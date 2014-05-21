# Psd2csv

Extracts text from layered PSD files into a .csv file

## Dependencies

* Ruby
* rubygems

## Installation

        git clone https://github.com/tessalt/psd2csv.git
        cd psd2csv
        gem build psd2rb.gemspec
        gem install ./pkg/psd2csv-0.0.1.gem

## Usage

From a directory containing a PSD file: 

        psd2csv input.psd output.csv 

Second argument is desired output file, defaults to "psd.csv"        

## Syntax

For text layers to be extracted, the layer name must contain an index In the format \*[A1] 

(or at least contain the characcters \*[)
