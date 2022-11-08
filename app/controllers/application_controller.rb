class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # add routes
  get '/' do
    "Hello World"
  end

  get '/bakeries' do
    "Hello World"
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
  # GET /bakeries/:id returns a single bakery as JSON with its baked goods nested
    #get a single bakery from the database
    bakery = Bakery.find(params[:id])
    #send back as JSON with baked goods in nested array
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
  # GET /baked_goods/by_price returns an array of baked goods as JSON, sorted by price in descending order
      #get baked goods from the database
      baked_goods = BakedGood.all.order(:price).reverse_order
      #send back as JSON sorted by price in descending order
      baked_goods.to_json
  end
    
  get '/baked_goods/most_expensive' do
    # GET /baked_goods/most_expensive returns the single most expensive baked good as JSON (HINT: how can you sort the baked goods in a particular order?)
      #get baked goods from the database
      baked_goods = BakedGood.order(:price).reverse_order.first!
      #send back as JSON sorted by price in descending order
      baked_goods.to_json
  end
      

end
