require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
require('pry')
also_reload('lib/**/*.rb')


get ('/') do
  erb(:new_parcel)
end

# get('/parcel/:id') do
#
# end

get('/parcels') do
  @parcels = Parcel.all()
  erb(:display_parcels)
end


post('/parcels') do
  @parcel = Parcel.new(params[:Height].to_i, params[:Length].to_i, params[:Width].to_i, params[:Weight].to_i)
  @parcel.calculateCost
  @parcels = Parcel.all()
  erb(:display_parcels)
end
