require 'rubygems'
require 'sinatra'
require 'dm-sweatshop'
require 'dm-migrations'
require 'rack/test'

root = File.join(File.dirname(__FILE__), '..')

require "#{root}/amnesia"
require "#{root}/spec/support/helpers"
require "#{root}/spec/support/factory"

DataMapper.auto_migrate!

include Amnesia::Spec::Helper

set :public, "#{root}/public"
set :views,  "#{root}/views"
