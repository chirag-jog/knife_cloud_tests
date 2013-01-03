module KnifeCloudTests
  unless const_defined?(:VERSION)
    VERSION = '0.0.1'
  end
end

require 'rspec'
require 'knife_cloud_tests/matchers'
require 'knife_cloud_tests/knifeutils'
require 'knife_cloud_tests/helper'
require 'knife_cloud_tests/knife_factory'
require 'knife_cloud_tests/models/knife'
require 'knife_cloud_tests/models/knife_parameters'

