#Le .ru signifie que c'est un fichier de type rack up

require 'bundler'
Bundler.require


$:.unshift File.expand_path("./../lib", __FILE__)	 #pour qu'il prenne en compte tous les fichiers dans le dossier lib 

require 'controller'

run ApplicationController