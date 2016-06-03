
<p align="center">
  <img src="https://app.expeditedaddons.com/scrapetastic.png"/>
  
</p>

<h1 align='center'>Scrapetastic</h1>

## Pull structured data from any website.

## Requirements

- An API Key from Heroku
    - Add from: https://elements.heroku.com/addons/scrapetastic

- Ruby v2.x or greater

## Usage

### Input Parameter Descriptions

| Index       | Name    | Example | Description |
| --------------- | ------- | -------- |--------|
|0|`content`|string|The HTML content. This can be either a URL to load HTML from or an actual HTML content string|
|1|`tag`|string|The HTML tag(s) to extract data from. This can just be a simple tag name like 'img' OR a CSS/jQuery style selector|
|2|`attribute`|string|If set, then extract data from the specified tag attribute.If not set, then data will be extracted from the tags inner content|
|3|`base_url`|string|Set a new base URL to be used for relative links scraped from the content|


### Making a Request

```ruby
$ > require 'scrapetastic'
=> true

# Note: the 'Controller' here is not a reference to Rails controllers
# but an internal structure, won't interfere with your Rails app and will 
# work fine in a standalone ruby app or another framework

$ > st = Scrapetastic::APIController.new
=> #<Scrapetastic::APIController:0x007fe6d2217b48>

$ > results = st.lookup("http://www.expeditedaddons.com","img","src","")
#<Scrapetastic::Result:0x007fe6d216d968 @total=12, @values=["/assets/weightsandmeasures-41630428d38c6cf1ccdc3a66787387ce8be978d5a95f0ae731d24bdfecfc8f4e.png", "/assets/ipinvestigator-a9e64a955ebb998330283eaecc562e4706ae883d098f9fd3d209c041f57c1fec.png", "/assets/resizer-65c642f73dc8b6e11b261cba3578d68b6447445128c10443750d534e3a74a861.png", "/assets/urlxray-4c282f6ba3c97dc9772836165fd30f945be9de81f2e7605904094f84df822840.png", "/assets/watermarker-fa8d776c93c622cee3764710e2a8ca9581942857e77bb34e114f89c2903b5e15.png", "/assets/iptoearth-b900526780eb7a1201b7b60ce2f7e30c7ab9225dfcd9475ccc75ebd2cb41e49a.png", "/assets/qrackajack-f2227d5d530812ddbab7165dc07ba0921835c255fcf8300d236946edcc729b08.png", "/assets/useragentidentifier-985199154ebe1f7399ef7dc8143806a10cfa9acc38726e0153520ea2cec13f62.png", "/assets/webtopdf-81b2f5bb4dc6697013f1eb583763eb8a6f896d880014a3b24962d61ceb1c9950.png", "/assets/geocody-80e9ca0c0d2577f95cf6c9f9a97d4ede077bc665dec2d51bacb0fad276014618.png", "/assets/realemail-b4b99f9740273a9936a25ecac846de47dbfa2fda52bb02ab3d0b87b2d93f77ee.png", "/assets/scrapetastic-3fadac07c29de0d2626119be13ecab6a4ad89463034e67bfb2a63c1d5ba4ebc3.png"]>

```

### Using Results

```ruby
$ > results.total
=> 12

$ > results.values[0]
=> "/assets/weightsandmeasures-41630428d38c6cf1ccdc3a66787387ce8be978d5a95f0ae731d24bdfecfc8f4e.png"

```




## Installation

```ruby
# In your Gemfile
gem 'scrapetastic', git: 'https://github.com/mbuckbee/Scrapetastic-Gem.git'
```    


## Result Attribute Descriptions

| Attribute       | Type    | Description |
| --------------- | ------- | -------- |
|`total`|integer|The total number of values extracted.|
|`values`|array|Array of extracted values|



## Live Interactive Testing

Doublecheck results, use a Live Proxy and check your API Key with the interactive documentation at:

http://docs.scrapetasticexp.apiary.io/

You will need your `SCRAPETASTIC_API_KEY` from the setup screen where you've provisioned the Scrapetastic add-on.

## Troubleshooting

As a sanity check it is sometimes useful to bypass your app stack and check the endpoint, your API Key and parameters directly.

*Test with your browser*

```
# Modify the following to use your actual API Key
'https://scrapetastic.expeditedaddons.com/?api_key=REPLACE_WITH_YOUR_SCRAPETASTIC_API_KEY&attribute=&base_url=&content=http%3A%2F%2Fwww.wikipedia.org&tag=img'
```

A successful call will return your requested data with a HTTP result code of `200` and be in `JSON` format. We recommend the [JSON Formatter](https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa?hl=en) extension as a useful tool. 

## In Development

The Scrapetastic gem relies upon the environment variable `ENV['SCRAPETASTIC_API_KEY']` being present and correctly configured to authenticate to the service. You will need to have this variable present in your local environment for the gem to work correctly.

If you're using Heroku, please read their [Guide to Heroku Local](https://devcenter.heroku.com/articles/heroku-local) which has instructions on easily copying your config values to your development environment.

**DOTENV**

[https://github.com/bkeepers/dotenv](https://github.com/bkeepers/dotenv)

If you're trying to use Scrapetastic in your local development or test environment with the [dotenv](https://github.com/bkeepers/dotenv) gem be sure that you are loading the `dotenv-rails` gem with the `rails-now` requirement. 

```ruby
# Example Gemfile excerpt

gem 'dotenv-rails', :require => 'dotenv/rails-now'
gem 'iptoearth'
```

**FOREMAN**

[https://github.com/ddollar/foreman](https://github.com/ddollar/foreman)

If you're having issues with configuring `dotenv`, you might want to try [foreman](https://github.com/ddollar/foreman) which will also autoload `.env` files in your local environment.


**Test in the Rails console**

Launch `rails c` in your development project directory and at the prompt enter `ENV[SCRAPETASTIC_API_KEY]` which, if you've configured your development environment correctly should display your API Key.

## Issues and Security Concerns

Please email [support@expeditedaddons.com](mailto:support@expeditedaddons.com)

## License

The Scrapetastic gem is licensed under the MIT license.

## Additional Add-ons

If you found Scrapetastic useful, please check out our other similarly structured services and gems.

<table>
  <tr>
    <td align='center' width='33%'>
       <img src="https://app.expeditedaddons.com/qrackajack_icon.png" width="70"/>
      <h5><a href='//www.expeditedaddons.com/qrackajack'>QRACKAJACK</a></h5>
      <p>Generate QR codes for use anywhere.</p>
    </td>
    
    <td align='center' width='33%'>
       <img src="https://app.expeditedaddons.com/weightsandmeasures_icon.png" width="70"/>
      <h5><a href='//www.expeditedaddons.com/weightsandmeasures'>WEIGHTS & MEASURES</a></h5>
      <p>Conversational interface to convert between units of measure.</p>
    </td>
    
    <td align='center' width='33%'>
       <img src="https://app.expeditedaddons.com/scrapetastic_icon.png" width="70"/>
      <h5><a href='//www.expeditedaddons.com/scrapetastic'>SCRAPETASTIC</a></h5>
      <p>Pull structured data from any website.</p>
    </td>

  </tr>
  
  <tr>
    <td align='center' width='33%'>
       <img src="https://app.expeditedaddons.com/useragentidentifier_icon.png" width="70"/>
      <h5><a href='//www.expeditedaddons.com/useragentidentifier'>USER AGENT IDENTIFIER</a></h5>
      <p>Boost User Agent identification with our always up to date UA parsing.</p>
    </td>
    
    <td align='center' width='33%'>
       <img src="https://app.expeditedaddons.com/ipinvestigator_icon.png" width="70"/>
      <h5><a href='//www.expeditedaddons.com/ipinvestigator'>IP INVESTIGATOR</a></h5>
      <p>Check if an IP address is hosting Proxies, Bots or Malware.</p>
    </td>
    
    <td align='center' width='33%'>
       <img src="https://app.expeditedaddons.com/resizer_icon.png" width="70"/>
      <h5><a href='//www.expeditedaddons.com/scrapetastic'>RESIZER</a></h5>
      <p>Resize images for Retina use, thumbnails and social promotion.</p>
    </td>

  </tr>  
  
  
  <tr>
    <td align='center' width='33%'>
       <img src="https://app.expeditedaddons.com/urlxray_icon.png" width="70"/>
      <h5><a href='//www.expeditedaddons.com/urlxray'>URL X-RAY</a></h5>
      <p>Pull website status and domain information for any URL.</p>
    </td>
    
    <td align='center' width='33%'>
       <img src="https://app.expeditedaddons.com/webtopdf_icon.png" width="70"/>
      <h5><a href='//www.expeditedaddons.com/webtopdf'>WEB TO PDF</a></h5>
      <p>Generate PDF Documents from Webpages.</p>
    </td>
    
    <td align='center' width='33%'>
       <img src="https://app.expeditedaddons.com/watermarker_icon.png" width="70"/>
      <h5><a href='//www.expeditedaddons.com/watermarker'>WATERMARKER</a></h5>
      <p>Identify and protect images by adding a watermark to them.</p>
    </td>

  </tr>    
  
  
  <tr>
    <td align='center' width='33%'>
       <img src="https://app.expeditedaddons.com/iptoearth_icon.png" width="70"/>
      <h5><a href='//www.expeditedaddons.com/iptoearth'>IP TO EARTH</a></h5>
      <p>Find the Country and City of origin for an IP Address.</p>
    </td>
    
    <td align='center' width='33%'>
       <img src="https://app.expeditedaddons.com/geocody_icon.png" width="70"/>
      <h5><a href='//www.expeditedaddons.com/geocody'>GEOCODY</a></h5>
      <p>Convert mailing addresses into Lat,Long Coordinates.</p>
    </td>
    
    <td align='center' width='33%' cellpadding='10'>
       <img src="https://app.expeditedaddons.com/realemail_icon.png" width="70"/>
      <h5><a href='//www.expeditedaddons.com/realemail'>REAL EMAIL</a></h5>
      <p>Reduce bounced emails and errors by validating emails against MX records.</p>
    </td>

  </tr>    

</table>





