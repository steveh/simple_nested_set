$:.unshift File.expand_path('../lib', __FILE__)
require 'simple_nested_set/version'

Gem::Specification.new do |s|
  s.name         = "simple_nested_set"
  s.version      = SimpleNestedSet::VERSION
  s.authors      = ["Sven Fuchs"]
  s.email        = "svenfuchs@artweb-design.de"
  s.homepage     = "http://github.com/svenfuchs/simple_nested_set"
  s.summary      = "a simple to use nested set solution for ActiveRecord 3"
  s.description  = "simple_nested_set allows to easily handle nested sets in ActiveRecord"

  s.files        = Dir.glob("lib/**/**")
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.rubyforge_project = '[none]'

  s.add_dependency             'activerecord', '~> 3.0.3'
  s.add_dependency             'gem_patching'

  s.add_development_dependency 'test_declarative'
  s.add_development_dependency 'sqlite3-ruby'
  s.add_development_dependency 'database_cleaner', '0.5.2'
  s.add_development_dependency 'ruby-debug'
end
