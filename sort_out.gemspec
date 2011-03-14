# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sort_out/version"

Gem::Specification.new do |s|
  s.name        = "sort_out"
  s.version     = SortOut::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Felipe Diesel"]
  s.email       = ["felipediesel@gmail.com"]
  s.homepage    = "http://felipediesel.com"
  s.summary     = %q{ActiveRecord extension that makes easy to order fields.}
  s.description = %q{ActiveRecord extension that makes easy to order fields.}

  s.rubyforge_project = "sort_out"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
