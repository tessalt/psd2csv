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
      pattern = /\*\[([a-zA-Z]\d)/
      rows = Array.new

      psd.tree.descendant_layers.each do |layer|
        unless layer.text.nil?
          matches = /\*\[([a-zA-Z]\d)/.match(layer.name)
          if matches
            row = Hash.new
            row[:index] = matches.to_a[1]
            row[:text] = layer.text[:value]
            rows.push(row)
          end
        end
      end

      sorted_rows = rows.sort do |a, b| 
        a[:index].upcase <=> b[:index].upcase
      end

      CSV.open(csv_file, "w") do |csv|
        csv << ["index", "layer text"]
        sorted_rows.each { |row| csv << [row[:index], row[:text]]}
        puts "File created: #{csv_file}"
      end

    end

  end
end
