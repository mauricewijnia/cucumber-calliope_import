# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cucumber/calliope_importer/version"

Gem::Specification.new do |spec|
  spec.name          = "cucumber-calliope_importer"
  spec.version       = Cucumber::CalliopeImporter::VERSION
  spec.authors       = ["Maurice Wijnia"]
  spec.email         = ["maurice.wijnia@spritecloud.com"]

  spec.summary       = %q{This gem adds a 'calliope-import' formatter to cucumber that uploads cucumber json output to the calliope.pro platform.}
  #spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "cucumber", "~> 2"
end
