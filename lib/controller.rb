#require 'bundler' ==> Ce n'est plus nécessaire car on les a dans le config.ru
#Bundler.require
require 'gossip'


class ApplicationController < Sinatra::Base		#ApplicationController hérite de toutes les bases de Sinatra, toutes ses fonctions 
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
 end

 get '/gossips/new/' do
 	erb :new_gossip
 end

post '/gossips/new/' do
  Gossip.new(params["gossip_author"],  params["gossip_content"]).save  #C'est gossip_author parce que c'est les noms qu'on a attribués dans le new_gossip.erb. Et on enregistre avec params
  redirect '/'
end


get '/gossips/:id/' do

erb :show, locals: {affichage_du_potin: Gossip.all[params[:id].to_i], id: params[:id].to_i}
#on définit que id=params[:id].to_i, pour pas avoir besoin de le répéter à chaque fois s

#Méthode de Léa :
#erb :show, locals: {affichage_du_potin: Gossip.all.find(params['id'].to_i)}
#<p> Voici le contenu du potin : <%= Gossip.all[params['id'].to_i].content %></p> (dans le show.erb)



end 


  #run! if app_file == $0	==> ce n'est plus nécessaire car on l'a dans le config.ru
end
