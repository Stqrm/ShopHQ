#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
	validates :name, presence: true   	#hash as 2nd argument (parameter)  
	validates :phone, presence: true	#presence means required
	validates :datestamp, presence: true
	validates :color, presence: true

end


class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do
	@barbers = Barber.order "created_at DESC"
	erb :index			
end

get '/visit' do
	erb :visit
end

post '/visit' do
	
	c = Client.new params[:client]

	c.save

	erb "<h2>Thank you! You signed!</h2>"

end