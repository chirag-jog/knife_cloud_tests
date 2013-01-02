# -*- coding: utf-8 -*-
# Author:: Chirag Jog (<chirag@clogeny.com>)
# Copyright:: Copyright (c) 2012 Opscode, Inc.

require 'active_support/concern'
require 'mixlib/shellout'
require 'factory_girl'
module RSpec
  module KnifeUtils    
    extend ActiveSupport::Concern
    included do      
      subject { knife_run }
      let(:knife_run) { run command }
      let(:command)   { fail 'Define let(:command) in the spec' }      
      let(:grep_cmd) { "" }
      let(:cmd_stdout) { @op }      
      let(:rs_v2) { "" }


      # Our test repository for all knife commands.  Note that this is
      # relative to the top-level opscode-pedant directory.
      let(:factory_object) {fail 'Define a FactoryGirl fixture'}
      let(:knife_config) { @knife_rb_path }

      def load_factory_girl()
        FactoryGirl.find_definitions
      end
      def load_knife_config()
        @knife_rb_path = FactoryGirl.build(:knifeconfig).generate_knife_config
      end
      # Convenience method for creating a Mixlib::ShellOut representation
      # of a knife command in our test repository
      def shell_out_command(cmd, msg)        
        cmd_local = "#{cmd}" + " -V" + "#{rs_v2}" + " -c #{knife_config}" + "#{grep_cmd}"
        shell_out = Mixlib::ShellOut.new("#{cmd_local}")          
        puts "#{msg}"
        puts "#{cmd_local}"
        @op = shell_out.tap(&:run_command).stdout
        puts "#{cmd_stdout}"
        return shell_out                
      end      

      # Convenience method for actually running a knife command in our
      # testing repository.  Returns the Mixlib::Shellout object ready for
      # inspection.
      def run(command_line)
        # shell_out(command_line).tap(&:run_command)
        shell_out_command(command_line, "Initiating knife command...")
      end

      def knife(knife_command)
        run "knife #{knife_command}"
      end
    end
    # Convenience function for grabbing a hash of several important
    # Mixlib::Shellout command configuration parameters.
    def self.command_setting(shellout_command)
      keys = [:cwd, :user, :group, :umask, :timeout, :valid_exit_codes, :environment]
      keys.inject({}) do |hash, attr|
        hash[attr] = shellout_command.send(attr)
        hash
      end
    end
  end
end
