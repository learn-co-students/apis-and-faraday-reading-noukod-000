class SearchesController < ApplicationController
  def search
  end

  def foursquare
    begin
      @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
        req.params['client_id'] = 'RLHRV3ISQ4ULAZFE5IW44WFY4PZXYOTJRJ205UB1F1UPSPAD'
        req.params['client_secret'] = 'HYE3V220RQ4AAPZ13MDIO1QYZSZHKR24UPTT5XYSWXKYLVBC'
        req.params['v'] = '20160201'
        req.params['near'] = params[:zipcode]
        req.params['query'] = 'coffee shop'
        req.options.timeout = 2 #seconds
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
end
