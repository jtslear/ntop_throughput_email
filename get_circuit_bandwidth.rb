!#~/.rvm/rubies/ruby-1.9.3-p327/bin/ruby

require 'rubygems'
require 'net/smtp'
require 'open-uri'
require 'mail'
require './get_epoch_times.rb'
require './mailer.rb'

bob = Mailer.new
bob.deliver
