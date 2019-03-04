class SearchesController < ApplicationController

    begin
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
        req.params['client_id'] = 'UASAQHFP0CVD2G0EQAF3PHPLTLHAZOQH5AAKTW0QSMKGUSIH'
        req.params['client_secret'] = 'YWPWELMXB5WI5HV1Z2FQUWGD4TS4XHFXD1VQK4VEYZSLQTBP'
        req.params['v'] = '20160201'
        req.params['near'] = params[:zipcode]
        req.params['query'] = 'coffee shop'
        req.options.timeout = 0
      end
      body = JSON.parse(@resp.body)
      if @resp.success?
        @venues = body["response"]["venues"]
      else
        @error = body["meta"]["errorDetail"]
      end
 
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
end