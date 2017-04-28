require "./my_app"
require "sinatra/activerecord/rake"
Dir.glob('lib/tasks/*.rake').each { |r| load r}

require "sinatra/activerecord/rake"
