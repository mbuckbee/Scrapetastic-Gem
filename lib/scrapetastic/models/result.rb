# This file was automatically generated for Expedited Addons by APIMATIC v2.0 ( https://apimatic.io ) on 06/03/2016

module Scrapetastic
  class Result

    # TODO: Write general description for this method
    # @return [Integer]
    attr_accessor :total

    # TODO: Write general description for this method
    # @return [List of String]
    attr_accessor :values

    def initialize(total = nil,
                   values = nil)
      @total = total
      @values = values

    end

    def method_missing(method_name)
      puts "There is no method called '#{method_name}'."
    end

    # Creates JSON of the curent object
    def to_json(options = {})
      hash = key_map
      hash.to_json(options)
    end

    # Creates an instance of the object from a hash
    def self.from_hash(hash)
      if hash == nil
        nil
      else
        # Extract variables from the hash
        total = hash["total"]
        values = hash["values"]
        # Create object from extracted values
        Result.new(total,
                   values)
      end
    end

    # Defines the key map for json serialization
    def key_map
      hash = {}
      hash['total'] = total
      hash['values'] = values
      hash
    end
  end
end
