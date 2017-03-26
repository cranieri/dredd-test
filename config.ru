# config.ru
ENV["RACK_ENV"] = "test"
require './app/app'
run MyApp
