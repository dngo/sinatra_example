# spec/app_spec.rb
require File.expand_path '../spec_helper.rb', __FILE__

describe MyApp do
  it "should not find the promotion" do
    get '/api/v1/users/1'
    expect(last_response.status).to eql(200)
    expect(last_response.body).to eql({message: "success!"}.to_json)
  end

end
