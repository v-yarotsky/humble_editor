require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/pride'

lib = File.expand_path("../../lib", __FILE__)
$:.unshift lib

ENV["RACK_ENV"] = "test"

if ENV["COVERAGE"]
  require 'simplecov'
  if ENV["TRAVIS"]
    require 'coveralls'
    SimpleCov.formatter = Coveralls::SimpleCov::Formatter
  end
  SimpleCov.start do
    add_filter "/test/"
  end
  require 'humble_editor'
  Dir.glob(File.join(lib, "**", "*.rb")).each { |f| require f }
end

require 'humble_editor'

class HETest < Minitest::Test
  def self.test(name, &block)
    raise ArgumentError, "Example name can't be empty" if String(name).empty?
    block ||= proc { skip "Not implemented yet" }
    define_method "test_#{name}", &block
  end

  def self.xtest(*)
  end
end

