require "sinatra"

class App < Sinatra::Base
  get "/" do
    "<p>hello world</p>"
  end
end
