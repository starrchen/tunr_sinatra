#artist index
get '/artists' do
  @artists = Artist.all
  erb :"artists/index"
end

#new artist page
get '/artists/new' do
  erb :"artists/new"
end

# new artist form
post '/artists/new' do
  @name = params[:name]
  @photo_url = params[:photo_url]
  @nationality = params[:nationality]
  @new_artist = Artist.create(name: @name, photo_url: @photo_url, nationality: @nationality)
  redirect "/artists/" + @new_artist.id.to_s
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb :"artists/artist_id"
end

get '/artists/edit' do
  @artist = Artist.find(params[:id])
  erb :"artists/edit"
end
