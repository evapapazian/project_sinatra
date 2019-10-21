
require 'csv'


class Gossip

attr_accessor :author , :content 

	def initialize (author, content)
		@author = author 
		@content = content
	end 

	def save
	  CSV.open("db/gossip.csv", "ab") do |csv|
	    csv <<  [@author, @content]
	  end
	end

	#la def all ressort tous les potins au format array 



	def self.all
	  all_gossips = []
	  CSV.read("./db/gossip.csv").each do |csv_line|
	    all_gossips << Gossip.new(csv_line[0], csv_line[1])
	  end
	  return all_gossips

	end
	#Cette def enregistre tous les gossips du fichier CSV dans un tableau


	def self.find (id)
		return Gossip.all[id]
	end



	def self.update 
		CSV.read("./db/gossip.csv").each do |csv_line|
	    all_gossips << Gossip.new(csv_line[0], csv_line[1])
	    gossip_author = new_gossip_author
	    gossip_content = new_gossip_content
	end 
	end
	#Cette def devrait admninistrer la nouvelle valeur à l'auteur et au contenu, après que l'utilisateur aie édité le gossip.

end

 