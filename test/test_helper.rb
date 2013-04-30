require 'minitest/autorun'
begin
  require 'turn/autorun'
  Turn.config.format = :outline
  rescue LoadError;
end
require File.expand_path('../../lib/smart_methods.rb', __FILE__)