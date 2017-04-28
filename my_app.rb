require 'sinatra'
require "sinatra/activerecord"

class User < ActiveRecord::Base
  validates_presence_of :name
end

class MyApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  get '/api/v1/users/:user_id' do
    status 200
    {message: "success!"}.to_json
  end

end
