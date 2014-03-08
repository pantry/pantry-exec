$:.push File.expand_path("../lib", __FILE__)
require "pantry/exec/version"

Gem::Specification.new do |s|
  s.name     = "pantry-exec"
  s.version  = Pantry::Exec::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors  = ["Collective Idea", "Jason Roelofs"]
  s.email    = ["code@collectiveidea.com", "jasongroelofs@gmail.com"]
  s.license  = "MIT"
  s.homepage = "http://pantryops.org/"

  s.summary     = "Run arbitrary shell commands on a Pantry Client."
  s.description = "Run arbitrary shell commands on a Pantry Client."

  s.required_ruby_version = ">= 2.0.0"

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- test/*`.split("\n")
  s.require_path = "lib"
  s.bindir       = "bin"

  s.add_runtime_dependency "pantry", "~> 0.1", ">= 0.1.0"
end
