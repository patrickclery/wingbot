# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

require 'support/simplecov'
require 'dry-struct'

require 'support/rspec'
require 'support/shoulda_matchers'
require 'support/factory_bot'
require 'support/faker'
require 'support/database_cleaner'
require 'support/tinder_client'