# -*- coding: utf-8 -*-
# Author:: Chirag Jog (<chirag@clogeny.com>)
# Copyright:: Copyright (c) 2012 Opscode, Inc.

class KnifeParams
	attr_accessor :server_url                       # "-s"                                          # Chef Server URL
  attr_accessor :server_url_l                     # "--server-url"                                # Chef Server URL
  attr_accessor :api_client_key                   # "-k"                                          # API Client Key
  attr_accessor :api_client_key_l                 # "--key"                                       # API Client Key
	attr_accessor :colored_optput                   # "--[no-]color"                                # Use colored output, defaults to enabled
	attr_accessor :config_file                      # "-c"                                          # The configuration file to use
  attr_accessor :config_file_l                    # "--config"                                    # The configuration file to use
  attr_accessor :defaults                         # "--defaults"                                  # Accept default values for all questions
  attr_accessor :disable_editing                  # "-d"                                          # Do not open EDITOR, just accept the data as is
  attr_accessor :disable_editing_l                # "--disable-editing"                           # Do not open EDITOR, just accept the data as is
  attr_accessor :editor                           # "-e"                                          # Set the editor to use for interactive commands
  attr_accessor :editor_l                         # "--editor"                                    # Set the editor to use for interactive commands
  attr_accessor :environment                      # "-E"                                          # Set the Chef environment
  attr_accessor :environment_l                    # "--environment"                               # Set the Chef environment
  attr_accessor :format                           # "-F"                                          # Which format to use for output
  attr_accessor :format_l                         # "--format"                                    # Which format to use for output
  attr_accessor :identity_file                    # "-i"                                          # The SSH identity file used for authentication
  attr_accessor :identity_file_l                  # "--identity-file"                             # The SSH identity file used for authentication
  attr_accessor :user                             # "-u"                                          # API Client Username
  attr_accessor :user_l                           # "--user"                                      # API Client Username
  attr_accessor :pre_release                      # "--prerelease"                                # Install the pre-release chef gems
  attr_accessor :print_after                      # "--print-after"                               # Show the data after a destructive operation
  attr_accessor :verbose                          # "-V"                                          # More verbose output. Use twice for max verbosity
  attr_accessor :verbose_l                        # "--verbose"                                   # More verbose output. Use twice for max verbosity
  attr_accessor :version_chef                     # "-v"                                          # Show chef version
  attr_accessor :version_chef_l                   # "--version"                                   # Show chef version
  attr_accessor :say_yes_to_all_prompts           # "-y"                                          # Say yes to all prompts for confirmation
  attr_accessor :say_yes_to_all_prompts_l         # "--yes"                                       # Say yes to all prompts for confirmation
  attr_accessor :help                             # "-h"                                          # Show help
  attr_accessor :help_l                           # "--help"                                      # Show help
end