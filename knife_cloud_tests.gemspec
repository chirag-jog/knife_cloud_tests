$:.push File.expand_path("../lib", __FILE__)
require "knife_cloud_tests"
Gem::Specification.new do |s|
  s.name = "knife_cloud_tests"
  s.version = KnifeCloudTests::VERSION
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chirag Jog"]
  s.date = "2012-12-12"
  s.summary = "Opscode Knife Cloud Tests"
  s.description = s.summary
  s.email = "oss@opscode.com"
  s.licenses = ["Apache 2.0"]
  s.extra_rdoc_files = [
    "LICENSE", "README.md"
  ]
  s.files = [Dir.glob("lib/**/*")]
  s.require_paths = %w[lib]
  s.add_dependency(%q<rspec>)
  s.add_dependency(%q<rspec_junit_formatter>)
  s.add_dependency(%q<factory_girl>)
  s.add_dependency(%q<mixlib-shellout>)
end
