# This file was automatically generated for Expedited Addons by APIMATIC v2.0 ( https://apimatic.io ) on 06/03/2016

module Scrapetastic
  class APIController < BaseController
    @@instance = APIController.new
    # Singleton instance of the controller class
    def self.instance
      @@instance
    end

    # TODO: type endpoint description here
    # @param [String] content Required parameter: The HTML content. This can be either a URL to load HTML from or an actual HTML content string
    # @param [String] tag Required parameter: The HTML tag(s) to extract data from. This can just be a simple tag name like 'img' OR a CSS/jQuery style selector
    # @param [String] attribute Required parameter: If set, then extract data from the specified tag attribute.If not set, then data will be extracted from the tags inner content
    # @param [String] base_url Required parameter: Set a new base URL to be used for relative links scraped from the content
    # @return Result response from the API call
    def lookup(content, 
               tag, 
               attribute, 
               base_url)

      # Validate required parameters
      if content == nil
        raise ArgumentError.new "Required parameter 'content' cannot be nil."
      elsif tag == nil
        raise ArgumentError.new "Required parameter 'tag' cannot be nil."
      elsif attribute == nil
        raise ArgumentError.new "Required parameter 'attribute' cannot be nil."
      elsif base_url == nil
        raise ArgumentError.new "Required parameter 'base_url' cannot be nil."
      end

      # the base uri for api requests
      _query_builder = Configuration.base_uri.dup

      # prepare query string for API call
      _query_builder << '/'

      # process optional query parameters
      _query_builder = APIHelper.append_url_with_query_parameters _query_builder, {
        'content' => content,
        'tag' => tag,
        'attribute' => attribute,
        'base_url' => base_url,
        'api_key' => Configuration.api_key
      }

      # validate and preprocess url
      _query_url = APIHelper.clean_url _query_builder

      # prepare headers
      _headers = {
        'user-agent' => 'APIMATIC 2.0',
        'accept' => 'application/json'
      }

      # invoke the API call request to fetch the response
      _response = Unirest.get _query_url, headers: _headers

      # Endpoint error handling using HTTP status codes.
      if _response.code == 404
        return nil
      end

      # Global error handling using HTTP status codes.
      validate_response(_response)

      # Try to cast response to desired type
      if _response.body.instance_of? Hash
        begin
          Result.from_hash(_response.body)
        rescue Exception
          raise APIException.new "Invalid JSON returned.", _response.code, _response.body
        end
      end
    end
  end
end
