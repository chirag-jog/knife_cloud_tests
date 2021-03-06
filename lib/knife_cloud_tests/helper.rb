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

def match_status(expect_params)
  expected_status = expect_params[:status]
  expected_statuscode = expect_params[:statuscode] || 0
  expected_stdout = expect_params[:stdout]
  expected_stderr = expect_params[:stderr]
  if "#{expected_status}" == "should fail"
    should_not have_outcome :status => expected_statuscode
  elsif "#{expected_status}" == "should succeed" or "#{expected_status}" == "should return empty list"
    should have_outcome :status => expected_statuscode
  end

  if expected_stdout.kind_of?(Array)
    expected_stdout.each {|output| should have_outcome :stdout => /#{output}/ }
  else
    should have_outcome :stdout => /#{expected_stdout}/
  end
  if expected_stderr.kind_of?(Array)
    expected_stderr.each {|err| should have_outcome :stderr => /#{err}/ }
  else
    should have_outcome :stderr => /#{expected_stderr}/
  end
end
