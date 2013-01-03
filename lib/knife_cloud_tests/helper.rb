# -*- coding: utf-8 -*-
# Author:: Chirag Jog (<chirag@clogeny.com>)
# Copyright:: Copyright (c) 2012 Opscode, Inc.

# Method to prepare knife command

def prepare_knife_command(factory_object)
  puts "\n"
  # Below commented line is used to display the attributes and their values used inside a command
  # factory_object.instance_variables.each {|var| print var.to_s.delete("@") + ": " +  factory_object.instance_variable_get(var) + "\n"}
  cmd = ""
  factory_object.instance_variables.each {|var| cmd = cmd + factory_object.instance_variable_get(var) + " "}
  return cmd
end

# By default the factory for a test case generates an command option in the form --option 'its_valie_value'
# in case if a programmer needs read only the value part this method is used

def strip_out_command_key(value)
  return value.split(' ').last
end

# This is a common method for running shell out command

def find_instance_id(instance_name, list_command_output)
  file =  list_command_output.tap(&:run_command).stdout
  puts "searching instance id for instance with name : #{instance_name}..."
  # puts file
  file.lines.each do |line|
    if line.include?("#{instance_name}")
      puts "#{line}"
      return "#{line}".split(' ').first
    end
  end
end

def find_id(instance_name, line)
  if line.include?("#{instance_name}")
      puts "#{line}"
      return "#{line}".split(' ').first
  end
end

def match_status(test_run_expect)
  if "#{test_run_expect}" == "should fail"
    should_not have_outcome :status => 0
  elsif "#{test_run_expect}" == "should succeed"
    should have_outcome :status => 0
  elsif "#{test_run_expect}" == "should return empty list"
    should have_outcome :status => 0
  else
    should have_outcome :status => 0
  end
end
