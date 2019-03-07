class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = UWVZFBDBPFOWDKFISFIDJTHG1UQLE2RNWTHVDCBHH0YGSNO5
      req.params['client_secret'] = DNWDM550EHL2GI4Z3W2EMODT4FHN4LZTXEIUS4XFR4AQ5ZXX
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    render 'searches/earch'
end