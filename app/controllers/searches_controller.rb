class SearchesController < ApplicationController
  def search
  end

  def foursquare
  end
end

# searches_controller.rb
def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = QYC3BESLGFO3S2MLZGTGGQ1N2MSEND4SBRTP1NSXDHZWGCNG
      req.params['client_secret'] = ZINWTLT0WR0OEL4GOH0TM3BQPI33UBPLH3LRHJN0DV3PZ1WI
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    render 'search'
  end
