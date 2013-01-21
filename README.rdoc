=Knife Cloud Plugin Tests
Integration Tests for Knife cloud plugins using Rspec and FactoryGirl

==Description
  This package provides a framework to develop long running integration tests for the various knife cloud plugins. It uses Rspec for test case development while FactoryGirl to manage fixtures. The sample knife factory is show in lib/knife_cloud_tests/knife_factory_sample.rb

==Usage
  Create the knife_factory.rb (in lib/knife_cloud_tests) with valid values using the knife_factory_sample.rb.
  Build and Install the knife_cloud_tests gem.
  Develop integration tests leveraging the framework. Reference: [Integration tests for knife-bluelock](https://github.com/opscode/knife-bluelock/tree/master/spec/integration)


