# -*- coding: utf-8 -*-
# Author:: Chirag Jog (<chirag@clogeny.com>)
# Copyright:: Copyright (c) 2012 Opscode, Inc.

require 'tmpdir'
require 'erubis'
class KnifeConfig
#Build out the knife.rb
# current_dir = File.dirname(__FILE__)
# log_level                :info
# log_location             STDOUT
# node_name                "chiragjog"
# client_key               "#{current_dir}/chiragjog.pem"
# validation_client_name   "terremark-validator"
# validation_key           "#{current_dir}/terremark-validator.pem"
# chef_server_url          "https://api.opscode.com/organizations/terremark"
# cache_type               'BasicFile'
# cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
# cookbook_path            ["#{current_dir}/../cookbooks"]
  attr_accessor :name, :api_url, :test_repository_path, :key, :knife_dir
  attr_accessor :validation_key, :validation_client_name

  def knife_dir
    @_knife_dir ||= Dir.mktmpdir
  end

  def knife_rb_path
    "#{knife_dir}/knife.rb"
  end   
  
  # Generate a knife.rb file from a template for a given user.
  def generate_knife_files
    puts "Generating knife files: #{knife_rb_path}"

    # The template file is currently located right next to this
    # source file... seemed like the sanest place for it at the time
    template = File.read(Pathname.new(__FILE__).dirname.join("knife.rb.erb"))

    template = Erubis::Eruby.new(template)
    File.open(knife_rb_path, 'w') do |f|
      f.write(template.result(knife_user:               name,
                              key_dir:                  knife_dir,
                              server_url:               api_url,
                              test_repository_dir:      test_repository_path,
                              validation_client_name:   validation_client_name))
    end
  end
    # Write out the key out as a PEM file. The name of the PEM file will be "USER_NAME.pem".
  def generate_user_pem
    File.open("#{knife_dir}/#{name}.pem", 'w') {|f| f.write(key)}
    File.open("#{knife_dir}/#{validation_client_name}.pem", 'w') {|f| f.write(validation_key)}    
  end

  def generate_knife_config
      puts "Populating dot_chef for knife user: #{name}"
      generate_knife_files
      generate_user_pem
      return knife_rb_path
  end
end
