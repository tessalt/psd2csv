require "psd2csv/version"
require 'psd'
require 'csv'
require 'json'

module Psd2csv
  class Parse
    def psd2csv
      file = ARGV[0]
      csv_file = ARGV[1] || "psd.csv"
      psd = PSD.new(file, parse_layer_images: true)        
      CSV.open(csv_file, "w") do |csv|
        csv << ["layer name", "layer text", "font size"]
        psd.tree.descendant_layers.each do |layer|
          unless layer.text.nil?
            csv << [layer.name, layer.text[:value], layer.text[:font][:sizes]]
          end
        end
      end    
    end
  end
end
