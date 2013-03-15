!#~/.rvm/rubies/ruby-1.9.3-p327/bin/ruby

require 'rubygems'
require 'net/smtp'
require 'open-uri'
require './get_epoch_times.rb'
require './mailer.rb'
require './our_email.rb'

bob = SupportMailer.new
bob.deliver

#epoch = GetEpochTimes.new


#open("http://10.1.1.230:3000/plugins/rrdPlugin?action=arbreq&which=graph&arbfile=throughput&arbiface=eth1&arbip=&start=#{epoch.the_start_time}&end=#{epoch.the_end_time}&counter") { |f|
#  f.each_line { |line| p line }
#}
