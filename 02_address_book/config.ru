# frozen_string_literal: true

require "logger"
require "rack"
require "ezframe"

use Rack::Session::Pool
#use Rack::Static, urls: ["/image", "/js", "/css"], root: "asset"
use Rack::ShowExceptions
#run Ezframe::Server.new
run Rack::Cascade.new([
  Rack::File.new("./asset"), 
  Rack::File.new("#{Gem::loaded_specs['ezframe'].load_paths[0]}/../asset"), 
  Ezframe::Server.new
])

